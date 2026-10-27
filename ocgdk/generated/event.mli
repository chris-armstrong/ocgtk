(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Event from cyclic group App_launch_context_cycle_de440b34 *)

(** Represents windowing system events.

    In GTK applications the events are handled automatically by toplevel widgets
    and passed on to the event controllers of appropriate widgets, so using
    [GdkEvent] and its related API is rarely needed.

    [GdkEvent] structs are immutable.

    Its methods, signals and properties are on {!class-type-event_t}. The
    functions it is built on are in {!Ocgdk.Raw.Event}. *)

class type event_t = App_launch_context_cycle_de440b34.event_t
(** The methods, signals and properties of a [GdkEvent]. *)

class event : Raw.Event.t -> event_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Event.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkEvent], give one already wrapped. *)
