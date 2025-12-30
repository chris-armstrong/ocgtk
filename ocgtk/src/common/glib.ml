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

(** Interface to GLib functions (GTK4 / GLib 2.66+)

    Phase 2.1 Implementation - Complete GLib module with:
    - Main event loop
    - Timeout and idle callbacks
    - Character set conversion (UTF-8)
    - String utilities
*)

type unichar = int
type unistring = unichar array

exception GError of string

let () = Callback.register_exception "gerror" (GError "")

(** {2 Main Event Loop} *)

module Main = struct
  type t  (* Abstract type for GMainLoop *)

  external create : bool -> t = "ml_g_main_new"
  external run : t -> unit = "ml_g_main_run"
  external iteration : bool -> bool = "ml_g_main_iteration"
  external pending : unit -> bool = "ml_g_main_pending"
  external is_running : t -> bool = "ml_g_main_is_running"
  external quit : t -> unit = "ml_g_main_quit"
  external destroy : t -> unit = "ml_g_main_destroy"
end

(** Priority levels for timeouts and idle callbacks *)
external int_of_priority :
  [< `HIGH | `DEFAULT | `HIGH_IDLE | `DEFAULT_IDLE | `LOW] -> int
  = "ml_g_int_of_priority"

(** {2 Timeout Callbacks} *)

module Timeout = struct
  type id = int

  external add_full : int option -> int -> (unit -> bool) -> id
    = "ml_g_timeout_add"

  let add ?prio ~ms ~callback () =
    let prio_opt = match prio with Some p -> Some p | None -> None in
    add_full prio_opt ms callback

  external remove : id -> unit = "ml_g_timeout_remove"
end

(** {2 Idle Callbacks} *)

module Idle = struct
  type id = int

  external add_full : int option -> (unit -> bool) -> id
    = "ml_g_idle_add"

  let add ?prio callback =
    let prio_opt = match prio with Some p -> Some p | None -> None in
    add_full prio_opt callback

  external remove : id -> unit = "ml_g_idle_remove"
end

(** {2 Character Set Conversion} *)

module Convert = struct
  type error =
    | NO_CONVERSION
    | ILLEGAL_SEQUENCE
    | FAILED
    | PARTIAL_INPUT
    | BAD_URI
    | NOT_ABSOLUTE_PATH

  exception Error of error * string

  let () = Callback.register_exception "glib_convert_error"
      (Error (FAILED, ""))

  external convert :
    string -> to_codeset:string -> from_codeset:string -> string
    = "ml_g_convert"

  external locale_to_utf8 : string -> string = "ml_g_locale_to_utf8"
  external locale_from_utf8 : string -> string = "ml_g_locale_from_utf8"
  external filename_to_utf8 : string -> string = "ml_g_filename_to_utf8"
  external filename_from_utf8 : string -> string = "ml_g_filename_from_utf8"
  external get_charset : unit -> bool * string = "ml_g_get_charset"
end

(** {2 UTF-8 String Utilities} *)

module Utf8 = struct
  external validate : string -> bool = "ml_g_utf8_validate"
end

(** {2 Application and Program Names} *)

external get_prgname : unit -> string option = "ml_g_get_prgname"
external set_prgname : string -> unit = "ml_g_set_prgname"
external get_application_name : unit -> string option
  = "ml_g_get_application_name"
external set_application_name : string -> unit
  = "ml_g_set_application_name"

(* Initialize GLib error handling *)
external glib_init : unit -> unit = "ml_glib_init"

let () = glib_init ()
