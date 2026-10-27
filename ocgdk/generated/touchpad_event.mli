(** An event related to a gesture on a touchpad device.

    Unlike touchscreens, where the windowing system sends basic sequences of
    begin, update, end events, and leaves gesture recognition to the clients,
    touchpad gestures are typically processed by the system, resulting in these
    events.

    Its methods, signals and properties are on {!class-type-touchpad_event_t}.
    The functions it is built on are in {!Ocgdk.Raw.Touchpad_event}. *)

(** The methods, signals and properties of a [GdkTouchpadEvent]. *)
class type touchpad_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t

  method get_gesture_phase : unit -> Enums.touchpadgesturephase
  (** Extracts the touchpad gesture phase from a touchpad event. *)

  method get_n_fingers : unit -> int
  (** Extracts the number of fingers from a touchpad event. *)

  method get_pinch_angle_delta : unit -> float
  (** Extracts the angle delta from a touchpad pinch event. *)

  method get_pinch_scale : unit -> float
  (** Extracts the scale from a touchpad pinch event. *)

  method as_touchpad_event : Raw.Touchpad_event.t
end

class touchpad_event : Raw.Touchpad_event.t -> touchpad_event_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Touchpad_event.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GdkTouchpadEvent], give one already wrapped. *)
