# Value-Kinds Registry: Disciplined Runtime Discrimination of FFI Values

**Status: DRAFT**
**Created: 2026-04-30**
**Branch: TBD (recommended `refactor/value-kinds-registry`)**
**Depends on / unblocks: `feat/milestone-2-signals` (Phase 1b Signal_marshaller)**

## Overview

The OCaml ↔ C boundary in ocgtk currently represents foreign data in **at
least nine distinct shapes**:

| Shape | Used for | Allocator | Reader |
|---|---|---|---|
| Tagged int | bounded ints, GType, lookup_info enum tag | `Val_long` | `Long_val` |
| Custom block, payload `void*`, ops `gobject_custom_ops` | every GObject | `ml_gobject_val_of_ext` | `ml_gobject_ext_of_val` |
| Custom block, payload `gir_record_box`, ops `gir_record_custom_ops` | every GIR record (boxed or plain, opaque) | `ml_gir_record_val_ptr{,_with_type}` | `ml_gir_record_ptr_val` |
| Custom block, payload `GVariant*`, ops `gvariant_custom_ops` | `GLib.Variant.t` | `Val_GVariant` | `GVariant_val` |
| Custom block, payload `GVariantType*`, ops `gvariant_type_custom_ops` | `GLib.Variant_type.t` | `Val_GVariantType` | `GVariantType_val` |
| Custom block, payload `GBytes*`, ops `gbytes_custom_ops` | `GLib.Bytes.t` | `Val_GBytes` | `GBytes_val` |
| Custom block, payload `ml_gvalue`, ops `gvalue_ops` | `GObject.Value.t` | (ml_gobject.c) | `GValue_val` |
| Custom block, payload `GClosure*`, ops `ml_custom_GClosure` | `GObject.Closure.t` | (ml_gobject.c) | `GClosure_val` |
| **1-field Abstract block, payload at field 0** | value-like records (`GdkRGBA`, `PangoColor`, `GtkBorder`, `GtkTextIter`, `GtkTreeIter`, `GskRoundedRect`, `GskPathPoint`, …); `lookup_info`; some hand-written widget glue | `val_of_ext` | `ext_of_val` |
| **2-field Abstract block, payload at field 1** | `Val_pointer` / `Pointer_val` (legacy) | `Val_pointer` | `Pointer_val` |

Two consequences:

1. **Cross-kind reads silently return garbage.** `ml_gir_record_ptr_val` accepts
   any `Custom_tag` value: passing a `GObject` custom block reads the
   wrapped `GObject*` as if it were the `gir_record_box.type` slot.
   Symmetric hazards exist between `GVariant`, `GBytes`, `GValue`, etc. —
   the OCaml type system separates them at compile time, but boundary
   helpers that erase types (Signal_marshaller, GValue dispatch, future
   Variant decoders) cannot.
2. **The "value-like record" macro path is broken on the heap-side reader.**
   `Val_<X>` for value-like records (e.g. `GdkRGBA`) allocates a
   `gir_record_box` Custom block via `ml_gir_record_val_ptr`, but the
   matching `<X>_val(val) = ((X*)ext_of_val(val))` macro reads the value
   as if it were a 1-field Abstract block — i.e. it dereferences the
   GType slot of the custom block as a pointer to the record body. This
   has been latent because the value-like macro is rarely on the read
   path today, but it is a loaded gun for Milestone 3 (boxed inline
   structs).

The redesign **does not invent new representations**. Custom blocks already
carry a unique `struct custom_operations *` reachable via
`Custom_ops_val(v)`. Treating that pointer as an authoritative kind
discriminator — exposed via a public registry header and asserting
accessor macros — gives every dynamic-dispatch site a fast, type-checked
way to ask "what am I holding?" without breaking source compatibility for
the dozens of `<X>_val` / `Val_<X>` macros already in flight.

### Goal

A small, additive registry layer in `ocgtk/src/common/` that:

- Exports each existing `custom_operations` struct as a single global
  symbol with a stable identifier and ABI.
- Provides asserting accessor macros (`Gobject_box_of_val`,
  `Gir_record_box_of_val`, etc.) that fail-fast when the wrong kind is
  passed.
- Provides one classifier function `ocgtk_classify(value v) -> ocgtk_kind`
  for use in dynamic-dispatch sites (Signal_marshaller, future
  `GValue` ↔ OCaml decoders).
- Eliminates the two latent bugs (task #1 value-like `_val` macro;
  task #2 cross-kind `ml_gir_record_ptr_val` fallback) as a side effect.
- Documents the canonical path per kind in
  `architecture/FFI_GUIDELINES.md` and removes incoherent legacy paths
  (the Abstract-block `GObject_val`/`Val_GObject` macros at
  `wrappers.h:189-190` are not used by generated code and contradict
  the Custom-block path used everywhere else).

### Non-goals

- Replacing distinct `custom_operations` structs with a single
  envelope. We retain per-kind ops because finalisers genuinely
  differ (`g_object_unref`, `g_boxed_free`-or-`g_free`, `g_variant_unref`,
  `g_bytes_unref`, `g_value_unset`, `g_closure_unref`, none-for-bytes-ints).
- Rebinding value-like records as inline-struct custom blocks
  (`Gdk.Rectangle`, `Gdk.RGBA`, `Gdk.Point`, `Gtk.Requisition`,
  `Gtk.Allocation`, `Gtk.Border`). That's TASKS.md's "rebind value-type
  records" entry, deferred to Milestone 3. This plan **enables** that
  work by giving the new boxed-struct ops struct a natural home in the
  registry.
- Migrating all of `ml_gtk.c`'s hand-written widget glue away from
  `val_of_ext`/`ext_of_val`. We retire those helpers in a later phase
  once nothing depends on them.
- Removing `Val_pointer`/`Pointer_val`. They're flagged as legacy in
  `FFI_GUIDELINES.md` already; cleanup is opportunistic, not in scope.

---

## Audit of Current State (verified against `f7fd97a9`)

### Existing custom_operations structs (all currently `static`)

```
ocgtk/src/common/wrappers.c:125:    gir_record_custom_ops      "ocgtk.gir_record"
ocgtk/src/common/wrappers.c:181:    gobject_custom_ops         "ocgtk.gobject"
ocgtk/src/common/ml_gvariant.c:97:  gvariant_custom_ops        (string TBD)
ocgtk/src/common/ml_gvariant_type.c:45: gvariant_type_custom_ops
ocgtk/src/common/ml_gobject.c:238:  gvalue_ops
ocgtk/src/common/ml_gobject.c:527:  ml_custom_GClosure
ocgtk/src/common/ml_glib_bytes.c:50: gbytes_custom_ops
```

(One additional, `SECURITY_GUIDELINES.md:705`, is illustrative-only — not
real code.)

### Bare uses of `val_of_ext` / `ext_of_val` (excluding the well-named
`ml_gobject_*_of_val` Custom-block helpers and the `ml_gir_record_*`
helpers)

```
ocgtk/src/common/wrappers.h:96-97   Val_lookup_info / Lookup_info_val  (read-only enum tables)
ocgtk/src/common/wrappers.h:189-190 GObject_val / Val_GObject          (DEAD or wrong - generated code uses ml_gobject_*_of_val instead)
ocgtk/src/common/wrappers.c:162     ml_gir_record_ptr_val fallback path (task #2)
ocgtk/src/common/wrappers.c:241,250 val_of_ext / ext_of_val definitions
ocgtk/src/common/ml_glib.c:301      val_of_ext(loop)                   (GMainLoop hand-written wrap)
ocgtk/src/gtk/core/converters.c:29  Val_some(val_of_ext(widget))       (hand-written widget option wrapper)
ocgtk/src/gtk/core/ml_gtk.c:23-24   GtkWidget_val / Val_GtkWidget      (hand-written widget glue — INCONSISTENT with generated GTK widget Val_/_val macros which use ml_gobject_*_of_val)
gir_gen/lib/generate/c_stub_record.ml:87  generator emits "<X>_val(val) ((X*)ext_of_val(val))" for value-like records (task #1)
ocgtk/src/<ns>/generated/<ns>_decls.h: ~14 macros for value-like record reads (consequence of c_stub_record.ml:87)
```

The `ml_gtk.c` glue is the most surprising find: hand-written widget
helpers use a different, incompatible representation from the generated
widget bindings. Today nobody mixes them because
`Val_GtkWidget`/`GtkWidget_val` are scoped to one translation unit,
but it is a latent gun.

### Two distinct Abstract-block layouts in the same header

- `Val_pointer(p)` / `Pointer_val(v)`: 2-field Abstract block, payload
  at **field 1**, field 0 unused.
- `val_of_ext(p)` / `ext_of_val(v)`: 1-field Abstract block, payload
  at **field 0** (`Data_abstract_val`).

Mixing readers and writers across these two layouts produces silent
garbage. They are not interchangeable. **`Val_pointer`/`Pointer_val`
are dead code** (audit below) and the cleanest fix is to delete them
in Phase 0; this also eliminates the divergence as a hazard.

### Hand-written / `wrappers.h` macro audit (call counts confirmed against `f7fd97a9`)

| Symbol | Site | External call sites | Verdict |
|---|---|---:|---|
| `MLPointer_val` | `wrappers.h:29-30` | **0** | DEAD — delete |
| `Val_copy` / `copy_memblock_indirected` | `wrappers.h:33-34`, `wrappers.c:81-92` | **0** | DEAD — delete |
| `Val_pointer` / `Pointer_val` | `wrappers.h:88-89`, `wrappers.c:232-239` | **0** | DEAD — delete (resolves divergence) |
| `Make_Val_option(T)` | `wrappers.h:132-133` | **0** | DEAD — delete |
| `Ignore(x)` | `wrappers.h:136` | **0** | DEAD — delete |
| `Unit(x)` | `wrappers.h:137` | **0** | DEAD — delete |
| `ML_1` / `ML_2` / `ML_4` / `ML_5` / `ML_8` / `ML_11` / `ML_12` | `wrappers.h:139-163` | **0** | DEAD — delete (lablgtk-era currying helpers) |
| `ML_bc8` / `ML_bc11` / `ML_bc12` | `wrappers.h:165-175` | **0** | DEAD — delete |
| `GObject_val` / `Val_GObject` (Abstract-block) | `wrappers.h:189-190` | **0** | DEAD — delete; generated GObject code uses per-class `<X>_val`/`Val_<X>` macros backed by `ml_gobject_*_of_val` |
| `Val_GtkWidget_option` | `converters.c:26-30` | **0** | DEAD — delete (the file is otherwise empty after this) |
| `ml_gtk.c:23-24` `GtkWidget_val` / `Val_GtkWidget` shadow | `ml_gtk.c:23-24` | **1** call site at `ml_gtk.c:37` (only `ml_gtk_widget_destroy`) | **BUG** — Abstract-block layout is incompatible with the generated Custom-block widgets passed in from OCaml. Fix by including `gtk_decls.h` and removing the shadow defines |
| `Val_GMainLoop` / `GMainLoop_val` | `ml_glib.c:297-311` | self-contained (4 call sites all in same TU) | KEEP for now — internally consistent; migrate to a custom block in Phase 6 |
| `Val_lookup_info` / `Lookup_info_val` | `wrappers.h:96-97`, `wrappers.c:60,71` | self-contained | KEEP — read-only static tables; the lone sanctioned Abstract-block consumer |

**Net:** ~75 lines deletable from `wrappers.h` plus 12 lines from
`wrappers.c`, 5 lines from `converters.c`, and 2 lines from `ml_gtk.c`
(plus an `#include "gtk_decls.h"` to replace the shadow).

### Generator-side facts

- `c_stub_record.ml:16` defines `is_value_like_record record =
  is_non_opaque_record record && has_copy_method record`. **Despite the
  prior session note**, this returns `true` for ~14 records currently in
  the bindings (visible in the generated `<ns>_decls.h` files). The macro
  emitted for those records is the buggy one.
- The opaque-record path (`generate_opaque_record_conversions` at
  `c_stub_record.ml:130`+) already routes correctly through
  `ml_gir_record_ptr_val`. Nothing to do there beyond hardening the
  helper.

---

## Design

### Phase 0 — Dead-code excision (lands first, shrinks the surface)

Goal: remove every macro / helper with **zero** external call sites and
fix the one widget bug, so subsequent phases work against a smaller,
coherent FFI surface.

Concrete edits:

1. **`ocgtk/src/common/wrappers.h`** — delete:
   - lines 28-34 (`MLPointer_val`, `copy_memblock_indirected` decl,
     `Val_copy`)
   - lines 86-89 (`Val_pointer` decl, `Pointer_val` macro)
   - lines 131-133 (`Make_Val_option(T)` macro)
   - lines 136-137 (`Ignore`, `Unit` macros)
   - lines 139-175 (`ML_1` ... `ML_12`, `ML_bc8`, `ML_bc11`, `ML_bc12`)
   - lines 188-190 (`GObject_val`, `Val_GObject`)
2. **`ocgtk/src/common/wrappers.c`** — delete:
   - lines 81-92 (`copy_memblock_indirected` definition)
   - lines 226-239 (`Val_pointer` definition)
3. **`ocgtk/src/gtk/core/converters.c`** — delete the
   `Val_GtkWidget_option` function (the file becomes a stub; either
   delete the `.c` from the dune rules or leave a banner comment).
4. **`ocgtk/src/gtk/core/ml_gtk.c`** — replace the buggy shadow defines
   at lines 23-24 with `#include "../generated/gtk_decls.h"` so
   `GtkWidget_val` / `Val_GtkWidget` resolve to the generated
   `ml_gobject_*_of_val` Custom-block path. Verify
   `ml_gtk_widget_destroy` still compiles and exercise it manually
   (the calculator app calls it indirectly via window close).
5. **`SECURITY_GUIDELINES.md` and `architecture/FFI_GUIDELINES.md`** —
   remove references to the deleted macros (`Val_pointer`,
   `Pointer_val`).
6. **Audit `dune` rules** for any explicit references to removed
   symbols (none expected).

Build/test verification: full `dune build` from repo root must pass
(any latent caller of a removed symbol surfaces as a link error and
gets investigated, not blanket-restored). Full
`dune test gir_gen/ && xvfb-run dune test ocgtk/` must pass. Manually
exercise the calculator app and form-example app — focus on window
destroy paths since `ml_gtk_widget_destroy` is the only behaviour
change in this phase.

Acceptance: the seven dead-code categories listed in the audit above
are fully removed; `git grep -E '\\b(MLPointer_val|Val_copy|Val_pointer|Pointer_val|Make_Val_option|GObject_val|Val_GObject)\\b'`
returns no production matches; `ml_gtk.c` no longer redefines
`GtkWidget_val`/`Val_GtkWidget`.

### Phase 1 — Registry header (additive, no behaviour change)

New file `ocgtk/src/common/value_kinds.h`:

```c
#ifndef OCGTK_VALUE_KINDS_H
#define OCGTK_VALUE_KINDS_H

#include <caml/custom.h>
#include <caml/mlvalues.h>

/* Stable identifiers — used both as the cops->identifier string and as
 * a public symbol for direct pointer-equality dispatch.            */
extern struct custom_operations ocgtk_gobject_ops;        /* "ocgtk.gobject" */
extern struct custom_operations ocgtk_gir_record_ops;     /* "ocgtk.gir_record" */
extern struct custom_operations ocgtk_gvariant_ops;       /* "ocgtk.gvariant" */
extern struct custom_operations ocgtk_gvariant_type_ops;  /* "ocgtk.gvariant_type" */
extern struct custom_operations ocgtk_gbytes_ops;         /* "ocgtk.gbytes" */
extern struct custom_operations ocgtk_gvalue_ops;         /* "ocgtk.gvalue" */
extern struct custom_operations ocgtk_gclosure_ops;       /* "ocgtk.gclosure" */

typedef enum {
    OCGTK_KIND_INT,            /* Is_long(v) */
    OCGTK_KIND_GOBJECT,
    OCGTK_KIND_GIR_RECORD,
    OCGTK_KIND_GVARIANT,
    OCGTK_KIND_GVARIANT_TYPE,
    OCGTK_KIND_GBYTES,
    OCGTK_KIND_GVALUE,
    OCGTK_KIND_GCLOSURE,
    OCGTK_KIND_OPAQUE_BLOCK    /* a heap block that is not one of ours */
} ocgtk_kind;

/* Returns the kind of a value. INT is fast-pathed; other kinds dispatch
 * on Custom_ops_val identity. Suitable for Signal_marshaller. */
ocgtk_kind ocgtk_classify(value v);

/* Asserting accessors. In NDEBUG builds the assertion compiles out;
 * the read is the same single load as today. */
#define OCGTK_ASSERT_OPS(v, ops_ptr) \
    assert(Tag_val(v) == Custom_tag && Custom_ops_val(v) == &(ops_ptr))

#endif /* OCGTK_VALUE_KINDS_H */
```

Migration in this phase is purely structural:

1. De-`static` each existing ops struct and rename to the registry name.
2. Adjust each defining file to `#include "value_kinds.h"` (relative
   path resolution via the existing `dune` C-stub flags).
3. Add `ocgtk_classify` to `wrappers.c` (single function, ~25 lines,
   testable via a new `tests/value_kinds_test.c` driver).
4. Add a unit test in `ocgtk/tests/gtk/test_value_kinds.ml` that
   round-trips one value of each kind and asserts the classifier
   returns the expected kind.

**Renames that affect ABI/symbol table**:

| Old (static) | New (extern) |
|---|---|
| `gobject_custom_ops` | `ocgtk_gobject_ops` |
| `gir_record_custom_ops` | `ocgtk_gir_record_ops` |
| `gvariant_custom_ops` | `ocgtk_gvariant_ops` |
| `gvariant_type_custom_ops` | `ocgtk_gvariant_type_ops` |
| `gbytes_custom_ops` | `ocgtk_gbytes_ops` |
| `gvalue_ops` | `ocgtk_gvalue_ops` |
| `ml_custom_GClosure` | `ocgtk_gclosure_ops` |

`cops->identifier` strings are **not** changed (they're load-bearing for
the OCaml runtime's serialiser / deserialiser registry — even though we
use the defaults, changing them is gratuitous churn). They remain
`"ocgtk.gobject"`, `"ocgtk.gir_record"`, etc. New ones get the
`"ocgtk.<kind>"` prefix to match.

**Build/test verification**: `dune build` from repo root must pass
unchanged. `dune test gir_gen/ && xvfb-run dune test ocgtk/` must pass
unchanged. No regen needed in this phase.

### Phase 2 — Harden `ml_gir_record_ptr_val` (closes task #2)

`ocgtk/src/common/wrappers.c:153-168` becomes:

```c
CAMLexport const void *ml_gir_record_ptr_val(value v, const char *type_name) {
    CAMLparam1(v);
    if (Tag_val(v) != Custom_tag ||
        Custom_ops_val(v) != &ocgtk_gir_record_ops) {
        caml_failwithf(
            "ml_gir_record_ptr_val: expected gir_record custom block for %s, "
            "got %s",
            type_name,
            (Tag_val(v) == Custom_tag)
              ? Custom_ops_val(v)->identifier
              : "non-custom block");
    }
    const gir_record_box *box = (const gir_record_box*)Data_custom_val(v);
    if (box->ptr == NULL)
        caml_failwith("ml_gir_record_ptr_val: NULL record pointer");
    CAMLreturnT(const void*, box->ptr);
}
```

Notes:

- The legacy `ext_of_val` fallback path at line 162 is **removed**. We
  verified it is not exercised by any of today's record bindings (the
  opaque path always allocates via `ml_gir_record_val_ptr_with_type`,
  which produces an `ocgtk.gir_record` Custom block; the value-like path
  is the bug we're fixing in Phase 3).
- `caml_failwithf` is preferred over `caml_failwith` so error messages
  identify the actual mistreated kind for debugging.
- A new test `ocgtk/tests/gtk/test_record_finalizer.ml` already exists
  (added in PR #125). Extend it with a `test_cross_kind_ml_gir_record_ptr_val_rejects_gobject`
  that allocates a `Val_GObject(...)` and confirms passing it to a
  record-expecting binding raises `Failure`.

**Build/test verification**: full `dune build` + tests must pass. The
extended record finalizer tests must include the new cross-kind rejection.

### Phase 3 — Generator emits asserting `_val` for value-like records (closes task #1)

`gir_gen/lib/generate/c_stub_record.ml:87` becomes:

```ocaml
bprintf buf
  "#define %s_val(val) \
   ((%s*)ml_gir_record_ptr_val((val), %S))\n"
  record.c_type record.c_type record.c_type;
```

This makes the value-like record `_val` macro use the same hardened
helper as the opaque-record path — single source of truth for
"unwrap a record-shaped value", with the assertion in Phase 2 now
covering both call sites.

The matching `Val_<X>` macro (`copy_<X>` invocation at line 89) is
unchanged: `copy_<X>` is generated separately and already returns a
`gir_record_box` Custom block via `ml_gir_record_val_ptr_with_type`.
The fix is solely on the read side.

**Generator unit-test addition** in
`gir_gen/test/c_stubs/record_macro_tests.ml` (new or extended): given a
synthetic value-like record with `glib:get-type`, assert that
`generate_forward_decls` emits the `ml_gir_record_ptr_val(...)` form
and **does not** emit `ext_of_val(...)`.

**Regenerate** all 9 namespaces:

```bash
bash scripts/generate-bindings.sh
```

Diff inspection: expect ~14 changed `<ns>_decls.h` files (the value-like
record macros enumerated above), no other changes. Spot-check
`ml_widget_gen.c` is **unchanged** (widgets are GObjects, not records).

**Build/test verification**: `dune build`; `dune test gir_gen/`;
`xvfb-run dune test ocgtk/`. Manually exercise calculator-app and
form-example end-to-end (touch a `GdkRGBA`, a `PangoColor`, a
`GtkTreeIter`, a `GtkTextIter`).

### Phase 4 — Document; flag the divergence

Update `architecture/FFI_GUIDELINES.md` with:

1. A "Canonical paths" table listing each kind and its allocator + reader.
2. A note that `wrappers.h:189-190` (`GObject_val`/`Val_GObject`
   Abstract-block macros) and `wrappers.c:241-253` (`val_of_ext`/`ext_of_val`)
   are **legacy** paths kept only for `lookup_info`, the
   `ml_gtk.c` widget glue, and `ml_glib.c` GMainLoop wrapping. New
   code must not use them.
3. A note that `Val_pointer`/`Pointer_val` use a different Abstract-block
   layout than `val_of_ext`/`ext_of_val` and the two are **not**
   interchangeable.
4. The recommended pattern for adding a new custom-block kind: define
   the ops struct, expose it in `value_kinds.h`, extend
   `ocgtk_classify`, add an asserting accessor.

No code change in this phase beyond the doc.

### Phase 5 — Length-linked array out-param fix (task #3, **independent**)

This is unrelated to the registry work; tracking it in the same plan
because it's the third tagged cleanup task.

`ocgtk/src/gtk/generated/ml_tree_path_gen.c:129-146` builds the result
tuple as `(int array, int)` but the OCaml signature is
`int array option * int`. Fix the generator emitter (located in
`gir_gen/lib/generate/c_stub_array_conv.ml` — exact site to be
identified during execution) so length-linked array out-params with
nullable element-type wrap the array in `Some` / `Val_none` based on
the C result pointer being non-NULL.

Add a runtime test exercising
`Gtk.Tree_path.get_indices_with_depth` on an empty path (depth=0,
indices=NULL → `(None, 0)`) and a non-empty path
(`Some [|...|], depth`). Place in `ocgtk/tests/gtk/test_tree_path.ml`
(new file) or extend an existing tree-path test.

**Regenerate** affected namespaces. Inspect diff — expect the change to
appear in any binding for a function returning `<array length="N">` of
nullable. Audit list before regen by grepping the generator output for
the broken pattern.

**Build/test verification**: full build + tests; new tree-path test
must pass.

### Phase 6 — (Deferred) Wider migration off `val_of_ext`/`ext_of_val`

Tracked here for completeness; **not in scope of this plan's MR**.

Targets:

- `ocgtk/src/gtk/core/ml_gtk.c` `GtkWidget_val`/`Val_GtkWidget` →
  use `ml_gobject_*_of_val` (Custom block). Risk: the hand-written
  glue may rely on the Abstract-block layout in places we haven't
  located. Audit before changing.
- `ocgtk/src/common/ml_glib.c:301` GMainLoop wrap → introduce a tiny
  custom block (no finalizer needed if we don't own the loop).
- `ocgtk/src/gtk/core/converters.c:29` widget option → same path as
  `ml_gtk.c`.
- `ocgtk/src/common/wrappers.h:189-190` → delete after confirming no
  consumer.
- `ocgtk/src/common/wrappers.h:96-97` `Val_lookup_info`/`Lookup_info_val`
  → can stay (read-only static tables, no GC root, no finalizer
  needed) but document that this is the *only* sanctioned use of the
  Abstract-block path.

### Phase 7 — (Deferred) Use `ocgtk_classify` from Signal_marshaller

When Milestone 2 Phase 1b lands, the marshaller calls `ocgtk_classify`
to dispatch from a `gir_param` to the right boxer/unboxer. This is the
first **dynamic** consumer of the registry; before then the registry
exists only for the asserting accessors and the documentation it
enables.

---

## Stage Sequence and Acceptance

| Stage | Depends on | Key files | Acceptance |
|---|---|---|---|
| 0 | f7fd97a9 | `wrappers.{c,h}`, `converters.c`, `ml_gtk.c`, `SECURITY_GUIDELINES.md`, `FFI_GUIDELINES.md` | All dead symbols removed; `ml_gtk_widget_destroy` migrated to Custom-block path; build + tests green; manual app smoke OK |
| 1 | Stage 0 | `value_kinds.{h,c}`, all `ml_*.c` files holding ops structs | Build + tests green; new `test_value_kinds.ml` passes; symbol audit shows the seven `ocgtk_*_ops` extern symbols |
| 2 | Stage 1 | `wrappers.c`, `tests/gtk/test_record_finalizer.ml` | Cross-kind rejection test fails before, passes after; full tests green |
| 3 | Stage 2 | `c_stub_record.ml`, `<ns>_decls.h` (regen) | Generator unit test passes; regen diff is exactly the ~14 expected macros; full build + tests green; manual app smoke OK |
| 4 | Stage 3 | `architecture/FFI_GUIDELINES.md` | Doc-only; reviewer signoff |
| 5 | (independent) | `c_stub_array_conv.ml`, regen, `tests/gtk/test_tree_path.ml` | New test passes; full build + tests green |
| 6 | Stage 4 | `ml_glib.c` (migrate `Val_GMainLoop` to a custom block) | Out of this plan's scope; nominal follow-up MR |
| 7 | Milestone 2 Phase 1b | Signal_marshaller | Out of this plan's scope |

## Risks and Mitigations

- **Symbol-name collisions.** De-static-ing seven ops structs introduces
  seven new public C symbols. Mitigate by the `ocgtk_` prefix; audit
  with `nm` after Stage 1 to confirm no other `ocgtk_` symbols clash.
- **Generated `<ns>_decls.h` regen scope creep.** Stage 3 regen must
  produce only the targeted ~14 macro changes. If the diff is larger,
  stop, investigate, do not commit. Likely cause would be incidental
  formatting drift in the generator.
- **`caml_failwithf` raises async.** The hardening in Stage 2 changes
  silent garbage reads into raised `Failure` exceptions. There is a
  small chance some site silently relied on the garbage read producing
  a NULL that was then null-checked downstream. Mitigation: the
  exception message names the offending kind, so any site that
  regresses will produce a clear, debuggable failure rather than
  silent breakage.
- **Test environments without GTK display.** Use `xvfb-run` for the
  ocgtk/ tests as established by the project. The `value_kinds` and
  `record_finalizer` tests do not require a display.

## Out-of-Scope Notes Captured for Posterity

- **Single envelope (Design B in design discussion).** Rejected: forces
  rewrite of every existing `<X>_val` / `Val_<X>` macro across the
  generator and hand-written code, loses per-kind finalizer specialisation
  that already works correctly. Registry approach captures the same
  win additively.
- **Eliminating `val_of_ext`/`ext_of_val` entirely.** Possible long-term
  but out of scope: the `lookup_info` use is benign (read-only static
  tables), and migrating `ml_gtk.c` widget glue is a separate audit.
- **Inline-struct boxed records (Milestone 3).** Will register a new
  `ocgtk_inline_struct_ops` (or one ops struct per type) in this same
  registry. The plan explicitly leaves a `kind` slot for this.

## Open Questions

1. **Should `ocgtk_gir_record_ops` finalizer-dispatch by GType also be
   exposed as a registry primitive?** Today it's hard-coded inside
   `finalize_gir_record`. Could become more flexible if Milestone 3
   wants the same GType-aware dispatch for inline-struct records, but
   premature to design now.
2. **`identifier` string vs. ops-pointer comparison.** Pointer
   comparison is faster and stronger (proves same translation unit
   chain); string comparison is more forgiving across dynamically loaded
   modules. ocgtk has no dynamic loading today, so pointer comparison
   wins. Document this choice.
3. **Should `Lookup_info_val` migrate to a custom block or stay
   Abstract?** Tables are static, immutable, and never freed. A custom
   block adds two words per table for no gain. Recommend leaving as-is
   and documenting it as the lone sanctioned Abstract-block consumer.
