(* Signal class defined in ggesture_rotate_signals.ml *)

class type gesture_rotate_t = object
    inherit GGesture.gesture_t
    inherit Ggesture_rotate_signals.gesture_rotate_signals
    method get_angle_delta : unit -> float
    method as_gesture_rotate : Gesture_rotate.t
end

(* High-level class for GestureRotate *)
class gesture_rotate (obj : Gesture_rotate.t) : gesture_rotate_t = object (self)
  inherit GGesture.gesture (obj :> Gesture.t)
  inherit Ggesture_rotate_signals.gesture_rotate_signals obj

  method get_angle_delta : unit -> float =
    fun () ->
      (Gesture_rotate.get_angle_delta obj)

    method as_gesture_rotate = obj
end

let new_ () : gesture_rotate_t =
  new gesture_rotate (Gesture_rotate.new_ ())

