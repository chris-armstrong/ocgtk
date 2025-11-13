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

(** GObject type system and object model for GTK4 *)

(** {2 Core Types} *)

type +'a obj
(** Type for GObject instances. The type parameter provides type safety. *)

type g_type = int
(** GType identifier *)

type g_value
(** GValue container for generic values *)

type g_closure
(** GClosure for signal callbacks *)

(** {2 Fundamental Types} *)

type fundamental_type =
  [ `INVALID | `NONE | `INTERFACE | `CHAR | `UCHAR | `BOOLEAN | `INT
  | `UINT | `LONG | `ULONG | `INT64 | `UINT64 | `ENUM | `FLAGS
  | `FLOAT | `DOUBLE | `STRING | `POINTER | `BOXED | `PARAM | `OBJECT ]
(** Fundamental GType categories *)

type signal_type =
  [ `RUN_FIRST | `RUN_LAST | `NO_RECURSE | `ACTION | `NO_HOOKS ]
(** Signal emission phases *)

(** {2 Object Operations} *)

val get_type : 'a obj -> g_type
(** Get the GType of an object *)

val is_a : 'a obj -> string -> bool
(** Check if object is of a given type (by name) *)

external unsafe_cast : 'a obj -> 'b obj = "%identity"
(** Unsafe cast between object types *)

external coerce : 'a obj -> unit obj = "%identity"
(** Safe coercion to generic object *)

val get_ref_count : 'a obj -> int
(** Get reference count (for debugging) *)

(** {2 Type System} *)

module Type : sig
  type t = g_type

  val name : t -> string
  (** Get type name *)

  val from_name : string -> t
  (** Get type from name *)

  val parent : t -> t
  (** Get parent type *)

  val is_a : t -> t -> bool
  (** Check type hierarchy *)

  val fundamental : t -> fundamental_type
  (** Get fundamental type category *)

  val of_fundamental : fundamental_type -> t
  (** Get GType for fundamental type *)
end

(** {2 GValue Operations} *)

module Value : sig
  type t = g_value

  val create : g_type -> t
  (** Create and initialize a GValue with the given type *)

  val create_empty : unit -> t
  (** Create an uninitialized GValue *)

  val init : t -> g_type -> unit
  (** Initialize a GValue with a type *)

  val reset : t -> unit
  (** Reset a GValue (clear and reinitialize) *)

  val get_type : t -> g_type
  (** Get the type of a GValue *)

  (** {3 Type-specific getters/setters} *)

  val get_int : t -> int
  val set_int : t -> int -> unit

  val get_boolean : t -> bool
  val set_boolean : t -> bool -> unit

  val get_string : t -> string
  val set_string : t -> string -> unit

  val get_float : t -> float
  val set_float : t -> float -> unit

  val get_double : t -> float
  val set_double : t -> float -> unit

  val get_object : t -> 'a obj option
  val set_object : t -> 'a obj option -> unit
end

(** {2 Properties} *)

module Property : sig
  val get_value : 'a obj -> name:string -> g_value -> unit
  (** Get property value into a GValue *)

  val set_value : 'a obj -> name:string -> g_value -> unit
  (** Set property from a GValue *)

  val get_type : 'a obj -> name:string -> g_type
  (** Get the type of a property *)

  val freeze_notify : 'a obj -> unit
  (** Freeze property change notifications *)

  val thaw_notify : 'a obj -> unit
  (** Thaw property change notifications *)

  val notify : 'a obj -> name:string -> unit
  (** Emit property change notification *)
end

(** {2 Closures} *)

module Closure : sig
  type t = g_closure

  type args
  (** Opaque type for closure arguments *)

  type argv = {
    result : g_value;
    nargs : int;
    args : args;
  }
  (** Closure invocation context *)

  val create : (argv -> unit) -> t
  (** Create a closure from an OCaml callback *)

  val nth : argv -> pos:int -> g_value
  (** Get the nth argument *)

  val result : argv -> g_value
  (** Get the result GValue *)

  val get_result_type : argv -> g_type
  (** Get the expected result type *)

  val get_type : argv -> pos:int -> g_type
  (** Get the type of an argument *)

  val set_result : argv -> g_value -> unit
  (** Set the result value *)
end

(** {2 Signals} *)

module Signal : sig
  type handler_id = int
  (** Signal handler identifier *)

  val connect : 'a obj -> name:string -> callback:g_closure -> after:bool -> handler_id
  (** Connect a closure to a signal *)

  val connect_simple : 'a obj -> name:string -> callback:(unit -> unit) -> after:bool -> handler_id
  (** Connect a simple callback with no arguments *)

  val disconnect : 'a obj -> handler_id -> unit
  (** Disconnect a signal handler *)

  val handler_block : 'a obj -> handler_id -> unit
  (** Temporarily block a signal handler *)

  val handler_unblock : 'a obj -> handler_id -> unit
  (** Unblock a signal handler *)

  val handler_is_connected : 'a obj -> handler_id -> bool
  (** Check if a handler is connected *)

  val emit_by_name : 'a obj -> name:string -> unit
  (** Emit a signal by name *)
end

(** {2 Data Conversions} *)

module Data : sig
  (** Enum and flags conversion *)

  val enum : ([>  ] as 'a) Gpointer.variant_table -> ('a -> int) * (int -> 'a)
  (** Create encoder/decoder pair for enum types *)

  val flags : ([>  ] as 'a) Gpointer.variant_table -> ('a -> int) * (int -> 'a)
  (** Create encoder/decoder pair for flags types *)
end
