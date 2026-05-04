class type gesture_rotate_t = object
  inherit GGesture.gesture_t

  method on_angle_changed :
    callback:(angle:float -> angle_delta:float -> unit) ->
    Gobject.Signal.handler_id

  method get_angle_delta : unit -> float
  method as_gesture_rotate : Gesture_rotate.t
end

class gesture_rotate : Gesture_rotate.t -> gesture_rotate_t

val new_ : unit -> gesture_rotate_t
