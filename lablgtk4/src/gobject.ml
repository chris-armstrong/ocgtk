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

(* GObject module for enum conversions and basic type system *)

(** Type system *)
module Type = struct
  type t = int  (* GType is represented as int *)

  external name : t -> string = "ml_g_type_name"
  external parent : t -> t = "ml_g_type_parent"
  external is_a : t -> t -> bool = "ml_g_type_is_a"
end

(** GValue operations *)
module Value = struct
  type t  (* Abstract type for GValue *)

  external create : unit -> t = "ml_g_value_new"
  external init : t -> _ -> unit = "ml_g_value_init"
  external reset : t -> unit = "ml_g_value_reset"

  external get_int : t -> int = "ml_g_value_get_int"
  external set_int : t -> int -> unit = "ml_g_value_set_int"

  external get_string : t -> string = "ml_g_value_get_string"
  external set_string : t -> string -> unit = "ml_g_value_set_string"

  external get_boolean : t -> bool = "ml_g_value_get_boolean"
  external set_boolean : t -> bool -> unit = "ml_g_value_set_boolean"
end

(** Object operations *)
module Object = struct
  type 'a t  (* Abstract object type *)

  external get_type : 'a t -> Type.t = "ml_g_object_get_type"
  external obj_ref : 'a t -> unit = "ml_g_object_ref"
  external obj_unref : 'a t -> unit = "ml_g_object_unref"
end

(** Enum conversion support (from Phase 1.3) *)
module Data = struct
  (* enum: creates encoder/decoder pair for simple enumerations *)
  let enum tbl =
    (Gpointer.decode_variant tbl, Gpointer.encode_variant tbl)

  (* flags: creates encoder/decoder pair for flag-type enumerations
     Flags can be combined with bitwise OR, so we need to handle lists *)
  let flags tbl =
    let decode flags =
      (* For now, just decode as a single value - full flag support would
         require decoding each bit and returning a list *)
      Gpointer.decode_variant tbl flags
    in
    let encode flag =
      (* For now, just encode as a single value - full flag support would
         require encoding a list and combining with bitwise OR *)
      Gpointer.encode_variant tbl flag
    in
    (decode, encode)
end
