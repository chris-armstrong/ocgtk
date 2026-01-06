(* High-level class for TouchpadEvent *)
class touchpad_event (obj : Touchpad_event.t) = object (self)

  method get_gesture_phase : unit -> Gdk_enums.touchpadgesturephase =
    fun () ->
      (Touchpad_event.get_gesture_phase obj)

  method get_n_fingers : unit -> int =
    fun () ->
      (Touchpad_event.get_n_fingers obj)

  method get_pinch_angle_delta : unit -> float =
    fun () ->
      (Touchpad_event.get_pinch_angle_delta obj)

  method get_pinch_scale : unit -> float =
    fun () ->
      (Touchpad_event.get_pinch_scale obj)

    method as_touchpad_event = obj
end

