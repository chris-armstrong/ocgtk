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
(** Create a boolean variant. *)

external to_boolean : t -> bool = "ml_g_variant_get_boolean"
(** Get the boolean value. Raises Failure if the variant is not a boolean. *)

(** {2 Byte (uint8)} *)

external of_byte : int -> t = "ml_g_variant_new_byte"
(** Create a byte variant. *)

external to_byte : t -> int = "ml_g_variant_get_byte"
(** Get the byte value. Raises Failure if the variant is not a byte. *)

(** {2 Signed Integers} *)

external of_int16 : int16 -> t = "ml_g_variant_new_int16"
(** Create an int16 variant. *)

external to_int16 : t -> int16 = "ml_g_variant_get_int16"
(** Get the int16 value. Raises Failure if the variant is not an int16. *)

external of_int32 : int32 -> t = "ml_g_variant_new_int32"
(** Create an int32 variant. *)

external to_int32 : t -> int32 = "ml_g_variant_get_int32"
(** Get the int32 value. Raises Failure if the variant is not an int32. *)

external of_int64 : int64 -> t = "ml_g_variant_new_int64"
(** Create an int64 variant. *)

external to_int64 : t -> int64 = "ml_g_variant_get_int64"
(** Get the int64 value. Raises Failure if the variant is not an int64. *)

(** {2 Unsigned Integers} *)

external of_uint16 : uint16 -> t = "ml_g_variant_new_uint16"
(** Create a uint16 variant. *)

external to_uint16 : t -> uint16 = "ml_g_variant_get_uint16"
(** Get the uint16 value. Raises Failure if the variant is not a uint16. *)

external of_uint32 : uint32 -> t = "ml_g_variant_new_uint32"
(** Create a uint32 variant. *)

external to_uint32 : t -> uint32 = "ml_g_variant_get_uint32"
(** Get the uint32 value. Raises Failure if the variant is not a uint32. *)

external of_uint64 : uint64 -> t = "ml_g_variant_new_uint64"
(** Create a uint64 variant. *)

external to_uint64 : t -> uint64 = "ml_g_variant_get_uint64"
(** Get the uint64 value. Raises Failure if the variant is not a uint64. *)

(** {2 Floating Point} *)

external of_double : float -> t = "ml_g_variant_new_double"
(** Create a double variant. *)

external to_double : t -> float = "ml_g_variant_get_double"
(** Get the double value. Raises Failure if the variant is not a double. *)

(** {2 Text Types} *)

external of_string : string -> t = "ml_g_variant_new_string"
(** Create a string variant. *)

external to_string : t -> string = "ml_g_variant_get_string"
(** Get the string value. Raises Failure if the variant is not a string. *)

external of_object_path : string -> t = "ml_g_variant_new_object_path"
(** D-Bus object path - validated to be a valid object path; use to_string to
    read back *)

external of_signature : string -> t = "ml_g_variant_new_signature"
(** D-Bus type signature; use to_string to read back *)

(** {2 Handle (File Descriptor)} *)

external of_handle : int -> t = "ml_g_variant_new_handle"
(** Create a handle (file descriptor) variant. *)

external to_handle : t -> int = "ml_g_variant_get_handle"
(** Get the handle value. Raises Failure if the variant is not a handle. *)

(** {2 Variant (Boxed Value)} *)

external of_variant : t -> t = "ml_g_variant_new_variant"
(** Create a variant containing another variant (type 'v'). *)

external to_variant : t -> t = "ml_g_variant_get_variant"
(** Unwrap a variant inside a variant. Raises Failure if the variant is not a
    variant type. *)

(** {2 Maybe (Nullable)} *)

external of_maybe : Gvariant_type.t -> t option -> t = "ml_g_variant_new_maybe"
(** Create a maybe type variant. [of_maybe ty None] creates a null variant,
    [of_maybe ty (Some v)] wraps the value. *)

external to_maybe : t -> t option = "ml_g_variant_get_maybe"
(** Unwrap a maybe type variant. Returns [None] for null, [Some v] for wrapped
    value. Raises Failure if the variant is not a maybe type. *)

(** {2 Arrays} *)

external of_string_array : string array -> t = "ml_g_variant_new_strv"
(** Create a string array variant. *)

external to_string_array : t -> string array = "ml_g_variant_get_strv"
(** Get the string array value. Raises Failure if the variant is not a string
    array. *)

external of_object_path_array : string array -> t = "ml_g_variant_new_objv"
(** Create an object path array variant. *)

external to_object_path_array : t -> string array = "ml_g_variant_get_objv"
(** Get the object path array value. Raises Failure if the variant is not an
    object path array. *)

(** {2 Dictionary Lookups (a{sv} pattern)}

    These functions look up values in a{sv} (string->variant) dictionaries.
    They return [None] if the key is not found or if the value is not of the expected type.

    For dictionaries with different value types, use [get_child_value] with the appropriate index.
*)

external lookup_string : t -> string -> string option
  = "ml_g_variant_lookup_string"
(** Lookup a string value in a dictionary. Returns [None] if the key is not
    found or the value is not a string. *)

external lookup_int32 : t -> string -> int32 option
  = "ml_g_variant_lookup_int32"
(** Lookup an int32 value in a dictionary. Returns [None] if the key is not
    found or the value is not an int32. *)

external lookup_boolean : t -> string -> bool option
  = "ml_g_variant_lookup_boolean"
(** Lookup a boolean value in a dictionary. Returns [None] if the key is not
    found or the value is not a boolean. *)

external lookup_byte : t -> string -> int option = "ml_g_variant_lookup_byte"
(** Lookup a byte (uint8) value in a dictionary. Returns [None] if the key is
    not found or the value is not a byte. *)

external lookup_int16 : t -> string -> int option = "ml_g_variant_lookup_int16"
(** Lookup an int16 value in a dictionary. Returns [None] if the key is not
    found or the value is not an int16. *)

external lookup_uint16 : t -> string -> int option
  = "ml_g_variant_lookup_uint16"
(** Lookup a uint16 value in a dictionary. Returns [None] if the key is not
    found or the value is not a uint16. *)

external lookup_uint32 : t -> string -> uint32 option
  = "ml_g_variant_lookup_uint32"
(** Lookup a uint32 value in a dictionary. Returns [None] if the key is not
    found or the value is not a uint32. *)

external lookup_int64 : t -> string -> int64 option
  = "ml_g_variant_lookup_int64"
(** Lookup an int64 value in a dictionary. Returns [None] if the key is not
    found or the value is not an int64. *)

external lookup_uint64 : t -> string -> uint64 option
  = "ml_g_variant_lookup_uint64"
(** Lookup a uint64 value in a dictionary. Returns [None] if the key is not
    found or the value is not a uint64. *)

external lookup_double : t -> string -> float option
  = "ml_g_variant_lookup_double"
(** Lookup a double value in a dictionary. Returns [None] if the key is not
    found or the value is not a double. *)

external lookup_object_path : t -> string -> string option
  = "ml_g_variant_lookup_object_path"
(** Lookup an object path value in a dictionary. Returns [None] if the key is
    not found or the value is not an object path. *)

external lookup_signature : t -> string -> string option
  = "ml_g_variant_lookup_signature"
(** Lookup a signature value in a dictionary. Returns [None] if the key is not
    found or the value is not a signature. *)

external lookup_handle : t -> string -> int option
  = "ml_g_variant_lookup_handle"
(** Lookup a handle (file descriptor) value in a dictionary. Returns [None] if
    the key is not found or the value is not a handle. *)

(** {2 Child Access} *)

external n_children : t -> int = "ml_g_variant_n_children"
(** Get the number of children in a tuple, array, or dictionary *)

external get_child_value : t -> int -> t = "ml_g_variant_get_child_value"
(** Get the nth child value. The returned value is a new reference and must be
    unreferenced by the caller (handled by GC). *)

(** {2 Serialization} *)

external print : t -> bool -> string = "ml_g_variant_print"
(** Print the variant in GVariant text format. First arg is the variant, second
    is whether to annotate types. *)

external parse : string -> t = "ml_g_variant_parse"
(** Parse a GVariant from its text format representation. Raises Failure on
    parse error. *)
