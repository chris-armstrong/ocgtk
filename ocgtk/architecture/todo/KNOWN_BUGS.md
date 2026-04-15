# Known Bugs and Limitations

This file tracks known issues and intentional limitations, with enough context to
understand what needs to be done and why it's non-trivial.

---

## BUG-001: `void*`/`gpointer` Byte-Buffer Arrays Cannot Be Generated

**Status:** Deferred — requires length-erasure infrastructure
**Affects:** ~50+ methods in Gio, Gdk, GdkPixbuf
**Related plan:** `docs/plans/gobject_glib_type_mappings.md` (Phase 3.3 notes)

### Description

Many GTK/GIO APIs pass binary data as a `(void* buffer, gsize count)` pair. In GIR these
appear as:

```xml
<parameter name="buffer" direction="out">
  <array length="1" c:type="void*">
    <type name="guint8"/>
  </array>
</parameter>
<parameter name="count" name="count" type="gsize"/>
```

The C type is `void*` (or `gpointer`, `const void*`, `gconstpointer`), with element type
`guint8` in GIR. This combination is a "byte buffer" idiom, not a typed array.

### Why Generation Fails

The generator has two problems when it encounters these:

**Problem 1 — `guint8` in type_mappings causes subscript errors:**
If `guint8` is registered, the C stub generator tries to emit:
```c
void out1 = NULL;  /* WRONG: void is not a type */
gssize result = g_input_stream_read(GInputStream_val(self), &out1, ...);
for (int i = 0; i < out1_length; i++) {
    Store_field(ml_out1, i, Val_int(out1[i]));  /* WRONG: cannot subscript void* */
}
```
This fails to compile: `void` is not a declarable type and `void*` cannot be subscripted.

**Problem 2 — Length parameter coupling:**
The `count` / `gsize` length parameter is GIR-level plumbing that should be hidden from
the OCaml API. The caller should pass a `Bytes.t` or `string` and the length should be
derived automatically. Instead, our current generator exposes it as a separate `int` argument.

### Affected APIs (examples)

| Method | Issue |
|--------|-------|
| `g_input_stream_read` | `void *buffer` out-param + `gsize count` |
| `g_input_stream_read_all` | `void *buffer` out-param + `gsize count` |
| `g_output_stream_write` | `const void *buffer` in-param + `gsize count` |
| `g_output_stream_write_all` | `const void *buffer` in-param + `gsize count` |
| `g_buffered_input_stream_peek_buffer` | returns `const void*` with length out-param |
| `gdk_texture_download` | `guint8 *data` out-param + `gsize stride` |
| `gtk_css_provider_load_from_data` | `const char *data` + `gssize length` (string variant) |

### Correct OCaml API Design

The idiomatic OCaml binding for these methods erases the length parameter and exposes
the buffer as `Bytes.t` (mutable) or `string` (immutable/const):

```ocaml
(* g_input_stream_read: read up to count bytes into buffer *)
val read : t -> bytes -> int -> GCancellable.t option -> (int, GError.t) result

(* g_output_stream_write: write count bytes from buffer *)
val write : t -> bytes -> int -> GCancellable.t option -> (int, GError.t) result
```

### Implementation Path

**Option A — Override sexp annotation:**
Add a new override type, e.g. `(buffer_param "buffer" "count")`, that marks a `(void*, gsize)`
pair to be collapsed into a `bytes` parameter in the generated binding.

**Option B — Suppress generation, write manual binding:**
Add methods to the override file under a `(skip_method ...)` directive and write
hand-crafted bindings in the corresponding `core/` directory.

**Option C — Detect and suppress automatically:**
In `filtering.ml`, detect `void*`/`gpointer` c_type with `guint8` element type and
suppress those methods, generating a "needs manual binding" comment in output.

**Current decision:** Option C (auto-suppress) is recommended as the first step. The
`guint8` type mapping has been intentionally omitted from `type_mappings.ml` to avoid
triggering generation of these methods until the infrastructure exists.

### Interaction with BUG-002

The buffer issue is a special case of the broader array length erasure problem. See BUG-002.

---

## BUG-002: Array Length Parameters Are Exposed at Layer 1 and Layer 2

**Status:** Deferred — requires significant generator changes
**Affects:** All array-taking methods across all namespaces
**Related plan:** `docs/plans/gobject_glib_type_mappings.md`

### Description

When a method takes an array parameter with an explicit length, GIR encodes this as two
separate parameters: the array and the length. For example:

```xml
<parameter name="types" type="GType*" length="1"/>
<parameter name="n_types" type="gsize"/>
```

The current generator exposes both parameters at Layer 1 and Layer 2:

```ocaml
(* Layer 1 — current (wrong) *)
val set_gtypes : t -> int array option -> int -> unit

(* Layer 1 — desired *)
val set_gtypes : t -> int array option -> unit
(* length derived from Array.length *)
```

The length parameter is C-level plumbing and should never be exposed as a separate argument.

### Why It's Hard

1. **GIR `length` attribute is an index into the parameter list**, not a name. The linkage
   needs to be resolved before parameter list building, not after.
2. **Out-array lengths are more complex:** When an array is an out-parameter, the length
   is also an out-parameter that the C side fills in.
3. **Layer 2 needs updating too:** Layer 2 wraps Layer 1, so signature changes propagate.

### Affected APIs (examples)

| Method | Exposed length param |
|--------|---------------------|
| `gtk_drop_target_set_gtypes` | `n_types : int` after `types : int array option` |
| `gtk_list_store_newv` | `n_columns : int` after `types : int array` |
| `gtk_tree_store_newv` | `n_columns : int` after `types : int array` |
| `gtk_drop_target_get_gtypes` | returns `(int array * int)` — length in tuple |
| `g_socket_receive` | `size : int` after `buffer : bytes` |

### Implementation Path

1. During parameter list construction in `layer1_method.ml`, detect when a `gsize`/`int`
   parameter is the `length=N` annotation of an adjacent array parameter.
2. Mark it as "hidden" — emit it in C but not in OCaml.
3. For in-arrays: derive count from `Array.length arr` in generated C.
4. For out-arrays: emit a local `gsize` variable in C, use its value to build the return array.
5. Update Layer 2 wrappers to match.

---

## BUG-003: Formatting Check (`dune build @fmt`) Fails for dune Files

**Status:** Pre-existing, unrelated to current work
**Affects:** `src/common/dune`, `src/gtk/dune`, `src/gdk/dune`, and several others
**Root cause:** `ocamlformat` not in `PATH` in this environment, so `dune build @fmt`
errors out before it can promote the dune file formatting changes. The dune file style
issues are whitespace/indentation only and do not affect compilation or correctness.

**Fix:** Ensure `ocamlformat` is available in the build environment and run
`dune build @fmt --auto-promote`.

---

## BUG-004: Interface Parameters in Methods Are Suppressed

**Status:** Intentionally suppressed
**Affects:** Methods that accept interface types as parameters

Methods that accept interface types as parameters are skipped during layer 2 generation.
Interface types require special handling because they're implemented by multiple classes.

**Workaround:** Use layer 1 (low-level) APIs directly when interface parameters are needed.

**Future work:** Implement proper interface parameter handling with `as_<interface>` accessor methods.

---

## BUG-005: Static Methods (`<function>` declarations) Are Not Generated

**Status:** Not yet implemented

Static function wrappers operate similarly to methods but have no implicit `self` parameter.
Support needs to be added to `c_stubs.ml` and `layer1_method.ml`.

---

## BUG-006: Interfaces Are Not Fully Generated; Virtual Methods Are Not Generated

**Status:** Not yet implemented

`<interface>` elements are parsed and generated as classes, but should be generated as
virtual classes with virtual methods. `<virtual-method>` elements are not parsed or generated.

---

## BUG-007: Signals with Parameters Are Not Generated

**Status:** Not yet implemented

Only parameterless void signals are generated. Signals with parameters or return values
are skipped. See `generate/signal_gen.ml`.

---

## BUG-008: `<varargs>` Parameters Are Not Handled Correctly

**Status:** Not yet implemented

`<varargs>` is not parsed and defaults to `void`. Methods are correctly suppressed, but
the handling should be made explicit rather than relying on a type defaulting side-effect.

---

## BUG-010: macOS Build Failure — `gio/gdesktopappinfo.h` Not Found

**Status:** Open
**Affects:** macOS (Homebrew), all architectures

### Symptom

The build fails on macOS with:

```
generated/gio_decls.h:13:10: fatal error: 'gio/gdesktopappinfo.h' file not found
```

This header is included unconditionally in `src/gio/generated/gio_decls.h` and
propagates to every C file that includes it (all of `ml_gio.c` and most generated
GIO C stubs).

### Root Cause

`gio/gdesktopappinfo.h` is a Unix-only GIO header for desktop application metadata
(`.desktop` files). It is not available on macOS (Homebrew's `glib` package omits it).
The GIR generator emits it unconditionally in `gio_decls.h` because
`GDesktopAppInfo` appears in the GIO namespace GIR file.

### Fix Required

The `gio_decls.h` generator (in `src/tools/gir_gen`) should wrap Unix-only headers
in `#ifdef G_OS_UNIX` guards, or add a `GDesktopAppInfo`-related entry to
`overrides/gio.sexp` to exclude the Unix-only types on non-Unix platforms.

Regenerating bindings after either fix will resolve the macOS build.

---

## BUG-009: GList/GSList of Interface Types Generates Broken C Stubs

**Status:** Known issue — affected methods are filtered out

When generating C stubs for GList/GSList parameters containing interface types
(e.g., `GSList<Gio.File>` in `gdk_file_list_new_from_list`), the generator produces
incorrect code that attempts to copy the interface struct by value.

**Root cause:** GObject interfaces don't have public struct definitions — they're opaque
types accessed only via pointers. The C stub generator incorrectly treats them as value types.

**Workaround:**
- For same-namespace class types (e.g., `Window.t`, `Texture.t`): works correctly
- For interface types: currently filtered out; use manual C stubs if needed

**Related:** See `filtering.ml:is_interface_type` and `list_has_interface_element`.
