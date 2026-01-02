class touchpad_event : Touchpad_event.t ->
  object
    method get_gesture_phase : unit -> Gdk_enums.touchpadgesturephase
    method get_n_fingers : unit -> int
    method get_pinch_angle_delta : unit -> float
    method get_pinch_scale : unit -> float
    method as_touchpad_event : Touchpad_event.t
  end

