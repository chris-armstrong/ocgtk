(* Signal class defined in ggesture_long_press_signals.ml *)

(* High-level class for GestureLongPress *)
class gesture_long_press (obj : Gesture_long_press.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (Gesture_long_press.as_event_controller obj)
  inherit Ggesture_long_press_signals.gesture_long_press_signals obj

  method get_delay_factor : unit -> float =
    fun () ->
      (Gesture_long_press.get_delay_factor obj)

  method set_delay_factor : float -> unit =
    fun delay_factor ->
      (Gesture_long_press.set_delay_factor obj delay_factor)

  method as_event_controller = (Gesture_long_press.as_event_controller obj)
    method as_gesture_long_press = obj
end

