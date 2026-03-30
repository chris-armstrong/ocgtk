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
val to_boolean : t -> bool

(** {2 Byte (uint8)} *)

val of_byte : int -> t
val to_byte : t -> int

(** {2 Signed Integers} *)

val of_int16 : int16 -> t
val to_int16 : t -> int16

val of_int32 : int32 -> t
val to_int32 : t -> int32

val of_int64 : int64 -> t
val to_int64 : t -> int64

(** {2 Unsigned Integers} *)

val of_uint16 : uint16 -> t
val to_uint16 : t -> uint16

val of_uint32 : uint32 -> t
val to_uint32 : t -> uint32

val of_uint64 : uint64 -> t
val to_uint64 : t -> uint64

(** {2 Floating Point} *)

val of_double : float -> t
val to_double : t -> float

(** {2 Text Types} *)

val of_string : string -> t
val to_string : t -> string

val of_object_path : string -> t
(** D-Bus object path - validated to be a valid object path *)

val of_signature : string -> t
(** D-Bus type signature *)

(** {2 Handle (File Descriptor)} *)

val of_handle : int -> t
val to_handle : t -> int
(** Unix file descriptor handle *)

(** {2 Variant (Boxed Value)} *)

val of_variant : t -> t
val to_variant : t -> t
(** Create/unwrap a variant inside a variant (type 'v') *)

(** {2 Maybe (Nullable)} *)

val of_maybe : Gvariant_type.t -> t option -> t
val to_maybe : t -> t option
(** Nullable/maybe types - wraps a value or represents null *)

(** {2 Arrays} *)

val of_string_array : string array -> t
val to_string_array : t -> string array
(** String arrays (type 'as') *)

val of_object_path_array : string array -> t
val to_object_path_array : t -> string array
(** Object path arrays (type 'ao') *)

(** {2 Dictionary Lookups (a{sv} pattern)} *)

val lookup_string : t -> string -> string option
(** Lookup a string value in a dictionary (returns None if not found or wrong type) *)

val lookup_int32 : t -> string -> int32 option
(** Lookup an int32 value in a dictionary *)

val lookup_boolean : t -> string -> bool option
(** Lookup a boolean value in a dictionary *)

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
