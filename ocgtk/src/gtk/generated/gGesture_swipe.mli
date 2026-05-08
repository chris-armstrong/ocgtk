class type gesture_swipe_t = object
  inherit GGesture_single.gesture_single_t

  method on_swipe :
    callback:(velocity_x:float -> velocity_y:float -> unit) ->
    Gobject.Signal.handler_id

  method as_gesture_swipe : Gesture_swipe.t
end

class gesture_swipe : Gesture_swipe.t -> gesture_swipe_t

val new_ : unit -> gesture_swipe_t
