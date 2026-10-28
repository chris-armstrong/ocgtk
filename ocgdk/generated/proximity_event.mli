(** An event related to the proximity of a tool to a device.

    Its methods, signals and properties are on {!class-type-proximity_event_t}.
    The functions it is built on are in {!Ocgdk.Raw.Proximity_event}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ProximityEvent].}

    An event related to the proximity of a tool to a device. *)
class type proximity_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method as_proximity_event : Raw.Proximity_event.t
end

class proximity_event : Raw.Proximity_event.t -> proximity_event_t
(** Wraps a raw handle of {!Ocgdk.Raw.Proximity_event.t}. *)
