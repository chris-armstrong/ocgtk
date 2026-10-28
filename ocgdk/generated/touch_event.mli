(** An event related to a touch-based device.

    Its methods, signals and properties are on {!class-type-touch_event_t}. The
    functions it is built on are in {!Ocgdk.Raw.Touch_event}. *)

(** {b The methods, signals and properties of a [TouchEvent].}

    An event related to a touch-based device. *)
class type touch_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t

  method get_emulating_pointer : unit -> bool
  (** Extracts whether a touch event is emulating a pointer event. *)

  method as_touch_event : Raw.Touch_event.t
end

class touch_event : Raw.Touch_event.t -> touch_event_t
(** Wraps a raw handle of {!Ocgdk.Raw.Touch_event.t}. *)
