(* GENERATED CODE - DO NOT EDIT *)
(* Display, a member of the cyclic module App_launch_context_cycle_de440b34 *)

(** A representation of a workstation.

    Their purpose are two-fold:

    - To manage and provide information about input devices (pointers,
      keyboards, etc)
    - To manage and provide information about output devices (monitors,
      projectors, etc)

    Most of the input device handling has been factored out into separate
    {{!Ocgdk.Raw.Seat}[Gdk.Seat]} objects. Every display has a one or more
    seats, which can be accessed with [Gdk.Display.get_default_seat] and
    [Gdk.Display.list_seats].

    Output devices are represented by {{!Ocgdk.Raw.Monitor}[Gdk.Monitor]}
    objects, which can be accessed with [Gdk.Display.get_monitor_at_surface] and
    similar APIs.

    The class built on this module is in {!Ocgdk.Display}. *)

include module type of struct
  include App_launch_context_cycle_de440b34.Display
end
