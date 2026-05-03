class type gesture_rotate_t = object
  inherit GGesture.gesture_t

  method on_angle_changed :
    callback:(angle:float -> angle_delta:float -> unit) ->
    Gobject.Signal.handler_id

  method get_angle_delta : unit -> float
  method as_gesture_rotate : Gesture_rotate.t
end

(* High-level class for GestureRotate *)
class gesture_rotate (obj : Gesture_rotate.t) : gesture_rotate_t =
  object (self)
    inherit GGesture.gesture (obj :> Gesture.t)

    method on_angle_changed ~callback =
      Gesture_rotate.on_angle_changed self#as_gesture_rotate ~callback

    method get_angle_delta : unit -> float =
      fun () -> Gesture_rotate.get_angle_delta obj

    method as_gesture_rotate = obj
  end

let new_ () : gesture_rotate_t = new gesture_rotate (Gesture_rotate.new_ ())
