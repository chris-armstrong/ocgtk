class type touchpad_event_t = object
    inherit GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.event_t
    method get_gesture_phase : unit -> Gdk_enums.touchpadgesturephase
    method get_n_fingers : unit -> int
    method get_pinch_angle_delta : unit -> float
    method get_pinch_scale : unit -> float
    method as_touchpad_event : Touchpad_event.t
end

(* High-level class for TouchpadEvent *)
class touchpad_event (obj : Touchpad_event.t) : touchpad_event_t = object (self)
  inherit GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.event (obj :> App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Event.t)

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

