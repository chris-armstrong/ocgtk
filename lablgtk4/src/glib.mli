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

(** Minimal GLib module for Phase 1.5

    This provides basic GLib functionality. Full GLib module
    (main loop, I/O channels, timeouts, idle callbacks, UTF-8
    conversion, etc.) will be added in Phase 2.1.
*)

(** {2 Application and Program Names} *)

val get_prgname : unit -> string option
(** Get the name of the program. This is the name used to invoke the program,
    typically argv[0]. Returns [None] if the program name has not been set. *)

val set_prgname : string -> unit
(** Set the name of the program. This name should not be localized,
    in contrast to {!set_application_name}. *)

val get_application_name : unit -> string option
(** Get the human-readable application name. This is the name that should be
    displayed in the UI. Returns [None] if the application name has not been set.

    If you haven't called {!set_application_name}, this may return the program
    name (from {!get_prgname}). *)

val set_application_name : string -> unit
(** Set a human-readable name for the application. This name should be
    localized if possible and is intended for display to the user. *)
