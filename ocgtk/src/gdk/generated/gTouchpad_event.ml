class type touchpad_event_t = object
  inherit GApp_launch_context_cycle_de440b34.event_t
  method get_gesture_phase : unit -> Gdk_enums.touchpadgesturephase
  method get_n_fingers : unit -> int
  method get_pinch_angle_delta : unit -> float
  method get_pinch_scale : unit -> float
  method as_touchpad_event : Touchpad_event.t
end

(* High-level class for TouchpadEvent *)
class touchpad_event (obj : Touchpad_event.t) : touchpad_event_t =
  object (self)
    inherit
      GApp_launch_context_cycle_de440b34.event
        (obj :> App_launch_context_cycle_de440b34.Event.t)

    method get_gesture_phase : unit -> Gdk_enums.touchpadgesturephase =
      fun () -> Touchpad_event.get_gesture_phase obj

    method get_n_fingers : unit -> int =
      fun () -> Touchpad_event.get_n_fingers obj

    method get_pinch_angle_delta : unit -> float =
      fun () -> Touchpad_event.get_pinch_angle_delta obj

    method get_pinch_scale : unit -> float =
      fun () -> Touchpad_event.get_pinch_scale obj

    method as_touchpad_event = obj
  end
