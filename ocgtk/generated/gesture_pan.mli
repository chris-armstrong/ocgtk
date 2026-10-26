class type gesture_pan_t = object
  inherit Gesture_drag.gesture_drag_t

  method on_pan :
    ?after:bool ->
    callback:(direction:Enums.pandirection -> offset:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_orientation : unit -> Enums.orientation
  method set_orientation : Enums.orientation -> unit
  method as_gesture_pan : Raw.Gesture_pan.t
end

class gesture_pan : Raw.Gesture_pan.t -> gesture_pan_t

val new_ : Enums.orientation -> gesture_pan_t
