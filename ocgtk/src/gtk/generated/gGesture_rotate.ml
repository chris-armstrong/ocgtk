(* Signal class defined in ggesture_rotate_signals.ml *)

(* High-level class for GestureRotate *)
class gesture_rotate (obj : Gesture_rotate.t) = object (self)
  inherit Ggesture_rotate_signals.gesture_rotate_signals obj

  method get_angle_delta : unit -> float =
    fun () ->
      (Gesture_rotate.get_angle_delta obj)

    method as_gesture_rotate = obj
end

