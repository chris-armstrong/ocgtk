(** An event related to a gesture on a touchpad device.

    Its methods, signals and properties are on {!class-type-touchpad_event_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Touchpad_event}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TouchpadEvent].}

    Inherits from: {{!Ocgdk.Event.class-type-event_t}Ocgdk.Event}

    An event related to a gesture on a touchpad device.

    Unlike touchscreens, where the windowing system sends basic sequences of
    begin, update, end events, and leaves gesture recognition to the clients,
    touchpad gestures are typically processed by the system, resulting in these
    events. *)
class type touchpad_event_t = object
  inherit Event.event_t

  (** {2:methods Methods} *)

  method get_gesture_phase : unit -> Enums.touchpadgesturephase
  (** Extracts the touchpad gesture phase from a touchpad event. *)

  method get_n_fingers : unit -> int
  (** Extracts the number of fingers from a touchpad event. *)

  method get_pinch_angle_delta : unit -> float
  (** Extracts the angle delta from a touchpad pinch event. *)

  method get_pinch_scale : unit -> float
  (** Extracts the scale from a touchpad pinch event. *)

  (** {2:conversions Conversions} *)

  method as_touchpad_event : Raw.Touchpad_event.t
end

class touchpad_event : Raw.Touchpad_event.t -> touchpad_event_t
(** Wraps a raw handle of {!Ocgdk.Raw.Touchpad_event.t}. *)

(** {1:description Description}

    An event related to a gesture on a touchpad device.

    Unlike touchscreens, where the windowing system sends basic sequences of
    begin, update, end events, and leaves gesture recognition to the clients,
    touchpad gestures are typically processed by the system, resulting in these
    events. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
