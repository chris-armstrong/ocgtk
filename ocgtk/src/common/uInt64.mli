(**************************************************************************)
(*                ocgtk - OCaml bindings for GTK4                         *)
(*                                                                        *)
(*    This program is free software; you can redistribute it              *)
(*    and/or modify it under the terms of the GNU Library General         *)
(*    Public License version 2, as published by the                       *)
(*    Free Software Foundation with the exception described in file       *)
(*    COPYING which comes with the library.                               *)
(*                                                                        *)
(*    Based on lablgtk3 (https://github.com/garrigue/lablgtk)             *)
(*                                                                        *)
(**************************************************************************)

(** Unsigned 64-bit integer type for GLib [guint64] values.

    Backed by [int64] internally — values above [Int64.max_int] are stored as
    negative [int64] bit patterns, which round-trip correctly through GTK/GLib C
    calls via [Int64_val] / [caml_copy_int64].

    The type is kept abstract to prevent callers from accidentally using
    [Int64.compare] or other signed operations, which give wrong results for
    values ≥ 2^63. Use {!compare} and {!equal} for comparisons. *)

type t

val zero : t
val one : t
val max_int : t
val of_int : int -> t
val to_int : t -> int
val add : t -> t -> t
val sub : t -> t -> t
val mul : t -> t -> t

val of_string : string -> t
(** Parse a decimal (or 0x/0o/0b prefixed) unsigned integer.
    @raise Invalid_argument if the string is not a valid unsigned integer. *)

val to_string : t -> string
(** Format as an unsigned decimal string. *)

val equal : t -> t -> bool
(** Equality. *)

val compare : t -> t -> int
(** Unsigned comparison. Returns a negative int, zero, or positive int if the
    first argument is less than, equal to, or greater than the second,
    interpreted as unsigned 64-bit values. *)
