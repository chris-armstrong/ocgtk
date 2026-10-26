class type touchpad_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_gesture_phase : unit -> Enums.touchpadgesturephase
  method get_n_fingers : unit -> int
  method get_pinch_angle_delta : unit -> float
  method get_pinch_scale : unit -> float
  method as_touchpad_event : Raw.Touchpad_event.t
end

class touchpad_event : Raw.Touchpad_event.t -> touchpad_event_t
