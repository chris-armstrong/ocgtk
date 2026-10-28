(** An event related to a touch-based device.

    Its methods, signals and properties are on {!class-type-touch_event_t}. The
    functions it is built on are in {!Ocgdk.Raw.Touch_event}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TouchEvent].}

    Inherits from: {{!Ocgdk.Event.class-type-event_t}Ocgdk.Event}

    An event related to a touch-based device. *)
class type touch_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t

  (** {2:methods Methods} *)

  method get_emulating_pointer : unit -> bool
  (** Extracts whether a touch event is emulating a pointer event. *)

  (** {2:conversions Conversions} *)

  method as_touch_event : Raw.Touch_event.t
end

class touch_event : Raw.Touch_event.t -> touch_event_t
(** Wraps a raw handle of {!Ocgdk.Raw.Touch_event.t}. *)
