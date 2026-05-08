class type gesture_click_t = object
  inherit GGesture_single.gesture_single_t

  method on_pressed :
    callback:(n_press:int -> x:float -> y:float -> unit) ->
    Gobject.Signal.handler_id

  method on_released :
    callback:(n_press:int -> x:float -> y:float -> unit) ->
    Gobject.Signal.handler_id

  method on_stopped : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method as_gesture_click : Gesture_click.t
end

class gesture_click : Gesture_click.t -> gesture_click_t

val new_ : unit -> gesture_click_t
