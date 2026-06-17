class type gesture_click_t = object
    inherit GGesture_single.gesture_single_t
    method on_pressed : ?after:bool -> callback:(n_press:int -> x:float -> y:float -> unit) -> unit -> Gobject.Signal.handler_id
    method on_released : ?after:bool -> callback:(n_press:int -> x:float -> y:float -> unit) -> unit -> Gobject.Signal.handler_id
    method on_stopped : ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
    method as_gesture_click : Gesture_click.t
end

class gesture_click : Gesture_click.t -> gesture_click_t

val new_ : unit -> gesture_click_t
