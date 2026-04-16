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

    GVariantType describes the type of a GVariant value. It is used for type
    checking and construction of complex types.

    This is an immutable type that uses g_variant_type_copy/free. *)

(** {2 Types} *)

type t
(** Opaque GVariantType - backed by GVariantType* with free finalizer *)

(** {2 Constructors} *)

val of_string : string -> t
(** Create a GVariantType from a type string (e.g., "i", "s", "as", "a{sv}") *)

(** {2 Accessors} *)

val to_string : t -> string
(** Get the type string representation *)

(** {2 Predicates} *)

val is_basic : t -> bool
(** Check if the type is a basic type (not a container) *)

val is_container : t -> bool
(** Check if the type is a container type *)

val is_array : t -> bool
(** Check if the type is an array type *)

val is_dict_entry : t -> bool
(** Check if the type is a dictionary entry type *)

val is_tuple : t -> bool
(** Check if the type is a tuple type *)

val is_variant : t -> bool
(** Check if the type is the variant type "v" *)

(** {2 Type Constants} *)

val unit : t
(** The unit type "()" *)

val boolean : t
(** The boolean type "b" *)

val int32 : t
(** The int32 type "i" *)

val int64 : t
(** The int64 type "x" *)

val double : t
(** The double type "d" *)

val string : t
(** The string type "s" *)

val object_path : t
(** The object path type "o" *)

val signature : t
(** The signature type "g" *)

val variant : t
(** The variant type "v" *)

val byte : t
(** The byte type "y" *)

val int16 : t
(** The int16 type "n" *)

val uint16 : t
(** The uint16 type "q" *)

val uint32 : t
(** The uint32 type "u" *)

val uint64 : t
(** The uint64 type "t" *)

val handle : t
(** The handle type "h" *)
