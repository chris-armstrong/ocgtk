# Known Bugs and Unsolved Problems

This file tracks known issues that are deferred for future work, with enough context
to understand what needs to be done and why it's non-trivial.

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
The `count` / `gsize` length parameter is GIR-level "plumbing" that should be hidden from
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
(* C: gssize g_input_stream_read(GInputStream*, void *buffer, gsize count, GCancellable*, GError**) *)
val read : t -> bytes -> int -> GCancellable.t option -> (int, GError.t) result

(* g_output_stream_write: write count bytes from buffer *)
(* C: gssize g_output_stream_write(GOutputStream*, const void *buffer, gsize count, GCancellable*, GError**) *)
val write : t -> bytes -> int -> GCancellable.t option -> (int, GError.t) result
```

The `int` argument here is the count (how many bytes to read/write from the buffer). The
buffer pointer comes from `Bytes.unsafe_to_string` or pinning. This is the lablgtk3 pattern.

### Implementation Path

This requires a **"buffer override" mechanism** in the generator, similar to how Rust's
`gir` tool handles `[ByteArray]`-tagged parameters. Options:

**Option A — Override sexp annotation:**
Add a new override type, e.g. `(buffer_param "buffer" "count")`, that marks a `(void*, gsize)`
pair to be collapsed into a `bytes` parameter in the generated binding. The generator then:
1. Takes `bytes` (or `string`) as input
2. Passes `Bytes.unsafe_to_string buf` as the void pointer
3. Passes `Bytes.length buf` as the count
4. Hides the count param from the OCaml signature

**Option B — Suppress generation, write manual binding:**
Add methods to the override file under a `(skip_method ...)` directive and write
hand-crafted bindings in the corresponding `core/` directory. The generator already
suppresses methods listed there. This is the simplest path to unblocking specific methods.

**Option C — Detect and suppress automatically:**
In `filtering.ml`, detect `void*`/`gpointer` c_type with `guint8` element type and
suppress those methods in the generator (adding them to the "needs manual binding" list
in generated output). The manual bindings are then written by hand.

**Current decision:** Option C (auto-suppress) is recommended as the first step, since it
avoids generating broken C stubs while we design the override infrastructure. The
`guint8` type mapping has been intentionally omitted from `type_mappings.ml` to avoid
triggering generation of these methods until the infrastructure exists.

### Interaction with Array Length Erasure (BUG-002)

The buffer issue is a special case of the broader array length erasure problem: any time
GIR exposes a `(array, length)` parameter pair, the OCaml API should ideally hide the
length. See BUG-002 for the general case.

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

The length parameter is C-level plumbing. It should always be derived from the array's
actual length in the OCaml binding, never exposed as a separate argument.

### Why It's Hard

The generator currently threads the length as a separate OCaml argument because:

1. **GIR `length` attribute is an index into the parameter list**, not a name. The generator
   reads `length="1"` to mean "parameter index 1 provides the length". This linkage needs
   to be resolved before parameter list building, not after.

2. **Out-array lengths are more complex:** When an array is an out-parameter, the length
   is also an out-parameter that the C side fills in. The OCaml binding must allocate the
   return array using that length, then hide the length from the return type.

3. **Layer 2 needs updating too:** Layer 2 wraps Layer 1, so if Layer 1 changes its
   signature, Layer 2 must change accordingly.

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
2. Mark that parameter as "hidden" — emit it in C but not in OCaml.
3. For in-arrays: derive count from `Array.length arr` in generated C.
4. For out-arrays: emit a local `gsize` variable in C, use its value to build the return array.
5. Update Layer 2 wrappers to match.

This is closely related to the `(buffer_param)` override for BUG-001 — both involve
suppressing C-level plumbing from the OCaml API.

---

## BUG-003: Formatting Check (`dune build @fmt`) Fails for dune Files

**Status:** Pre-existing, unrelated to current work  
**Affects:** `src/common/dune`, `src/gtk/dune`, `src/gdk/dune`, and several others  
**Root cause:** `ocamlformat` not in `PATH` in this environment, so `dune build @fmt`
errors out before it can promote the dune file formatting changes. The dune file style
issues are whitespace/indentation only and do not affect compilation or correctness.

**Fix:** Ensure `ocamlformat` is available in the build environment and run
`dune build @fmt --auto-promote` to apply the canonical dune file formatting.
