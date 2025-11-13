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

(** GObject module for GTK4 type system, properties, and signals *)

(** {2 Core Types} *)

type +'a obj
(** GObject instance - abstract pointer type *)

type g_type = int
(** GType identifier *)

type g_value
(** Abstract type for GValue *)

type g_closure
(** Abstract type for GClosure *)

type fundamental_type =
  [ `INVALID | `NONE | `INTERFACE | `CHAR | `UCHAR | `BOOLEAN | `INT
  | `UINT | `LONG | `ULONG | `INT64 | `UINT64 | `ENUM | `FLAGS
  | `FLOAT | `DOUBLE | `STRING | `POINTER | `BOXED | `PARAM | `OBJECT ]

type signal_type =
  [ `RUN_FIRST | `RUN_LAST | `NO_RECURSE | `ACTION | `NO_HOOKS ]

(** {2 Object Operations} *)

external get_type : 'a obj -> g_type = "ml_g_object_get_type"
external unsafe_cast : 'a obj -> 'b obj = "%identity"
external coerce : 'a obj -> unit obj = "%identity"
external get_ref_count : 'a obj -> int = "ml_g_object_get_ref_count"

(** {2 Type System} *)

module Type = struct
  type t = g_type

  external name : t -> string = "ml_g_type_name"
  external from_name : string -> t = "ml_g_type_from_name"
  external parent : t -> t = "ml_g_type_parent"
  external is_a : t -> t -> bool = "ml_g_type_is_a"
  external fundamental : t -> int = "ml_g_type_fundamental"
  external of_fundamental : int -> t = "ml_g_type_of_fundamental"

  let fundamental t =
    match fundamental t with
    | 0 -> `INVALID
    | 1 -> `NONE
    | 2 -> `INTERFACE
    | 3 -> `CHAR
    | 4 -> `UCHAR
    | 5 -> `BOOLEAN
    | 6 -> `INT
    | 7 -> `UINT
    | 8 -> `LONG
    | 9 -> `ULONG
    | 10 -> `INT64
    | 11 -> `UINT64
    | 12 -> `ENUM
    | 13 -> `FLAGS
    | 14 -> `FLOAT
    | 15 -> `DOUBLE
    | 16 -> `STRING
    | 17 -> `POINTER
    | 18 -> `BOXED
    | 19 -> `PARAM
    | 20 -> `OBJECT
    | _ -> `INVALID

  let of_fundamental = function
    | `INVALID -> of_fundamental 0
    | `NONE -> of_fundamental 1
    | `INTERFACE -> of_fundamental 2
    | `CHAR -> of_fundamental 3
    | `UCHAR -> of_fundamental 4
    | `BOOLEAN -> of_fundamental 5
    | `INT -> of_fundamental 6
    | `UINT -> of_fundamental 7
    | `LONG -> of_fundamental 8
    | `ULONG -> of_fundamental 9
    | `INT64 -> of_fundamental 10
    | `UINT64 -> of_fundamental 11
    | `ENUM -> of_fundamental 12
    | `FLAGS -> of_fundamental 13
    | `FLOAT -> of_fundamental 14
    | `DOUBLE -> of_fundamental 15
    | `STRING -> of_fundamental 16
    | `POINTER -> of_fundamental 17
    | `BOXED -> of_fundamental 18
    | `PARAM -> of_fundamental 19
    | `OBJECT -> of_fundamental 20
end

let is_a obj type_name =
  try
    let obj_type = get_type obj in
    let check_type = Type.from_name type_name in
    Type.is_a obj_type check_type
  with _ -> false

(** {2 GValue Operations} *)

module Value = struct
  type t = g_value

  external create_empty : unit -> t = "ml_g_value_new"
  external init : t -> g_type -> unit = "ml_g_value_init_gtype"
  external reset : t -> unit = "ml_g_value_reset"
  external get_type : t -> g_type = "ml_g_value_get_gtype"

  let create gtype =
    let v = create_empty () in
    init v gtype;
    v

  external get_int : t -> int = "ml_g_value_get_int"
  external set_int : t -> int -> unit = "ml_g_value_set_int"

  external get_boolean : t -> bool = "ml_g_value_get_boolean"
  external set_boolean : t -> bool -> unit = "ml_g_value_set_boolean"

  external get_string : t -> string = "ml_g_value_get_string"
  external set_string : t -> string -> unit = "ml_g_value_set_string"

  external get_float : t -> float = "ml_g_value_get_float"
  external set_float : t -> float -> unit = "ml_g_value_set_float"

  external get_double : t -> float = "ml_g_value_get_double"
  external set_double : t -> float -> unit = "ml_g_value_set_double"

  external get_object_internal : t -> 'a obj = "ml_g_value_get_object"
  external set_object_internal : t -> 'a obj -> unit = "ml_g_value_set_object"

  let get_object v =
    try Some (get_object_internal v)
    with _ -> None

  let set_object v = function
    | Some obj -> set_object_internal v obj
    | None -> () (* Set NULL *)
end

(** {2 Properties} *)

module Property = struct
  external get_value : 'a obj -> name:string -> g_value -> unit = "ml_g_object_get_property"
  external set_value : 'a obj -> name:string -> g_value -> unit = "ml_g_object_set_property"
  external get_type : 'a obj -> name:string -> g_type = "ml_g_object_get_property_type"

  external freeze_notify : 'a obj -> unit = "ml_g_object_freeze_notify"
  external thaw_notify : 'a obj -> unit = "ml_g_object_thaw_notify"
  external notify : 'a obj -> name:string -> unit = "ml_g_object_notify"
end

(** {2 Closures} *)

module Closure = struct
  type t = g_closure

  type args
  type argv = {
    result : g_value;
    nargs : int;
    args : args;
  }

  external create : (argv -> unit) -> t = "ml_g_closure_new"
  external nth : argv -> pos:int -> g_value = "ml_g_closure_get_arg"
  external result : argv -> g_value = "ml_g_closure_get_result"
  external get_result_type : argv -> g_type = "ml_g_closure_get_result_type"
  external get_type : argv -> pos:int -> g_type = "ml_g_closure_get_arg_type"
  external set_result : argv -> g_value -> unit = "ml_g_closure_set_result"
end

(** {2 Signals} *)

module Signal = struct
  type handler_id = int

  external connect : 'a obj -> name:string -> callback:g_closure -> after:bool -> handler_id
    = "ml_g_signal_connect_closure"

  let connect_simple obj ~name ~callback ~after =
    let closure = Closure.create (fun _argv -> callback ()) in
    connect obj ~name ~callback:closure ~after

  external disconnect : 'a obj -> handler_id -> unit = "ml_g_signal_handler_disconnect"
  external handler_block : 'a obj -> handler_id -> unit = "ml_g_signal_handler_block"
  external handler_unblock : 'a obj -> handler_id -> unit = "ml_g_signal_handler_unblock"
  external handler_is_connected : 'a obj -> handler_id -> bool = "ml_g_signal_handler_is_connected"
  external emit_by_name : 'a obj -> name:string -> unit = "ml_g_signal_emit_by_name"
end

(** {2 Data Conversions} *)

module Data = struct
  (* enum: creates encoder/decoder pair for simple enumerations *)
  let enum tbl =
    (Gpointer.encode_variant tbl, Gpointer.decode_variant tbl)

  (* flags: creates encoder/decoder pair for flag-type enumerations *)
  let flags tbl =
    let decode flags =
      (* For now, decode as single value - full implementation would decode bits *)
      Gpointer.decode_variant tbl flags
    in
    let encode flag =
      (* For now, encode as single value - full implementation would combine bits *)
      Gpointer.encode_variant tbl flag
    in
    (encode, decode)
end
