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

(** Main event loop and initialization for GTK4 *)

(** {2 Initialization} *)

exception Error of string

(** Initialize GTK.

    This must be called before using any GTK functions.
    Returns the remaining command-line arguments after GTK processes its options.

    @param argv Command-line arguments (typically Sys.argv)
    @raise Error if initialization fails

    Example:
    {[
      let () =
        let _ = GMain.init () in
        (* ... create widgets ... *)
        GMain.main ()
    ]}
*)
val init : ?setlocale:bool -> unit -> string array

(** {2 Main Loop} *)

(** Start the GTK main event loop.
    This function blocks until {!quit} is called. *)
val main : unit -> unit

(** Exit the main event loop.
    Typically called from a signal handler or callback. *)
val quit : unit -> unit

(** Run one iteration of the main loop.
    @param block If true, wait for events; if false, return immediately if no events
    @return true if more events are pending *)
val iteration : bool -> bool

(** {2 Deprecated - Use GtkApplication Instead}

    Note: For new GTK4 applications, GtkApplication is preferred over
    the main loop functions. However, these are provided for:
    - Testing during development
    - Simple examples
    - Migration from GTK3

    Full GtkApplication support will be added in Phase 6.2.
*)
