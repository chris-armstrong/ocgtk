(** An event caused by a pointing device moving between surfaces.

    Its methods, signals and properties are on {!class-type-crossing_event_t}.
    The functions it is built on are in {!Ocgdk.Raw.Crossing_event}. *)

(** {b The methods, signals and properties of a [CrossingEvent].}

    An event caused by a pointing device moving between surfaces. *)
class type crossing_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t

  method get_detail : unit -> Enums.notifytype
  (** Extracts the notify detail from a crossing event. *)

  method get_focus : unit -> bool
  (** Checks if the [event] surface is the focus surface. *)

  method get_mode : unit -> Enums.crossingmode
  (** Extracts the crossing mode from a crossing event. *)

  method as_crossing_event : Raw.Crossing_event.t
end

class crossing_event : Raw.Crossing_event.t -> crossing_event_t
(** Wraps a raw handle of {!Ocgdk.Raw.Crossing_event.t}. *)
