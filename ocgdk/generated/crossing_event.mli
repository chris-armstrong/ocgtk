(** An event caused by a pointing device moving between surfaces.

    Its methods, signals and properties are on {!class-type-crossing_event_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgdk.Raw.Crossing_event}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [CrossingEvent].}

    Inherits from: {{!Ocgdk.Event.class-type-event_t}Ocgdk.Event}

    An event caused by a pointing device moving between surfaces. *)
class type crossing_event_t = object
  inherit Event.event_t

  (** {2:methods Methods} *)

  method get_detail : unit -> Enums.notifytype
  (** Extracts the notify detail from a crossing event. *)

  method get_focus : unit -> bool
  (** Checks if the [event] surface is the focus surface. *)

  method get_mode : unit -> Enums.crossingmode
  (** Extracts the crossing mode from a crossing event. *)

  (** {2:conversions Conversions} *)

  method as_crossing_event : Raw.Crossing_event.t
end

class crossing_event : Raw.Crossing_event.t -> crossing_event_t
(** Wraps a raw handle of {!Ocgdk.Raw.Crossing_event.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
