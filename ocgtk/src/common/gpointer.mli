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

(** Minimal Gpointer module for enum conversions and boxed pointers *)

type boxed
(** Abstract type for boxed pointers *)

val boxed_null : boxed
(** The null boxed pointer *)

exception Null
(** Exception raised when a null pointer is encountered *)

type 'a variant_table constraint 'a = [> ]
(** Variant table type for enum conversions *)

external decode_variant : 'a variant_table -> int -> 'a = "ml_lookup_from_c"
(** Decode an integer to a polymorphic variant using the given table *)

external encode_variant : 'a variant_table -> 'a -> int = "ml_lookup_to_c"
(** Encode a polymorphic variant to an integer using the given table *)
