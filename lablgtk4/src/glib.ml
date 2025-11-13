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

(* Minimal GLib module for Phase 1.5
 *
 * This provides basic GLib functionality exposed from ml_glib.c.
 * Full GLib module (main loop, I/O, timeouts, etc.) will be added
 * in Phase 2.1.
 *)

(* Application and program name functions *)

external get_prgname : unit -> string option = "ml_g_get_prgname"
(** Get the program name *)

external set_prgname : string -> unit = "ml_g_set_prgname"
(** Set the program name *)

external get_application_name : unit -> string option = "ml_g_get_application_name"
(** Get the application name *)

external set_application_name : string -> unit = "ml_g_set_application_name"
(** Set the application name *)

(* Initialize GLib error handling *)
external glib_init : unit -> unit = "ml_glib_init"

let () = glib_init ()
