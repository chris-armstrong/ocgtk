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

(* High-level class for TouchpadEvent *)
class touchpad_event (obj : Raw.Touchpad_event.t) : touchpad_event_t =
  object (self)
    inherit Event.event (obj :> Raw.Event.t)

    method get_gesture_phase : unit -> Enums.touchpadgesturephase =
      fun () -> Raw.Touchpad_event.get_gesture_phase obj

    method get_n_fingers : unit -> int =
      fun () -> Raw.Touchpad_event.get_n_fingers obj

    method get_pinch_angle_delta : unit -> float =
      fun () -> Raw.Touchpad_event.get_pinch_angle_delta obj

    method get_pinch_scale : unit -> float =
      fun () -> Raw.Touchpad_event.get_pinch_scale obj

    method as_touchpad_event = obj
  end
