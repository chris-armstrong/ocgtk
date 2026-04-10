# Integer Type Design in ocgtk

## Background

GLib defines a family of sized integer types (`guint16`, `gint16`, `guint32`, `gint32`, `guint64`, etc.)
that appear throughout GTK4 APIs. When generating OCaml bindings, each of these must be mapped to an
OCaml type plus a pair of C conversion macros. The choices made here affect API ergonomics, type
safety, and performance.

## The Problem With Plain `int` / `int32`

The initial implementation of Phase 3.3 (primitive integer type mappings) used the simplest possible
mappings:

| GLib Type | OCaml Type | C macro (in) | C macro (out) |
|-----------|-----------|--------------|---------------|
| `guint16` | `int`     | `Int_val`    | `Val_int`     |
| `gint16`  | `int`     | `Int_val`    | `Val_int`     |
| `guint32` | `int`     | `Long_val`   | `Val_long`    |
| `gint32`  | `int32`   | `Int32_val`  | `caml_copy_int32` |

This has two significant problems:

**Silent truncation.** Passing `70000 : int` for a `guint16` parameter compiles without warning and
silently wraps to `4464` at the C boundary. There is no runtime error, no type error, and nothing in
the `.mli` to indicate the value is bounded.

**No documentation signal.** Generated `.mli` files show `int` with no hint that the semantic range
is `[0, 65535]`. Users must consult GLib documentation to learn this; the OCaml API provides no help.

## Why Not the `integers` Library?

The `integers` opam package (already a dependency for `guint64`) provides OCaml types like
`Unsigned.UInt16.t`, `Unsigned.UInt32.t`, and `Signed.Int32.t`. Using these was considered.

**Investigation of `ocaml_integers.h`** revealed:

```c
/* Unsigned only — no signed types at all */
#define Integers_val_uint8(t)  ((Val_int((uint8_t)t)))
#define Integers_val_uint16(t) ((Val_int((uint16_t)t)))
#define Uint8_val(V)   ((uint8_t)(Int_val(V)))
#define Uint16_val(V)  ((uint16_t)(Int_val(V)))
#define Uint32_val(V)  (*((uint32_t *) Data_custom_val(V)))
#define Uint64_val(V)  (*((uint64_t *) Data_custom_val(V)))

CAMLextern value integers_copy_uint32(uint32_t u);
CAMLextern value integers_copy_uint64(uint64_t u);
```

Key findings:
- **No signed C support at all.** `Int16_val`, `Int32_val`, `integers_copy_int16`,
  `integers_copy_int32` — none of these exist. Any signed type mapping would require writing
  our own C macros regardless.
- **`UInt16` is just `Int_val` in disguise.** `Uint16_val` performs no range check; it simply
  casts the OCaml int tag value. No safety benefit over the status quo on the C side.
- **`UInt32` and `UInt64` use custom blocks (heap allocations).** Using `Unsigned.UInt32.t` for
  the very common `guint32` type would introduce heap allocation on every call — undesirable given
  that OCaml's 63-bit `int` already covers the full uint32 range on 64-bit platforms.

`Unsigned.UInt64.t` is kept for `guint64` because it was already working and genuinely requires
64-bit storage that cannot fit in an OCaml `int`.

## Decision: Custom `bounded_int` Module

A purpose-built `src/common/bounded_int.ml` provides opaque bounded integer types backed by
`private int`. This gives:

- **Type safety at the OCaml level.** `UInt16.of_int` raises `Invalid_argument` on out-of-range
  values. The error surface is in OCaml code visible to the user, not silent in a C stub.
- **Self-documenting APIs.** Seeing `UInt16.t` in a `.mli` immediately communicates the
  semantic range without consulting external documentation.
- **No heap allocation.** `type t = private int` keeps the representation as an OCaml tagged
  integer — no boxing, no GC pressure.
- **No new C infrastructure needed.** All six types fit within OCaml's 63-bit `int` on 64-bit
  platforms, so the C macros are simple casts via `Long_val`/`Val_long`.

### Module Set

Defined as flat top-level modules within the `Ocgtk_common` library (deliberately shadowing
stdlib `Int32` etc. — users requiring both can qualify as `Stdlib.Int32`):

| Module  | Type alias   | Range                       | GLib types   |
|---------|--------------|-----------------------------|--------------|
| `UInt8` | `private int`| `[0, 255]`                  | `guint8`     |
| `Int8`  | `private int`| `[-128, 127]`               | `gint8`      |
| `UInt16`| `private int`| `[0, 65535]`                | `guint16`    |
| `Int16` | `private int`| `[-32768, 32767]`           | `gint16`     |
| `UInt32`| `private int`| `[0, 4294967295]`           | `guint32`    |
| `Int32` | `private int`| `[-2147483648, 2147483647]` | `gint32`     |

Each module exposes:

```ocaml
type t = private int

val of_int : int -> t
(** [of_int n] is [n] as a bounded integer.
    @raise Invalid_argument if [n] is outside the valid range. *)

val to_int : t -> int
val min_int : t
val max_int : t
val zero : t       (* unsigned modules only *)
val minus_one : t  (* signed modules only *)
```

### C Macro Layer

Added to `src/common/wrappers.h`:

```c
/* Bounded integer types — all backed by OCaml int (private int representation).
 * The cast on read (UInt16_val, etc.) handles sign/zero extension from OCaml's
 * tagged int correctly. The cast on write (Val_uint16, etc.) ensures the value
 * is stored with the correct bit pattern before tagging. */
#define UInt8_val(v)           ((uint8_t)(Long_val(v)))
#define Val_uint8(x)           (Val_long((uint8_t)(x)))
#define Int8_val(v)            ((int8_t)(Long_val(v)))
#define Val_int8(x)            (Val_long((int8_t)(x)))
#define UInt16_val(v)          ((uint16_t)(Long_val(v)))
#define Val_uint16(x)          (Val_long((uint16_t)(x)))
#define Int16_val(v)           ((int16_t)(Long_val(v)))
#define Val_int16(x)           (Val_long((int16_t)(x)))
#define UInt32_val(v)          ((uint32_t)(Long_val(v)))
#define Val_uint32(x)          (Val_long((uint32_t)(x)))
#define Int32_val_bounded(v)   ((int32_t)(Long_val(v)))   /* avoids clash with caml Int32_val */
#define Val_int32_bounded(x)   (Val_long((int32_t)(x)))
```

Note: `Int32_val_bounded` and `Val_int32_bounded` are named to avoid collision with OCaml's own
`Int32_val` macro (used for the boxed `int32` type).

### `type_mappings.ml` Changes

| GIR Type  | Old OCaml type | New OCaml type | Old C→OCaml        | New C→OCaml          | Old OCaml→C   | New OCaml→C          |
|-----------|---------------|---------------|--------------------|----------------------|---------------|----------------------|
| `guint16` | `int`         | `UInt16.t`    | `Val_int`          | `Val_uint16`         | `Int_val`     | `UInt16_val`         |
| `gint16`  | `int`         | `Int16.t`     | `Val_int`          | `Val_int16`          | `Int_val`     | `Int16_val`          |
| `guint32` | `int`         | `UInt32.t`    | `Val_long`         | `Val_uint32`         | `Long_val`    | `UInt32_val`         |
| `gint32`  | `int32`       | `Int32.t`     | `caml_copy_int32`  | `Val_int32_bounded`  | `Int32_val`   | `Int32_val_bounded`  |

## User-Visible Impact

```ocaml
(* Before Task 3.3.1: silent, unchecked *)
widget#set_width 70000         (* compiles; C silently truncates guint16 to 4464 *)

(* After Task 3.3.1: explicit, documented, raises on bad input *)
widget#set_width (UInt16.of_int 70000)   (* raises Invalid_argument at the OCaml call site *)
widget#set_width (UInt16.of_int 500)     (* fine *)
```

The conversion failure is visible, predictable, and catchable in OCaml — not buried in a C stub.

## Platform Assumptions

This design assumes a **64-bit OCaml runtime** (where `int` is 63 bits). All six ranges
(`UInt8` through `Int32`) fit comfortably. 32-bit OCaml would be a problem for `UInt32` (max
4,294,967,295 exceeds 31-bit `int`), but ocgtk does not support 32-bit targets and makes no
attempt to accommodate them.

## Alternatives Considered

| Alternative | Reason Rejected |
|------------|----------------|
| Keep `int`/`int32`, add C-side range checks | Errors surface in C, not in OCaml; no type-level documentation |
| Use `integers` library types throughout | No signed C support; `UInt32.t` heap-allocates; naming (`Unsigned.UInt32.t`) more verbose |
| Use `private int` but in same file as mappings | Would conflate generator config with runtime library |
| Use phantom types | Adds complexity without improving error messages |
