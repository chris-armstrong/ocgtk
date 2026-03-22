(* Signal class defined in ggesture_long_press_signals.ml *)

class type gesture_long_press_t = object
    inherit GGesture_single.gesture_single_t
    inherit Ggesture_long_press_signals.gesture_long_press_signals
    method get_delay_factor : unit -> float
    method set_delay_factor : float -> unit
    method as_gesture_long_press : Gesture_long_press.t
end

(* High-level class for GestureLongPress *)
class gesture_long_press (obj : Gesture_long_press.t) : gesture_long_press_t = object (self)
  inherit GGesture_single.gesture_single (Obj.magic obj : Gesture_single.t)
  inherit Ggesture_long_press_signals.gesture_long_press_signals obj

  method get_delay_factor : unit -> float =
    fun () ->
      (Gesture_long_press.get_delay_factor obj)

  method set_delay_factor : float -> unit =
    fun delay_factor ->
      (Gesture_long_press.set_delay_factor obj delay_factor)

    method as_gesture_long_press = obj
end

let new_ () : gesture_long_press_t =
  new gesture_long_press (Gesture_long_press.new_ ())

