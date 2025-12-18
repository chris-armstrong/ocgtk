(**************************************************************************)
(*                LablGTK4 - OCaml bindings for GTK4                      *)
(*                                                                        *)
(*    This program is free software; you can redistribute it              *)
(*    and/or modify it under the terms of the GNU Library General         *)
(*    Public License as published by the Free Software Foundation         *)
(*    version 2, with the exception described in file COPYING which       *)
(*    comes with the library.                                             *)
(*                                                                        *)
(**************************************************************************)

(* Minimal Gpointer module for enum conversions and boxed pointers *)

(* Boxed pointers *)
type boxed
let boxed_null : boxed = Obj.magic Nativeint.zero

exception Null

(* Variant table type for enum conversions *)
type 'a variant_table constraint 'a = [> ]

external decode_variant : 'a variant_table -> int -> 'a
    = "ml_lookup_from_c"
external encode_variant : 'a variant_table -> 'a -> int
    = "ml_lookup_to_c"
(* TODO: Add flags support when needed
external decode_flags : 'a variant_table -> int -> 'a list
    = "ml_lookup_flags_from_c"
external encode_flags : 'a variant_table -> 'a list -> int
    = "ml_lookup_flags_to_c"
*)
