# Implementation Plan: Runtime Marshalling Tests (Phase 4)

> Source: `gir_gen/docs/plans/milestone-2-signals-phase4.md`

## Overview

This plan adds runtime test coverage for the closure-marshal path in `ml_closure_marshal`. The existing test helpers (`Gobject.Test.invoke_closure_*`) all pass `NULL` for the return GValue — the bool/int return copy-back path and the exception-escape handler have zero coverage. The plan also adds wired widget signal tests that validate generated signal connectors (L1 + L2) end-to-end against real GTK widgets.

The work is in three epochs: Epoch 1 adds C test helpers plus an exception-escape observation flag in the runtime; Epoch 2 writes standalone alcotest suites exercising multi-param dispatch, enum/flags dispatch, return copy-back, exception escape, and GC interaction (no display required); Epoch 3 writes xvfb-gated widget signal tests against `Button.clicked`, `Notebook.page-added`, `Window.close-request`, and `EventControllerKey.key-pressed`.

## Epoch 1: C test helpers and exception-escape flag

> Goal: `dune build` passes with 6 new C helpers and 2 exception-flag bindings available in `Gobject.Test`

### Stage 1.1 — Exception-escape flag in ml_gobject.c

**Goal**: Add a static exception-escape flag and two C functions to read/clear it, plus wire the flag into `ml_closure_marshal`'s exception handler.

**Files**:
- `ocgtk/src/common/ml_gobject.c` — add `ml_closure_exception_flag` static variable, `ml_test_reset_closure_exception_flag`, `ml_test_check_closure_exception_flag`; add `ml_closure_exception_flag = 1;` in the `Is_exception_result` branch of `ml_closure_marshal`.

**Steps**:
1. After the existing `/* Test Helpers */` section (line ~1063), add a new `/* Exception-escape observation flag */` section with `static int ml_closure_exception_flag = 0;`
2. Add `ml_test_reset_closure_exception_flag` (sets flag to 0, returns unit)
3. Add `ml_test_check_closure_exception_flag` (returns `Val_bool(flag)`)
4. In `ml_closure_marshal`, in the `Is_exception_result(result)` block, add `ml_closure_exception_flag = 1;` as the first statement after `exn = Extract_exception(result);`

**Acceptance criteria**:
- [ ] `dune build` passes with no errors or warnings
- [ ] `grep ml_closure_exception_flag ocgtk/src/common/ml_gobject.c` shows the declaration, the set in `ml_closure_marshal`, and the two accessor functions

---

### Stage 1.2 — Enum/flags type registration helpers

**Goal**: Add `ensure_test_types()` and two invocation helpers for enum and flags param dispatch with bool return.

**Files**:
- `ocgtk/src/common/ml_gobject.c` — after the exception-flag section, add `test_enum_type_id`, `test_flags_type_id`, `ensure_test_types()`, `ml_test_invoke_closure_enum_return_bool`, and `ml_test_invoke_closure_flags_return_bool`.

**Steps**:
1. Add static `test_enum_type_id` and `test_flags_type_id` (initialized to `G_TYPE_INVALID`)
2. Add `ensure_test_types()` that registers `TestEnum` (3 values: 0/1/2) and `TestFlags` (3 flags: 1/2/3) via `g_enum_register_static`/`g_flags_register_static`
3. Add `ml_test_invoke_closure_enum_return_bool` — calls `ensure_test_types()`, packs one GValue typed as `test_enum_type_id`, invokes with `&return_value` (bool), reads back `g_value_get_boolean`
4. Add `ml_test_invoke_closure_flags_return_bool` — same pattern with `test_flags_type_id`

**Acceptance criteria**:
- [ ] `dune build` passes with no errors or warnings
- [ ] `grep ensure_test_types ocgtk/src/common/ml_gobject.c` shows definition and two call sites
- [ ] No GTK headers needed (the functions use only GLib type registration APIs)

---

### Stage 1.3 — Mixed-param and int-return invocation helpers

**Goal**: Add two more C helpers: multi-param dispatch with bool return, and zero-param invocation with int return.

**Files**:
- `ocgtk/src/common/ml_gobject.c` — after the enum/flags helpers, add `ml_test_invoke_closure_mixed_return_bool` and `ml_test_invoke_closure_return_int`.

**Steps**:
1. Add `ml_test_invoke_closure_mixed_return_bool` — packs 3 GValues (G_TYPE_INT, G_TYPE_STRING, G_TYPE_OBJECT), invokes with `&return_value` (bool), reads back `g_value_get_boolean`, handles nullable object arg
2. Add `ml_test_invoke_closure_return_int` — packs 0 params, invokes with `G_TYPE_INT` return value, reads back `g_value_get_int`

**Acceptance criteria**:
- [ ] `dune build` passes with no errors or warnings
- [ ] Functions use proper `CAMLparam`/`CAMLreturn` macros
- [ ] GValue cleanup (unset) is called for all initialized GValues
- [ ] Nullable object handling: `invoke_closure_mixed_return_bool` checks `Is_block(obj_arg)` before calling `ml_gobject_ext_of_val`

---

### Stage 1.4 — OCaml external declarations and signatures

**Goal**: Add 6 external declarations to `Gobject.Test` in `gobject.ml` and corresponding val entries in `gobject.mli`.

**Files**:
- `ocgtk/src/common/gobject.ml` — add to `module Test`
- `ocgtk/src/common/gobject.mli` — add to `module Test`

**Steps**:
1. In `gobject.ml`'s `module Test`, after the existing 6 `invoke_closure_*` externals, add:
   - `external invoke_closure_mixed_return_bool : g_closure -> int -> string -> 'a obj option -> bool`
   - `external invoke_closure_enum_return_bool : g_closure -> int -> bool`
   - `external invoke_closure_flags_return_bool : g_closure -> int -> bool`
   - `external invoke_closure_return_int : g_closure -> int`
   - `external reset_closure_exception_flag : unit -> unit`
   - `external check_closure_exception_flag : unit -> bool`
2. In `gobject.mli`'s `module Test`, add corresponding `val` declarations with doc comments

**Acceptance criteria**:
- [ ] `dune build` passes — all externals resolve to C symbols
- [ ] `grep invoke_closure_mixed_return_bool ocgtk/src/common/gobject.ml` shows the declaration
- [ ] All 6 new declarations are present in `.mli`

---

## Epoch 2: Standalone Closure Marshalling Tests

> Goal: `dune test ocgtk/` passes `test_signal_marshalling` (9 tests, no xvfb)

### Stage 2.1 — Create test file and dune entry for standalone marshalling tests

**Goal**: Create `test_signal_marshalling.ml` and add its dune test entry.

**Files**:
- `ocgtk/tests/gtk/test_signal_marshalling.ml` — create new file
- `ocgtk/tests/gtk/dune` — add test entry

**Steps**:
1. Create `test_signal_marshalling.ml` with `open Alcotest`, `open Ocgtk_gtk.Gtk`
2. Add the dune test entry (no `gtk_test_helpers` dependency, no `foreign_stubs`):
   ```
   (test
    (name test_signal_marshalling)
    (modules test_signal_marshalling)
    (libraries ocgtk.common ocgtk.gtk alcotest))
   ```
3. Verify `dune build` compiles the new test (even if tests are empty)

**Acceptance criteria**:
- [ ] `dune build` passes with the new test target
- [ ] `dune test ocgtk/` sees `test_signal_marshalling` in output (0 tests initially, no failure)

---

### Stage 2.2 — Tests M1, M2: multi-param dispatch with bool return

**Goal**: Implement two test cases exercising 3-param closure (int, string, GObject) with bool return via `invoke_closure_mixed_return_bool`.

**Files**:
- `ocgtk/tests/gtk/test_signal_marshalling.ml`

**Steps**:
1. Implement `test_mixed_params_bool_return_true` — creates a `Wrappers.Button.new_()` as dummy, creates a closure that captures int/string/obj from argv (positions 1,2,3), calls `Gobject.Value.set_boolean` on result with `true`, invokes via `invoke_closure_mixed_return_bool`, asserts return is `true` and captured values match
2. Implement `test_mixed_params_bool_return_false` — same pattern but returns `false`
3. Register both in the alcotest runner using `run "Signal Marshalling" [("multi_param", [...])]`
4. Run `dune test ocgtk/` — both pass

**Acceptance criteria**:
- [ ] `dune test ocgtk/` passes M1 and M2 (no xvfb needed since `Wrappers.Button.new_()` works headless as validated in existing tests)
- [ ] Tests use `Alcotest.(check int)`, `Alcotest.(check string)`, `Alcotest.(check bool)` appropriately

---

### Stage 2.3 — Tests M3, M5: void return and nullable GObject

**Goal**: Test `connect_simple`-style void-return closure and nullable GObject param handling.

**Files**:
- `ocgtk/tests/gtk/test_signal_marshalling.ml`

**Steps**:
1. Implement `test_void_return_0_params` — creates a closure that flips a ref, invokes via existing `invoke_closure_void`, asserts ref was flipped
2. Implement `test_null_gobject_param` — passes `None` as object arg to `invoke_closure_mixed_return_bool`, asserts callback receives `None`
3. Register in alcotest runner

**Acceptance criteria**:
- [ ] `dune test ocgtk/` passes M3 and M5
- [ ] M5 callback uses `Gobject.Value.get_object` (returns `option`) to handle null

---

### Stage 2.4 — Tests M4, M7, M8, M9: exception escape, enum, int return, flags

**Goal**: Test exception-escape flag, enum dispatch, int return copy-back, and flags dispatch.

**Files**:
- `ocgtk/tests/gtk/test_signal_marshalling.ml`

**Steps**:
1. Implement `test_exception_escape` — resets flag, creates closure that raises `Failure "test exception"`, invokes via `invoke_closure_void`, asserts `check_closure_exception_flag()` returns `true`
2. Implement `test_enum_dispatch` — defines local `test_enum_of_int` decoder (0→`NONE`, 1→`ONE`, 2→`TWO`), creates closure that decodes param at pos 1 via `Gobject.Value.get_enum_int` and returns true, invokes via `invoke_closure_enum_return_bool`, asserts return and decoded value
3. Implement `test_int_return` — closure sets int 99 on result via `Gobject.Value.set_int`, invokes via `invoke_closure_return_int`, asserts return is 99
4. Implement `test_flags_dispatch` — defines local `test_flags_of_int` decoder, creates closure that decodes param at pos 1 via `Gobject.Value.get_flags_int`, invokes via `invoke_closure_flags_return_bool` with value 3 (bits 0 and 1), asserts decoded flags contain `A` and `B`
5. Register in alcotest runner

**Acceptance criteria**:
- [ ] `dune test ocgtk/` passes M4, M7, M8, M9 (no xvfb needed — `ensure_test_types()` uses GLib type system only)
- [ ] M4 assertion: `check_closure_exception_flag ()` returns true without crashing the process
- [ ] M7/M9 use `List.sort Stdlib.compare` for comparison to handle ordering

---

### Stage 2.5 — Test M6: GC safety

**Goal**: Test that 50 mixed-type closures survive minor GC collections.

**Files**:
- `ocgtk/tests/gtk/test_signal_marshalling.ml`

**Steps**:
1. Implement `test_gc_safety` — loop 50 times, each iteration creates a closure with `Gobject.Closure.create`, invokes it with mixed params, calls `Gc.minor()` every 10th iteration, all closures must return correct values
2. Register in alcotest runner under `"gc"` group

**Acceptance criteria**:
- [ ] `dune test ocgtk/` passes M6
- [ ] Test runs without segfault or `Fatal error: exception Invalid_argument("closure_get_arg: invalid argv")`

---

## Epoch 3: Wired Widget Signal Tests

> Goal: `xvfb-run dune test ocgtk/` passes `test_signal_widget` (6 tests, xvfb required)

### Stage 3.1 — Create C stubs for cross-namespace signal emission

**Goal**: Create `test_signal_widget_stubs.c` with `ml_test_emit_key_pressed_signal`.

**Files**:
- `ocgtk/tests/gtk/test_signal_widget_stubs.c` — create new file

**Steps**:
1. Create `test_signal_widget_stubs.c` with `#include <gtk/gtk.h>` and `#include <caml/mlvalues.h>`
2. Declare `extern gpointer ml_gobject_ext_of_val(value v);`
3. Implement `ml_test_emit_key_pressed_signal` — looks up `"key-pressed"` signal via `g_signal_lookup`, resolves `GdkModifierType` via `g_type_from_name`, constructs 4 GValues (instance + uint keyval + uint keycode + GdkModifierType flags), calls `g_signal_emitv`, returns bool result
4. Use `CAMLparam4`, `CAMLreturn` with proper cleanup (unset all GValues)

**Acceptance criteria**:
- [ ] `dune build` passes with the new C file compiled
- [ ] `grep g_signal_emitv ocgtk/tests/gtk/test_signal_widget_stubs.c` shows the call

---

### Stage 3.2 — Create test file and dune entry for wired widget tests

**Goal**: Create `test_signal_widget.ml` skeleton and add its dune test entry with foreign stubs.

**Files**:
- `ocgtk/tests/gtk/test_signal_widget.ml` — create new file
- `ocgtk/tests/gtk/dune` — add test entry

**Steps**:
1. Create `test_signal_widget.ml` with `open Alcotest`, `open Ocgtk_gtk.Gtk`, `module Helpers = Gtk_test_helpers`, `let require_gtk = Helpers.require_gtk`
2. Add the dune test entry after the existing `test_gobject_equality` entry:
   ```
   (test
    (name test_signal_widget)
    (modules test_signal_widget)
    (foreign_stubs
     (language c)
     (names test_signal_widget_stubs)
     (flags
      (:include %{project_root}/src/gtk/cflag-gtk4.sexp)))
    (libraries ocgtk.gtk alcotest gtk_test_helpers))
   ```
3. Verify `dune build` compiles

**Acceptance criteria**:
- [ ] `dune build` passes with the new test target
- [ ] `dune test ocgtk/` shows the test (skipped without xvfb)

---

### Stage 3.3 — Tests 1, 2: Button clicked (simple and after)

**Goal**: Test `Button.on_clicked` via L2 class method and verify callback order with `?after`.

**Files**:
- `ocgtk/tests/gtk/test_signal_widget.ml`

**Steps**:
1. Implement `test_button_clicked` — creates `Wrappers.Button.new_()`, wraps in L2 `new Button.button btn_obj`, connects via `btn#on_clicked ~callback`, calls `Wrappers.Button.clicked btn_obj`, asserts callback ref was flipped
2. Implement `test_button_clicked_after` — connects two handlers (one default, one `~after:true`), asserts firing order is `["second"; "first"]`
3. Register in alcotest runner gated with `require_gtk`

**Acceptance criteria**:
- [ ] `xvfb-run dune test ocgtk/` passes tests 1 and 2
- [ ] The `?after:true` test verifies handler ordering, not just that both fire

---

### Stage 3.4 — Test 3: CheckButton toggled

**Goal**: Test void-return zero-param signal on a `Gtk.CheckButton` via L2 class.

**Files**:
- `ocgtk/tests/gtk/test_signal_widget.ml`

**Steps**:
1. Implement `test_check_button_toggled` — creates `Wrappers.Check_button.new_()`, sets active to false, connects `on_toggled`, calls `set_active true`, asserts callback fired and state changed
2. Register in alcotest runner gated with `require_gtk`

**Acceptance criteria**:
- [ ] `xvfb-run dune test ocgtk/` passes test 3
- [ ] Verify `Wrappers.Check_button.get_active` returns `true` after `set_active true`

---

### Stage 3.5 — Tests 4, 5: Notebook page-added and Window close-request

**Goal**: Test generated `on_page_added` (GObject + int params) and `on_close_request` (bool return).

**Files**:
- `ocgtk/tests/gtk/test_signal_widget.ml`

**Steps**:
1. Implement `test_page_added` — creates `Wrappers.Notebook.new_()`, wraps in L2, creates a child `Wrappers.Button.new_()`, connects `on_page_added`, calls `Wrappers.Notebook.append_page nb_obj child_obj None`, asserts captured child is `Some` and page_num is 0
2. Implement `test_close_request` — creates `Wrappers.Window.new_()`, wraps in L2, connects `on_close_request ~callback:(fun () -> called := true; false)`, calls `Wrappers.Window.close obj` (or `g_signal_emit_by_name`), asserts callback fired
3. Register in alcotest runner gated with `require_gtk`

**Acceptance criteria**:
- [ ] `xvfb-run dune test ocgtk/` passes tests 4 and 5
- [ ] Test 4: uses `Gobject.Value.get_object_exn` pattern (matching generated L1 code)
- [ ] Test 5: close-request callback returns `false` to allow close; test verifies callback was called

---

### Stage 3.6 — Test 6: EventControllerKey key-pressed (cross-namespace)

**Goal**: Test `on_key_pressed` with `GdkModifierType` flags param via C signal emission helper.

**Files**:
- `ocgtk/tests/gtk/test_signal_widget.ml`

**Steps**:
1. Declare `external emit_key_pressed_signal : Event_controller_key.t -> int -> int -> int -> bool = "ml_test_emit_key_pressed_signal"`
2. Implement `test_key_pressed_cross_namespace` — creates `Event_controller_key.new_()` (check if constructor exists via Wrappers), wraps in L2, connects `on_key_pressed`, emits via C helper with keyval=97, keycode=12, state=1 (SHIFT_MASK bit), asserts return is `true` and captured state contains `SHIFT_MASK`
3. Register in alcotest runner gated with `require_gtk`

**Acceptance criteria**:
- [ ] `xvfb-run dune test ocgtk/` passes test 6
- [ ] The test imports `Ocgtk_gdk.Gdk_enums` to compare against `modifiertype` variant tags (e.g., `List.mem `SHIFT_MASK`)
- [ ] `grep g_signal_lookup ocgtk/tests/gtk/test_signal_widget_stubs.c` confirms signal lookup by name
