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

(** Initialise GTK and run its main loop without an application object.

    Most programs should use {!Ocgtk.Application} instead. It initialises GTK,
    runs the main loop, quits when its last window closes, and handles
    application IDs and single-instance behaviour. This module is for tests,
    examples and short scripts where that isn't needed.

    {[
    let () =
      let _ = Ocgtk.Main.init () in
      let window = Ocgtk.Window.new_ () in
      ignore
        (window#on_close_request
           ~callback:(fun () ->
             Ocgtk.Main.quit ();
             false)
           ());
      window#present ();
      Ocgtk.Main.main ()
    ]}

    [main] and [quit] run and stop a single GLib main loop that this module
    keeps. [iteration] is the same as [Glib.Main.iteration]. Timeouts, idle
    callbacks and signals run on the same default GLib main context whichever of
    [Ocgtk.Main], [Glib.Main] or [Ocgtk.Application] runs the loop.

    None of these functions release the OCaml runtime lock while waiting for
    events, so other OCaml threads are starved while the loop runs. See the
    threads section of the conventions page. *)

(** {2 Initialization} *)

exception Error of string
(** Raised by {!init} when GTK cannot be initialised, typically because no
    display is available. *)

val init : ?setlocale:bool -> unit -> string array
(** Initialise GTK. Call this before creating any widget.

    Returns [Sys.argv] unchanged. GTK 4 no longer reads or removes command-line
    arguments, so there is nothing to strip.

    @param setlocale Currently ignored.
    @raise Error if GTK cannot be initialised. *)

(** {2 Main Loop} *)

val main : unit -> unit
(** Run the main loop. Blocks until {!quit} is called.

    Unlike [Ocgtk.Application], nothing quits automatically when the last window
    closes. Call {!quit} yourself, for example from a [close-request] handler.
*)

val quit : unit -> unit
(** Stop the loop started by {!main}, which then returns. Typically called from
    a signal handler or other callback. Does nothing if {!main} has never been
    called. *)

val iteration : bool -> bool
(** [iteration may_block] runs one pass of the main loop, dispatching any events
    that are ready. Useful in tests, or to drive the loop yourself.

    @param may_block
      If [true], wait for an event when none is ready. If [false], return
      immediately.
    @return [true] if any events were dispatched. *)
