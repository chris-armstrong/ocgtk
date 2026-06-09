# Phase 4: Runtime Marshalling Tests

**Status: PLANNING**
**Created: 2026-06-06**
**Updated: 2026-06-07**
**Parent: [Milestone 2: Signal Handling with Parameters](./milestone-2-signals.md)**
**Branch: `signals`**

## Overview

Phase 4 closes the runtime test coverage gaps identified in the milestone plan.
The `ml_closure_marshal` entrypoint handles arbitrary-arity GValue dispatch and
non-void return copy-back, but the existing test helpers
(`Gobject.Test.invoke_closure_*`) all pass `NULL` for the return GValue — no
existing test exercises the full bool-return or int-return copy-back path.

**Context:** Remaining Work 1 (GObject class params) and Work 2 (L2 type
conversion) are already complete in the generator and runtime. Generated
bindings already emit L1 signals with GObject params and L2 forwarders with
`new widget` / `Option.map` wrapping (observed in `gNotebook.ml`). Phase 4 is
purely about adding runtime tests to exercise those paths.

Phase 4 adds C test helpers that exercise the complete marshal path (multi-param
dispatch, enum/flags param dispatch, bool/int return copy-back, exception
escape detection), then layers OCaml alcotest suites on top: standalone closure
tests (no display) and wired widget signal tests (xvfb required).

### Goal

Every generated signal-pattern archetype is exercised at runtime:
multi-param dispatch, bool return copy-back, int return copy-back, void return,
exception escape, nullable GObject params, enum/flags dispatch (including
cross-namespace decoder paths), and GC interaction. Wired widget tests validate
that generated signal connectors (L1 + L2) work end-to-end against real GTK
widgets, including cross-namespace signals with Gdk flags params.

### Non-goals

- Testing every generated signal (corpus regression is Phase 6)
- AT-SPI E2E testing (existing calculator pattern, out of scope here)
- Testing boxed records, callbacks, or non-In direction params (Milestone 4)
- Testing string/GObject return copy-back (corpus regression is Phase 6)

---

## Part A: C test helpers and exception-escape flag

### Problem

The 6 existing `Gobject.Test.invoke_closure_*` functions all pass `NULL` as the
`g_closure_invoke` return-value pointer. The return copy-back path
(`ml_closure_marshal`: after the OCaml callback returns, the result GValue is
copied back into the caller's `return_value`) has zero coverage. Additionally,
the exception handler in `ml_closure_marshal` logs via `g_warning` but has no
OCaml-observable side effect — there is no way for tests to assert that an
exception was caught.

### Design

Six additions to `ml_gobject.c`:

1. **`invoke_closure_mixed_return_bool`** — Packs 3 GValues (`G_TYPE_INT`,
   `G_TYPE_STRING`, `G_TYPE_OBJECT`), invokes with `&return_value` (bool),
   reads back `g_value_get_boolean`. Exercises multi-param dispatch, mixed
   types, nullable GObject, and bool return copy-back.

2. **`invoke_closure_enum_return_bool`** — Packs 1 GValue typed as a
   dynamically-registered `TestEnum` GType, invokes with bool return.
   Exercises the full `G_TYPE_ENUM` → `g_value_set_enum` /
   `g_value_get_enum` → `get_enum_int` path. Uses a C-local
   `ensure_test_types()` that calls `g_enum_register_static` on first use
   (no GTK init required).

3. **`invoke_closure_flags_return_bool`** — Same pattern but with a
   dynamically-registered `TestFlags` GType (`g_flags_register_static`).
   Exercises the full `G_TYPE_FLAGS` → `set_flags_int` / `get_flags_int` path,
   which is the same path used for cross-namespace signals like `key-pressed`
   with `Gdk.ModifierType`.

4. **`invoke_closure_return_int`** — Invokes with 0 params and an
   `G_TYPE_INT` return value. Reads back `g_value_get_int`. Exercises
   non-bool non-void return copy-back.

5. **Exception-escape flag** — A `static int ml_closure_exception_flag` set to
   `1` in the exception handler branch of `ml_closure_marshal`, plus two OCaml
   bindings (`reset_closure_exception_flag`, `check_closure_exception_flag`)
   that clear and read the flag. Test M4 resets the flag, invokes a closure
   that raises, then asserts the flag is `true`.

6. **`emit_key_pressed_signal`** — Takes an `EventControllerKey` object,
   keyval, keycode, and modifier-state integers. Looks up the `"key-pressed"`
   signal via `g_signal_lookup`, constructs 4 GValues (instance + uint +
   uint + `GdkModifierType` flags), calls `g_signal_emitv`, returns the bool
   result. Exercises cross-namespace flags param dispatch through a real GTK
   signal. Requires GDK init (xvfb).

### Concrete changes

**`ocgtk/src/common/ml_gobject.c`** — add after existing test helpers:

```c
/* ======================================================================== */
/* Exception-escape observation flag                                          */
/* ======================================================================== */

/* Set to 1 in ml_closure_marshal's exception handler. Read/cleared by
   test bindings below. Not thread-safe — tests run single-threaded. */
static int ml_closure_exception_flag = 0;

CAMLprim value ml_test_reset_closure_exception_flag(value unit)
{
    ml_closure_exception_flag = 0;
    CAMLreturn(Val_unit);
}

CAMLprim value ml_test_check_closure_exception_flag(value unit)
{
    CAMLreturn(Val_bool(ml_closure_exception_flag));
}

/* ======================================================================== */
/* Test Enum / Flags type registration (no GTK init required)                 */
/* ======================================================================== */

static GType test_enum_type_id = G_TYPE_INVALID;
static GType test_flags_type_id = G_TYPE_INVALID;

static void ensure_test_types(void)
{
    if (test_enum_type_id == G_TYPE_INVALID) {
        static const GEnumValue enum_values[] = {
            { 0, "TEST_ENUM_NONE", "none" },
            { 1, "TEST_ENUM_ONE",  "one"  },
            { 2, "TEST_ENUM_TWO",  "two"  },
            { 0, NULL, NULL }
        };
        test_enum_type_id =
            g_enum_register_static("TestEnum", enum_values);
    }
    if (test_flags_type_id == G_TYPE_INVALID) {
        static const GFlagsValue flags_values[] = {
            { 0, "TEST_FLAGS_NONE",  "none"   },
            { 1, "TEST_FLAGS_FLAG_A", "flag-a" },
            { 2, "TEST_FLAGS_FLAG_B", "flag-b" },
            { 3, "TEST_FLAGS_FLAG_AB","flag-ab" },
            { 0, NULL, NULL }
        };
        test_flags_type_id =
            g_flags_register_static("TestFlags", flags_values);
    }
}

/* ======================================================================== */
/* Test Helper: invoke closure with mixed-type params + bool return           */
/* ======================================================================== */

CAMLprim value ml_test_invoke_closure_mixed_return_bool(
    value closure_val, value int_arg, value str_arg, value obj_arg)
{
    CAMLparam4(closure_val, int_arg, str_arg, obj_arg);
    GClosure *closure = GClosure_val(closure_val);
    GValue params[3] = {G_VALUE_INIT, G_VALUE_INIT, G_VALUE_INIT};
    GValue return_value = G_VALUE_INIT;
    int ret;

    g_value_init(&return_value, G_TYPE_BOOLEAN);

    g_value_init(&params[0], G_TYPE_INT);
    g_value_set_int(&params[0], Int_val(int_arg));

    g_value_init(&params[1], G_TYPE_STRING);
    g_value_set_string(&params[1], String_val(str_arg));

    g_value_init(&params[2], G_TYPE_OBJECT);
    if (Is_block(obj_arg))
        g_value_set_object(&params[2],
            G_OBJECT(ml_gobject_ext_of_val(Field(obj_arg, 0))));

    g_closure_invoke(closure, &return_value, 3, params, NULL);

    ret = g_value_get_boolean(&return_value);

    g_value_unset(&params[0]);
    g_value_unset(&params[1]);
    g_value_unset(&params[2]);
    g_value_unset(&return_value);

    CAMLreturn(Val_bool(ret));
}

/* ======================================================================== */
/* Test Helper: invoke closure with enum param + bool return                  */
/* ======================================================================== */

CAMLprim value ml_test_invoke_closure_enum_return_bool(
    value closure_val, value enum_int_val)
{
    CAMLparam2(closure_val, enum_int_val);
    ensure_test_types();
    GClosure *closure = GClosure_val(closure_val);
    GValue param = G_VALUE_INIT;
    GValue return_value = G_VALUE_INIT;
    gboolean ret;

    g_value_init(&param, test_enum_type_id);
    g_value_set_enum(&param, Int_val(enum_int_val));
    g_value_init(&return_value, G_TYPE_BOOLEAN);

    g_closure_invoke(closure, &return_value, 1, &param, NULL);

    ret = g_value_get_boolean(&return_value);

    g_value_unset(&param);
    g_value_unset(&return_value);

    CAMLreturn(Val_bool(ret));
}

/* ======================================================================== */
/* Test Helper: invoke closure with flags param + bool return                 */
/* ======================================================================== */

CAMLprim value ml_test_invoke_closure_flags_return_bool(
    value closure_val, value flags_int_val)
{
    CAMLparam2(closure_val, flags_int_val);
    ensure_test_types();
    GClosure *closure = GClosure_val(closure_val);
    GValue param = G_VALUE_INIT;
    GValue return_value = G_VALUE_INIT;
    gboolean ret;

    g_value_init(&param, test_flags_type_id);
    g_value_set_flags(&param, Int_val(flags_int_val));
    g_value_init(&return_value, G_TYPE_BOOLEAN);

    g_closure_invoke(closure, &return_value, 1, &param, NULL);

    ret = g_value_get_boolean(&return_value);

    g_value_unset(&param);
    g_value_unset(&return_value);

    CAMLreturn(Val_bool(ret));
}

/* ======================================================================== */
/* Test Helper: invoke closure with 0 params + int return                    */
/* ======================================================================== */

CAMLprim value ml_test_invoke_closure_return_int(value closure_val)
{
    CAMLparam1(closure_val);
    GClosure *closure = GClosure_val(closure_val);
    GValue return_value = G_VALUE_INIT;
    int ret;

    g_value_init(&return_value, G_TYPE_INT);
    g_closure_invoke(closure, &return_value, 0, NULL, NULL);

    ret = g_value_get_int(&return_value);
    g_value_unset(&return_value);

    CAMLreturn(Val_int(ret));
}
```

In `ml_closure_marshal`, add `ml_closure_exception_flag = 1;` as the first
statement after the `Is_exception_result(result)` check:

```c
    if (Is_exception_result(result)) {
        ml_closure_exception_flag = 1;
        exn = Extract_exception(result);
        /* ... existing g_warning logging ... */
    }
```

**`ocgtk/src/common/gobject.ml`** — add to `module Test`:
```ocaml
  external invoke_closure_mixed_return_bool :
    g_closure -> int -> string -> 'a obj option -> bool
    = "ml_test_invoke_closure_mixed_return_bool"
  external invoke_closure_enum_return_bool :
    g_closure -> int -> bool
    = "ml_test_invoke_closure_enum_return_bool"
  external invoke_closure_flags_return_bool :
    g_closure -> int -> bool
    = "ml_test_invoke_closure_flags_return_bool"
  external invoke_closure_return_int :
    g_closure -> int = "ml_test_invoke_closure_return_int"
  external reset_closure_exception_flag : unit -> unit
    = "ml_test_reset_closure_exception_flag"
  external check_closure_exception_flag : unit -> bool
    = "ml_test_check_closure_exception_flag"
```

**`ocgtk/src/common/gobject.mli`** — add to `module Test`:
```ocaml
  val invoke_closure_mixed_return_bool :
    g_closure -> int -> string -> 'a obj option -> bool
  (** Invoke a closure with int, string, and nullable GObject params,
      reading a boolean return value. Exercises the full closure-marshal
      path including multi-param dispatch and non-void return copy-back. *)

  val invoke_closure_enum_return_bool :
    g_closure -> int -> bool
  (** Invoke a closure with a single enum-typed GValue param (registered
      TestEnum), reading a boolean return value. Exercises the full
      G_TYPE_ENUM dispatch path: g_value_set_enum → marshaller →
      get_enum_int → _of_int decoder. *)

  val invoke_closure_flags_return_bool :
    g_closure -> int -> bool
  (** Invoke a closure with a single flags-typed GValue param (registered
      TestFlags), reading a boolean return value. Exercises the full
      G_TYPE_FLAGS dispatch path, which is the same path used for
      cross-namespace signals like key-pressed with GdkModifierType. *)

  val invoke_closure_return_int :
    g_closure -> int
  (** Invoke a closure with 0 params, reading an int return value.
      Exercises the non-bool non-void return copy-back path. *)

  val reset_closure_exception_flag : unit -> unit
  (** Reset the exception-escape observation flag to false. Call before
      invoking a closure that is expected to raise. *)

  val check_closure_exception_flag : unit -> bool
  (** Check whether an exception escaped from a closure since the last
      [reset_closure_exception_flag] call. True means the marshal's
      exception handler was triggered. *)
```

**`ocgtk/tests/gtk/test_signal_widget_stubs.c`** — new C file for the
cross-namespace signal-emission helper. Requires GTK/GDK headers (only linked
into the widget test suite):

```c
/* test_signal_widget_stubs.c — C stubs for wired widget signal tests.
 *
 * Provides ml_test_emit_key_pressed_signal which emits the "key-pressed"
 * signal on an EventControllerKey with properly-typed GValue params,
 * including a GdkModifierType flags param. Uses g_type_from_name to
 * resolve the GType (requires GDK init via gtk_init / xvfb).
 */
#include <glib-object.h>
#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>

extern gpointer ml_gobject_ext_of_val(value v);

CAMLprim value ml_test_emit_key_pressed_signal(
    value controller_val, value keyval_val,
    value keycode_val, value state_val)
{
    CAMLparam4(controller_val, keyval_val, keycode_val, state_val);
    GObject *obj = G_OBJECT(ml_gobject_ext_of_val(controller_val));
    guint signal_id = g_signal_lookup("key-pressed", G_OBJECT_TYPE(obj));
    GType flags_type = g_type_from_name("GdkModifierType");

    GValue params[4] = {
        G_VALUE_INIT, G_VALUE_INIT, G_VALUE_INIT, G_VALUE_INIT
    };
    GValue return_value = G_VALUE_INIT;
    gboolean ret;

    g_value_init(&params[0], G_OBJECT_TYPE(obj));
    g_value_set_object(&params[0], obj);

    g_value_init(&params[1], G_TYPE_UINT);
    g_value_set_uint(&params[1], Int_val(keyval_val));

    g_value_init(&params[2], G_TYPE_UINT);
    g_value_set_uint(&params[2], Int_val(keycode_val));

    g_value_init(&params[3], flags_type);
    g_value_set_flags(&params[3], Int_val(state_val));

    g_value_init(&return_value, G_TYPE_BOOLEAN);

    g_signal_emitv(params, signal_id, 0, &return_value);

    ret = g_value_get_boolean(&return_value);

    for (int i = 0; i < 4; i++) g_value_unset(&params[i]);
    g_value_unset(&return_value);

    CAMLreturn(Val_bool(ret));
}
```

### Validation

`dune build` — compiles C without warnings, OCaml sees all new externals.

---

## Part B: Standalone Closure Marshalling Tests

### Design

New alcotest suite at `ocgtk/tests/gtk/test_signal_marshalling.ml`. These tests
require no display server — they only need `Gobject.Closure.create` +
`Gobject.Test.invoke_closure_*`. For the GObject param test, a dummy widget
created via `Wrappers.Button.new_()` provides the raw GObject pointer (GTK4
allows constructing a `GtkButton` without a display connection; existing tests
like `test_closure_stress.ml` do this).

The enum/flags tests (M7, M9) use the dynamically-registered `TestEnum` /
`TestFlags` GTypes from `ensure_test_types()`, which requires only the GLib
type system (no GTK init). The OCaml `_of_int` decoders are defined locally in
the test file, matching the structural pattern used by generated decoders.

### Test cases

| Test | What It Exercises |
|------|-------------------|
| **M1: multi-param dispatch with bool return** | 3-param closure (int, string, GObject) returns `true`. All param refs match expected values. Uses `invoke_closure_mixed_return_bool`. |
| **M2: bool return false case** | Same closure returns `false`; C layer reads it back correctly. |
| **M3: void return, 0 params** | `connect_simple`-style closure fires, counter increments. Uses existing `invoke_closure_void`. |
| **M4: exception escape** | Closure raises `Failure`; `ml_closure_marshal` exception handler sets the flag; test asserts `check_closure_exception_flag` returns `true`. Process doesn't crash. |
| **M5: null GObject param** | `None` passed as object arg to `invoke_closure_mixed_return_bool`; callback receives `None`. |
| **M5b: non-null GObject param identity** | Real `Gtk.Button` passed as object arg; `Gobject.same` confirms pointer identity is preserved through the marshal path. |
| **M6: GC safety** | 50 mixed-type closures created and invoked, `Gc.minor()` every 10, all survive and return correct values. |
| ~~**M7: enum param dispatch**~~ | ~~Closure receives a `G_TYPE_ENUM` GValue via `invoke_closure_enum_return_bool`; local `_of_int` decoder runs.~~ **Removed in review** — covered by `test_signal_value_enum_flags.ml` and `test_signal_widget.ml` (real signal decoders). |
| **M8: int return copy-back** | Closure returns `int`; `invoke_closure_return_int` reads it back via `g_value_get_int`. Exercises non-bool non-void return copy-back. |
| **M9: flags param dispatch** | Closure receives a `G_TYPE_FLAGS` GValue via `invoke_closure_flags_return_bool`; local `_of_int` decoder runs. Validates the same `get_flags_int` path used by cross-namespace signals. |

### Implementation notes

**Test M1 & M2** use a ref-bucket pattern:
```ocaml
let test_mixed_params_bool_return () =
  let captured_int = ref 0 in
  let captured_str = ref "" in
  let captured_obj = ref None in
  let capture_and_return ~i ~s ~obj =
    captured_int := i;
    captured_str := s;
    captured_obj := obj;
    true
  in
  let dummy = Wrappers.Button.new_ () in
  let closure = Gobject.Closure.create (fun argv ->
    let i = Gobject.Value.get_int (Gobject.Closure.nth argv ~pos:1) in
    let s = Gobject.Value.get_string (Gobject.Closure.nth argv ~pos:2) in
    let obj = Gobject.Value.get_object (Gobject.Closure.nth argv ~pos:3) in
    let result = capture_and_return ~i ~s ~obj in
    Gobject.Value.set_boolean (Gobject.Closure.result argv) result)
  in
  let ret = Gobject.Test.invoke_closure_mixed_return_bool closure 42 "hello" (Some dummy) in
  Alcotest.(check bool) "return value" true ret;
  Alcotest.(check int) "captured int" 42 !captured_int;
  Alcotest.(check string) "captured string" "hello" !captured_str;
  Alcotest.(check bool) "captured obj is Some" true (Option.is_some !captured_obj)
```

**Test M4 (exception escape):**
```ocaml
let test_exception_escape () =
  Gobject.Test.reset_closure_exception_flag ();
  let closure = Gobject.Closure.create (fun argv ->
    raise (Failure "test exception")) in
  Gobject.Test.invoke_closure_void closure;
  Alcotest.(check bool) "exception flag was set" true
    (Gobject.Test.check_closure_exception_flag ())
```

**Test M7 (enum dispatch):** Local decoder mirrors the generated pattern:
```ocaml
let test_enum_of_int n =
  match n with 0 -> `NONE | 1 -> `ONE | 2 -> `TWO | _ -> failwith "bad enum"

let test_enum_dispatch () =
  let captured = ref `NONE in
  let closure = Gobject.Closure.create (fun argv ->
    let v = Gobject.Closure.nth argv ~pos:1 in
    let decoded = test_enum_of_int (Gobject.Value.get_enum_int v) in
    captured := decoded;
    true) in
  let ret = Gobject.Test.invoke_closure_enum_return_bool closure 1 in
  Alcotest.(check bool) "return value" true ret;
  Alcotest.(check string) "enum decoded"
    (show_test_enum !captured) (show_test_enum `ONE)
```

**Test M9 (flags dispatch):** Same pattern with bitfield decoder:
```ocaml
let test_flags_of_int n =
  let flags = [] in
  let flags = if n land 1 <> 0 then `A :: flags else flags in
  let flags = if n land 2 <> 0 then `B :: flags else flags in
  List.sort Stdlib.compare flags

let test_flags_dispatch () =
  let captured = ref [] in
  let closure = Gobject.Closure.create (fun argv ->
    let v = Gobject.Closure.nth argv ~pos:1 in
    let decoded = test_flags_of_int (Gobject.Value.get_flags_int v) in
    captured := decoded;
    true) in
  let ret = Gobject.Test.invoke_closure_flags_return_bool closure 3 in
  Alcotest.(check bool) "return value" true ret;
  Alcotest.(check (list pass)) "flags decoded"
    (List.sort Stdlib.compare [`A; `B])
    (List.sort Stdlib.compare !captured)
```

**Test M8 (int return):**
```ocaml
let test_int_return () =
  let closure = Gobject.Closure.create (fun argv ->
    Gobject.Value.set_int (Gobject.Closure.result argv) 99;
    ()) in
  let ret = Gobject.Test.invoke_closure_return_int closure in
  Alcotest.(check int) "int return value" 99 ret
```

**Test M5 (null GObject):** Same pattern as M1 but pass `None` for `obj_arg`,
assert `!captured_obj = None`.

### File

`ocgtk/tests/gtk/test_signal_marshalling.ml` (~280 lines)

### Dune entry (in `ocgtk/tests/gtk/dune`)

```
(test
 (name test_signal_marshalling)
 (modules test_signal_marshalling)
 (libraries ocgtk.common ocgtk.gtk alcotest))
```

Note: `ocgtk.common` for `Gobject.Closure`/`Gobject.Test`, `ocgtk.gtk` for
`Wrappers.Button.new_`. No `gtk_test_helpers` needed (no display). The
enum/flags tests use dynamically-registered GTypes that don't require GTK init.

> **Headless assumption:** `Wrappers.Button.new_()` must work without a display
> server. Existing tests (`test_closure_stress.ml`) already construct buttons
> without xvfb. If this changes, replace with a raw `g_object_new` call.

### Validation

`dune test ocgtk/` -- passes without display server (8 tests in
`test_signal_marshalling`).

---

## Part C: Wired Widget Signal Tests

### Design

New alcotest suite at `ocgtk/tests/gtk/test_signal_widget.ml`. Requires xvfb.
Uses `gtk_test_helpers.require_gtk` pattern (existing convention from
`test_button.ml`, `test_box.ml`, etc.) so tests skip gracefully when no display
is available.

### Test cases

| # | Test | What It Exercises | Widget Used |
|---|------|-------------------|-------------|
| 0 | **Signal disconnect** | Connect `Button.on_clicked`, emit, disconnect, emit again — handler no longer fires | `Gtk.Button` |
| 1 | **Button clicked** | `connect_simple` path — void return, 0 params | `Gtk.Button` |
| 2 | **Button clicked ?after** | `?after:true` on a simple signal | `Gtk.Button` |
| 3 | **Check-button toggled** | Void return, 0 params, verifies toggle state changes | `Gtk.CheckButton` |
| 4 | **Notebook page-added** | Generated `on_page_added` with GObject param + int param | `Gtk.Notebook` |
| 5 | **Window close-request** | Generated `on_close_request` with bool return (returning `false` allows close) | `Gtk.Window` |
| 6 | **EventControllerKey key-pressed** | Cross-namespace: `on_key_pressed` with `GdkModifierType` flags param + bool return. Emits signal via `ml_test_emit_key_pressed_signal` C helper. | `Gtk.EventControllerKey` |

### Implementation notes

**Test 1 (Button clicked):**
```ocaml
let test_button_clicked () =
  let fired = ref false in
  let btn_obj = Wrappers.Button.new_ () in
  let btn = new Button.button btn_obj in
  ignore (btn#on_clicked ~callback:(fun () -> fired := true) ());
  Wrappers.Button.clicked btn_obj;
  Alcotest.(check bool) "callback fired" true !fired
```

**Test 2 (?after=true):**
```ocaml
let test_button_clicked_after () =
  let order = ref [] in
  let btn_obj = Wrappers.Button.new_ () in
  let btn = new Button.button btn_obj in
  ignore (btn#on_clicked ~callback:(fun () -> order := "first" :: !order) ());
  ignore (btn#on_clicked ~after:true ~callback:(fun () -> order := "second" :: !order) ());
  Wrappers.Button.clicked btn_obj;
  Alcotest.(check (list string)) "callback order" ["second"; "first"] !order
```

**Test 4 (Notebook page-added):**
```ocaml
let test_page_added () =
  let captured_child = ref None in
  let captured_page = ref (-1) in
  let nb_obj = Wrappers.Notebook.new_ () in
  let nb = new Notebook.notebook nb_obj in
  let child_obj = Wrappers.Button.new_ () in
  ignore (nb#on_page_added
    ~callback:(fun ~child ~page_num ->
      captured_child := Some child;
      captured_page := page_num)
    ());
  Wrappers.Notebook.append_page nb_obj child_obj None;
  Alcotest.(check bool) "child captured" true (Option.is_some !captured_child);
  Alcotest.(check int) "page num" 0 !captured_page
```

**Test 5 (Window close-request):**
```ocaml
let test_close_request () =
  let called = ref false in
  let window_obj = Wrappers.Window.new_ () in
  let window = new Window.window window_obj in
  ignore (window#on_close_request ~callback:(fun () -> called := true; false) ());
  (* Emit close-request signal directly using g_signal_emit_by_name or
     g_object_destroy. The close-request callback should fire. *)
```

Emitting `close-request` on a GTK Window: use
`Gobject.Signal.emit_by_name` or call the vfunc via `gtk_window_close`. The
simplest approach for testing is to call `gtk_window_close` through the
generated binding if available, or use `g_signal_emit_by_name` via a C helper.
If no convenient emission path exists, fall back to constructing the closure
stand-alone and testing the callback logic without emitting the actual signal.

**Test 6 (EventControllerKey key-pressed) — cross-namespace:**
```ocaml
external emit_key_pressed_signal :
  Event_controller_key.t -> int -> int -> int -> bool
  = "ml_test_emit_key_pressed_signal"

let test_key_pressed_cross_namespace () =
  let captured_state = ref [] in
  let ctrl_obj = Event_controller_key.new_ () in
  let ctrl = new Event_controller_key.event_controller_key ctrl_obj in
  ignore (ctrl#on_key_pressed
    ~callback:(fun ~keyval ~keycode ~state ->
      captured_state := state;
      true)
    ());
  let ret = emit_key_pressed_signal ctrl_obj 97 12 1 in
  Alcotest.(check bool) "return value" true ret;
  Alcotest.(check bool) "captured state contains SHIFT_MASK" true
    (List.mem `SHIFT_MASK !captured_state)
```

This test exercises the full cross-namespace path: `EventControllerKey` is in
the Gtk namespace, but `state` has type `Ocgtk_gdk.Gdk_enums.modifiertype`
(from the Gdk namespace). The `state` argument is decoded via
`Gdk_enums.modifiertype_of_int (Gobject.Value.get_flags_int v)` in the
generated `on_key_pressed` L1 code. The C helper constructs a
`G_TYPE_MODIFIER_TYPE`-typed GValue, ensuring the flags path round-trips
through the real GLib type system rather than a synthetic test type.

### File

`ocgtk/tests/gtk/test_signal_widget.ml` (~180 lines)

### Dune entry (in `ocgtk/tests/gtk/dune`)

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

### Validation

`xvfb-run dune test ocgtk/` — all widget tests pass.

---

## Execution Order

1. **Part A** — C helpers + OCaml externals + signatures + exception-flag wire
2. `dune build` — verify C compiles without warnings, OCaml sees all externals
3. **Part B** — `test_signal_marshalling.ml` (~280 lines) + dune entry
4. `dune test ocgtk/` — standalone tests pass (8 tests, no display)
5. **Part C** — `test_signal_widget.ml` (~180 lines) + stubs + dune entry
6. `xvfb-run dune test ocgtk/` — full suite passes (7 widget tests)

---

## Files

| Action | File | Lines |
|--------|------|-------|
| Modify | `ocgtk/src/common/ml_gobject.c` | ~+190 (helpers + flag) |
| Modify | `ocgtk/src/common/gobject.ml` | ~+12 |
| Modify | `ocgtk/src/common/gobject.mli` | ~+24 |
| Create | `ocgtk/tests/gtk/test_signal_marshalling.ml` | ~280 |
| Create | `ocgtk/tests/gtk/test_signal_widget.ml` | ~180 |
| Create | `ocgtk/tests/gtk/test_signal_widget_stubs.c` | ~50 |
| Modify | `ocgtk/tests/gtk/dune` | ~+22 |

**Total:** ~740 lines (~240 C + ~500 OCaml). Zero changes to `gir_gen/` or
generated bindings (except `ml_closure_marshal` exception-flag line).

---

## Verification (Phase 4 Definition of Done)

- [ ] `dune build` clean (no C warnings)
- [ ] `dune test ocgtk/` — `test_signal_marshalling` passes 8 tests (no display)
- [ ] `xvfb-run dune test ocgtk/` — `test_signal_widget` passes 7 tests
- [ ] C helpers compile without warnings (including `ensure_test_types`)
- [ ] All existing `Gobject.Test.invoke_closure_*` helpers still work (regression via `test_closure_stress`)
- [ ] Exception-escape flag: `reset_closure_exception_flag` + `check_closure_exception_flag` round-trip correctly
- [ ] Cross-namespace test: `EventControllerKey.on_key_pressed` callback receives correct `GdkModifierType` flags via `g_signal_emitv`