(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Display from cyclic group App_launch_context_cycle_de440b34 *)

(** A representation of a workstation.

    Their purpose are two-fold:

    - To manage and provide information about input devices (pointers,
      keyboards, etc)
    - To manage and provide information about output devices (monitors,
      projectors, etc)

    Most of the input device handling has been factored out into separate
    [Gdk.Seat] objects. Every display has a one or more seats, which can be
    accessed with [Gdk.Display.get_default_seat] and [Gdk.Display.list_seats].

    Output devices are represented by [Gdk.Monitor] objects, which can be
    accessed with [Gdk.Display.get_monitor_at_surface] and similar APIs.

    Its methods, signals and properties are on {!class-type-display_t}. The
    functions it is built on are in {!Ocgdk.Raw.Display}. *)

class type display_t = App_launch_context_cycle_de440b34.display_t
(** The methods, signals and properties of a [Display]. *)

class display : Raw.Display.t -> display_t
(** Wraps a raw handle of {!Ocgdk.Raw.Display.t}. *)
