(** An event related to the proximity of a tool to a device.

    Its methods, signals and properties are on {!class-type-proximity_event_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgdk.Raw.Proximity_event}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ProximityEvent].}

    Inherits from: {{!Ocgdk.Event.class-type-event_t}Ocgdk.Event}

    An event related to the proximity of a tool to a device. *)
class type proximity_event_t = object
  inherit Event.event_t

  (** {2:conversions Conversions} *)

  method as_proximity_event : Raw.Proximity_event.t
end

class proximity_event : Raw.Proximity_event.t -> proximity_event_t
(** Wraps a raw handle of {!Ocgdk.Raw.Proximity_event.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
