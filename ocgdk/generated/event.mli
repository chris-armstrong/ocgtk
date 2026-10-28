(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Event from cyclic group App_launch_context_cycle_de440b34 *)

(** Represents windowing system events.

    Its methods, signals and properties are on {!class-type-event_t}. Its full
    description is under {!section-description}. The functions it is built on
    are in {!Ocgdk.Raw.Event}. *)

(** {1:class Class} *)

class type event_t = App_launch_context_cycle_de440b34.event_t
(** {b The methods, signals and properties of a [Event].}

    Represents windowing system events.

    In GTK applications the events are handled automatically by toplevel widgets
    and passed on to the event controllers of appropriate widgets, so using
    [GdkEvent] and its related API is rarely needed.

    [GdkEvent] structs are immutable. *)

class event : Raw.Event.t -> event_t
(** Wraps a raw handle of {!Ocgdk.Raw.Event.t}. *)

(** {1:description Description}

    Represents windowing system events.

    In GTK applications the events are handled automatically by toplevel widgets
    and passed on to the event controllers of appropriate widgets, so using
    [GdkEvent] and its related API is rarely needed.

    [GdkEvent] structs are immutable. *)
