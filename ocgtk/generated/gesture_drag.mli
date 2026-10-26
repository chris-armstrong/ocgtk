class type gesture_drag_t = object
  inherit GGesture_single.gesture_single_t

  method on_drag_begin :
    ?after:bool ->
    callback:(start_x:float -> start_y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drag_end :
    ?after:bool ->
    callback:(offset_x:float -> offset_y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_drag_update :
    ?after:bool ->
    callback:(offset_x:float -> offset_y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method as_gesture_drag : Gesture_drag.t
end

class gesture_drag : Gesture_drag.t -> gesture_drag_t

val new_ : unit -> gesture_drag_t
