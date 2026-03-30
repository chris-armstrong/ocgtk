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

(** GVariant - GLib's variant type for structured data serialization

    GVariant is a variant data type used for:
    - GSettings value storage and retrieval
    - GAction parameters and state  
    - GDBus structured data
    - GtkActionable action targets

    This module provides opaque wrapper type [t] with reference counting,
    plus typed constructors and accessors for all GVariant types.

    Type Codes:
    - b: boolean
    - y: byte (uint8)
    - n: int16
    - q: uint16  
    - i: int32
    - u: uint32
    - x: int64
    - t: uint64
    - d: double
    - s: string
    - o: object_path
    - g: signature
    - h: handle (file descriptor)
    - v: variant
    - m*: maybe (nullable)
    - a*: array
    - () : tuple
    - {} : dictionary entry
*)

(** {2 Unsigned Integer Types} *)

type uint32 = Unsigned.UInt32.t
(** Unsigned 32-bit integer *)

type uint64 = Unsigned.UInt64.t
(** Unsigned 64-bit integer *)

type uint16 = Unsigned.UInt16.t
(** Unsigned 16-bit integer *)

type int16 = int
(** Signed 16-bit integer - stored as OCaml int *)

(** {2 Opaque GVariant Type} *)

type t
(** Opaque GVariant type - backed by GVariant* with g_variant_unref finalizer *)

(** {2 Type Introspection} *)

external type_string : t -> string = "ml_g_variant_get_type_string"
(** Get the type string of the variant (e.g., "i" for int32, "s" for string) *)

external is_of_type : t -> string -> bool = "ml_g_variant_is_of_type"
(** Check if the variant is of the given type string *)

(** {2 Boolean} *)

external of_boolean : bool -> t = "ml_g_variant_new_boolean"
external to_boolean : t -> bool = "ml_g_variant_get_boolean"

(** {2 Byte (uint8)} *)

external of_byte : int -> t = "ml_g_variant_new_byte"
external to_byte : t -> int = "ml_g_variant_get_byte"

(** {2 Signed Integers} *)

external of_int16 : int16 -> t = "ml_g_variant_new_int16"
external to_int16 : t -> int16 = "ml_g_variant_get_int16"

external of_int32 : int32 -> t = "ml_g_variant_new_int32"
external to_int32 : t -> int32 = "ml_g_variant_get_int32"

external of_int64 : int64 -> t = "ml_g_variant_new_int64"
external to_int64 : t -> int64 = "ml_g_variant_get_int64"

(** {2 Unsigned Integers} *)

external of_uint16 : uint16 -> t = "ml_g_variant_new_uint16"
external to_uint16 : t -> uint16 = "ml_g_variant_get_uint16"

external of_uint32 : uint32 -> t = "ml_g_variant_new_uint32"
external to_uint32 : t -> uint32 = "ml_g_variant_get_uint32"

external of_uint64 : uint64 -> t = "ml_g_variant_new_uint64"
external to_uint64 : t -> uint64 = "ml_g_variant_get_uint64"

(** {2 Floating Point} *)

external of_double : float -> t = "ml_g_variant_new_double"
external to_double : t -> float = "ml_g_variant_get_double"

(** {2 Text Types} *)

external of_string : string -> t = "ml_g_variant_new_string"
external to_string : t -> string = "ml_g_variant_get_string"

external of_object_path : string -> t = "ml_g_variant_new_object_path"
external to_object_path : t -> string = "ml_g_variant_get_string"
(** D-Bus object path - validated to be a valid object path *)

external of_signature : string -> t = "ml_g_variant_new_signature"
external to_signature : t -> string = "ml_g_variant_get_string"
(** D-Bus type signature *)

(** {2 Handle (File Descriptor)} *)

external of_handle : int -> t = "ml_g_variant_new_handle"
external to_handle : t -> int = "ml_g_variant_get_handle"
(** Unix file descriptor handle *)

(** {2 Variant (Boxed Value)} *)

external of_variant : t -> t = "ml_g_variant_new_variant"
external to_variant : t -> t = "ml_g_variant_get_variant"
(** Create/unwrap a variant inside a variant (type 'v') *)

(** {2 Maybe (Nullable)} *)

external of_maybe : Gvariant_type.t -> t option -> t = "ml_g_variant_new_maybe"
external to_maybe : t -> t option = "ml_g_variant_get_maybe"
(** Nullable/maybe types - wraps a value or represents null *)

(** {2 Arrays} *)

external of_string_array : string array -> t = "ml_g_variant_new_strv"
external to_string_array : t -> string array = "ml_g_variant_get_strv"
(** String arrays (type 'as') *)

external of_object_path_array : string array -> t = "ml_g_variant_new_objv"
external to_object_path_array : t -> string array = "ml_g_variant_get_objv"
(** Object path arrays (type 'ao') *)

(** {2 Dictionary Lookups (a{sv} pattern)} *)

external lookup_string : t -> string -> string option = "ml_g_variant_lookup_string"
(** Lookup a string value in a dictionary (returns None if not found or wrong type) *)

external lookup_int32 : t -> string -> int32 option = "ml_g_variant_lookup_int32"
(** Lookup an int32 value in a dictionary *)

external lookup_boolean : t -> string -> bool option = "ml_g_variant_lookup_boolean"
(** Lookup a boolean value in a dictionary *)

(** {2 Child Access} *)

external n_children : t -> int = "ml_g_variant_n_children"
(** Get the number of children in a tuple, array, or dictionary *)

external get_child_value : t -> int -> t = "ml_g_variant_get_child_value"
(** Get the nth child value. The returned value is a new reference and
    must be unreferenced by the caller (handled by GC). *)

(** {2 Serialization} *)

external print : t -> bool -> string = "ml_g_variant_print"
(** Print the variant in GVariant text format.
    First arg is the variant, second is whether to annotate types. *)

external parse : string -> t = "ml_g_variant_parse"
(** Parse a GVariant from its text format representation.
    Raises Failure on parse error. *)
