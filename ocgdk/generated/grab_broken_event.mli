(** An event related to a broken windowing system grab.

    Its methods, signals and properties are on
    {!class-type-grab_broken_event_t}. The functions it is built on are in
    {!Ocgdk.Raw.Grab_broken_event}. *)

(** {b The methods, signals and properties of a [GrabBrokenEvent].}

    An event related to a broken windowing system grab. *)
class type grab_broken_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t

  method get_grab_surface : unit -> App_launch_context_cycle_de440b34.surface_t
  (** Extracts the grab surface from a grab broken event. *)

  method get_implicit : unit -> bool
  (** Checks whether the grab broken event is for an implicit grab. *)

  method as_grab_broken_event : Raw.Grab_broken_event.t
end

class grab_broken_event : Raw.Grab_broken_event.t -> grab_broken_event_t
(** Wraps a raw handle of {!Ocgdk.Raw.Grab_broken_event.t}. *)
