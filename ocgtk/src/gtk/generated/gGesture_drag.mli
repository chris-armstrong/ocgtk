class type gesture_drag_t = object
  inherit GGesture_single.gesture_single_t

  method on_drag_begin :
    callback:(start_x:float -> start_y:float -> unit) ->
    Gobject.Signal.handler_id

  method on_drag_end :
    callback:(offset_x:float -> offset_y:float -> unit) ->
    Gobject.Signal.handler_id

  method on_drag_update :
    callback:(offset_x:float -> offset_y:float -> unit) ->
    Gobject.Signal.handler_id

  method as_gesture_drag : Gesture_drag.t
end

class gesture_drag : Gesture_drag.t -> gesture_drag_t

val new_ : unit -> gesture_drag_t
