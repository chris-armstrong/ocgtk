(* Signal class defined in ggesture_long_press_signals.ml *)

(* High-level class for GestureLongPress *)
class gesture_long_press (obj : Gesture_long_press.t) = object (self)
  inherit Ggesture_long_press_signals.gesture_long_press_signals obj

  method get_delay_factor : unit -> float =
    fun () ->
      (Gesture_long_press.get_delay_factor obj)

  method set_delay_factor : float -> unit =
    fun delay_factor ->
      (Gesture_long_press.set_delay_factor obj delay_factor)

    method as_gesture_long_press = obj
end

