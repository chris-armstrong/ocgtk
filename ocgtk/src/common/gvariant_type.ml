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

(** GVariantType - Type description for GVariant

    GVariantType describes the type of a GVariant value.
    It is used for type checking and construction of complex types.
    
    This is an immutable type that uses g_variant_type_copy/free.
*)

(** {2 Types} *)

type t
(** Opaque GVariantType - backed by GVariantType* with free finalizer *)

(** {2 Constructors} *)

external of_string : string -> t = "ml_g_variant_type_new"
(** Create a GVariantType from a type string (e.g., "i", "s", "as", "a{sv}") *)

(** {2 Accessors} *)

external to_string : t -> string = "ml_g_variant_type_get_string"
(** Get the type string representation *)

(** {2 Predicates} *)

external is_basic : t -> bool = "ml_g_variant_type_is_basic"
(** Check if the type is a basic type (not a container) *)

external is_container : t -> bool = "ml_g_variant_type_is_container"
(** Check if the type is a container type *)

external is_array : t -> bool = "ml_g_variant_type_is_array"
(** Check if the type is an array type *)

external is_dict_entry : t -> bool = "ml_g_variant_type_is_dict_entry"
(** Check if the type is a dictionary entry type *)

external is_tuple : t -> bool = "ml_g_variant_type_is_tuple"
(** Check if the type is a tuple type *)

external is_variant : t -> bool = "ml_g_variant_type_is_variant"
(** Check if the type is the variant type "v" *)

(** {2 Type Constants} *)

external unit : unit -> t = "ml_g_variant_type_unit"
(** The unit type "()" *)

let unit = unit ()

external boolean : unit -> t = "ml_g_variant_type_boolean"
(** The boolean type "b" *)

let boolean = boolean ()

external int32 : unit -> t = "ml_g_variant_type_int32"
(** The int32 type "i" *)

let int32 = int32 ()

external int64 : unit -> t = "ml_g_variant_type_int64"
(** The int64 type "x" *)

let int64 = int64 ()

external double : unit -> t = "ml_g_variant_type_double"
(** The double type "d" *)

let double = double ()

external string : unit -> t = "ml_g_variant_type_string"
(** The string type "s" *)

let string = string ()

external object_path : unit -> t = "ml_g_variant_type_object_path"
(** The object path type "o" *)

let object_path = object_path ()

external signature : unit -> t = "ml_g_variant_type_signature"
(** The signature type "g" *)

let signature = signature ()

external variant : unit -> t = "ml_g_variant_type_variant"
(** The variant type "v" *)

let variant = variant ()

external byte : unit -> t = "ml_g_variant_type_byte"
(** The byte type "y" *)

let byte = byte ()

external int16 : unit -> t = "ml_g_variant_type_int16"
(** The int16 type "n" *)

let int16 = int16 ()

external uint16 : unit -> t = "ml_g_variant_type_uint16"
(** The uint16 type "q" *)

let uint16 = uint16 ()

external uint32 : unit -> t = "ml_g_variant_type_uint32"
(** The uint32 type "u" *)

let uint32 = uint32 ()

external uint64 : unit -> t = "ml_g_variant_type_uint64"
(** The uint64 type "t" *)

let uint64 = uint64 ()

external handle : unit -> t = "ml_g_variant_type_handle"
(** The handle type "h" *)

let handle = handle ()