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

val type_string : t -> string
(** Get the type string of the variant (e.g., "i" for int32, "s" for string) *)

val is_of_type : t -> string -> bool
(** Check if the variant is of the given type string *)

(** {2 Boolean} *)

val of_boolean : bool -> t
(** Create a boolean variant. *)

val to_boolean : t -> bool
(** Get the boolean value. 
    @raise Failure if the variant is not a boolean. *)

(** {2 Byte (uint8)} *)

val of_byte : int -> t
(** Create a byte variant. *)

val to_byte : t -> int
(** Get the byte value.
    @raise Failure if the variant is not a byte. *)

(** {2 Signed Integers} *)

val of_int16 : int16 -> t
(** Create an int16 variant. *)

val to_int16 : t -> int16
(** Get the int16 value.
    @raise Failure if the variant is not an int16. *)

val of_int32 : int32 -> t
(** Create an int32 variant. *)

val to_int32 : t -> int32
(** Get the int32 value.
    @raise Failure if the variant is not an int32. *)

val of_int64 : int64 -> t
(** Create an int64 variant. *)

val to_int64 : t -> int64
(** Get the int64 value.
    @raise Failure if the variant is not an int64. *)

(** {2 Unsigned Integers} *)

val of_uint16 : uint16 -> t
(** Create a uint16 variant. *)

val to_uint16 : t -> uint16
(** Get the uint16 value.
    @raise Failure if the variant is not a uint16. *)

val of_uint32 : uint32 -> t
(** Create a uint32 variant. *)

val to_uint32 : t -> uint32
(** Get the uint32 value.
    @raise Failure if the variant is not a uint32. *)

val of_uint64 : uint64 -> t
(** Create a uint64 variant. *)

val to_uint64 : t -> uint64
(** Get the uint64 value.
    @raise Failure if the variant is not a uint64. *)

(** {2 Floating Point} *)

val of_double : float -> t
(** Create a double variant. *)

val to_double : t -> float
(** Get the double value.
    @raise Failure if the variant is not a double. *)

(** {2 Text Types} *)

val of_string : string -> t
(** Create a string variant. *)

val to_string : t -> string
(** Get the string value.
    @raise Failure if the variant is not a string. *)

val of_object_path : string -> t
(** D-Bus object path - validated to be a valid object path *)

val of_signature : string -> t
(** D-Bus type signature *)

(** {2 Handle (File Descriptor)} *)

val of_handle : int -> t
(** Create a handle (file descriptor) variant. *)

val to_handle : t -> int
(** Get the handle value.
    @raise Failure if the variant is not a handle. *)

(** {2 Variant (Boxed Value)} *)

val of_variant : t -> t
(** Create a variant containing another variant (type 'v'). *)

val to_variant : t -> t
(** Unwrap a variant inside a variant.
    @raise Failure if the variant is not a variant type. *)

(** {2 Maybe (Nullable)} *)

val of_maybe : Gvariant_type.t -> t option -> t
(** Create a maybe type variant. [of_maybe ty None] creates a null variant,
    [of_maybe ty (Some v)] wraps the value. *)

val to_maybe : t -> t option
(** Unwrap a maybe type variant. Returns [None] for null, [Some v] for wrapped value.
    @raise Failure if the variant is not a maybe type. *)

(** {2 Arrays} *)

val of_string_array : string array -> t
(** Create a string array variant. *)

val to_string_array : t -> string array
(** Get the string array value.
    @raise Failure if the variant is not a string array. *)

val of_object_path_array : string array -> t
(** Create an object path array variant. *)

val to_object_path_array : t -> string array
(** Get the object path array value.
    @raise Failure if the variant is not an object path array. *)

(** {2 Dictionary Lookups (a{sv} pattern)}

    These functions look up values in a{sv} (string->variant) dictionaries.
    They return [None] if the key is not found or if the value is not of the expected type.

    For dictionaries with different value types, use [get_child_value] with the appropriate index.
*)

val lookup_string : t -> string -> string option
(** Lookup a string value in a dictionary. Returns [None] if the key is not found or the value is not a string. *)

val lookup_int32 : t -> string -> int32 option
(** Lookup an int32 value in a dictionary. Returns [None] if the key is not found or the value is not an int32. *)

val lookup_boolean : t -> string -> bool option
(** Lookup a boolean value in a dictionary. Returns [None] if the key is not found or the value is not a boolean. *)

val lookup_byte : t -> string -> int option
(** Lookup a byte (uint8) value in a dictionary. Returns [None] if the key is not found or the value is not a byte. *)

val lookup_int16 : t -> string -> int option
(** Lookup an int16 value in a dictionary. Returns [None] if the key is not found or the value is not an int16. *)

val lookup_uint16 : t -> string -> int option
(** Lookup a uint16 value in a dictionary. Returns [None] if the key is not found or the value is not a uint16. *)

val lookup_uint32 : t -> string -> uint32 option
(** Lookup a uint32 value in a dictionary. Returns [None] if the key is not found or the value is not a uint32. *)

val lookup_int64 : t -> string -> int64 option
(** Lookup an int64 value in a dictionary. Returns [None] if the key is not found or the value is not an int64. *)

val lookup_uint64 : t -> string -> uint64 option
(** Lookup a uint64 value in a dictionary. Returns [None] if the key is not found or the value is not a uint64. *)

val lookup_double : t -> string -> float option
(** Lookup a double value in a dictionary. Returns [None] if the key is not found or the value is not a double. *)

val lookup_object_path : t -> string -> string option
(** Lookup an object path value in a dictionary. Returns [None] if the key is not found or the value is not an object path. *)

val lookup_signature : t -> string -> string option
(** Lookup a signature value in a dictionary. Returns [None] if the key is not found or the value is not a signature. *)

val lookup_handle : t -> string -> int option
(** Lookup a handle (file descriptor) value in a dictionary. Returns [None] if the key is not found or the value is not a handle. *)

(** {2 Child Access} *)

val n_children : t -> int
(** Get the number of children in a tuple, array, or dictionary *)

val get_child_value : t -> int -> t
(** Get the nth child value. The returned value is a new reference and
    must be unreferenced by the caller (handled by GC). *)

(** {2 Serialization} *)

val print : t -> bool -> string
(** Print the variant in GVariant text format.
    First arg is the variant, second is whether to annotate types. *)

val parse : string -> t
(** Parse a GVariant from its text format representation.
    Raises Failure on parse error. *)
