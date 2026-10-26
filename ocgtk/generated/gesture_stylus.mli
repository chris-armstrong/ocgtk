class type gesture_stylus_t = object
  inherit Gesture_single.gesture_single_t

  method on_down :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_motion :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_proximity :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_up :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_device_tool : unit -> Ocgdk.Device_tool.device_tool_t option
  method get_stylus_only : unit -> bool
  method set_stylus_only : bool -> unit
  method as_gesture_stylus : Raw.Gesture_stylus.t
end

class gesture_stylus : Raw.Gesture_stylus.t -> gesture_stylus_t

val new_ : unit -> gesture_stylus_t
