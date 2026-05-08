class type gesture_zoom_t = object
  inherit GGesture.gesture_t

  method on_scale_changed :
    callback:(scale:float -> unit) -> Gobject.Signal.handler_id

  method get_scale_delta : unit -> float
  method as_gesture_zoom : Gesture_zoom.t
end

class gesture_zoom : Gesture_zoom.t -> gesture_zoom_t

val new_ : unit -> gesture_zoom_t
