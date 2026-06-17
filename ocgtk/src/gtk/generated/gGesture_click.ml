class type gesture_click_t = object
  inherit GGesture_single.gesture_single_t

  method on_pressed :
    ?after:bool ->
    callback:(n_press:int -> x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_released :
    ?after:bool ->
    callback:(n_press:int -> x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_stopped :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method as_gesture_click : Gesture_click.t
end

(* High-level class for GestureClick *)
class gesture_click (obj : Gesture_click.t) : gesture_click_t =
  object (self)
    inherit GGesture_single.gesture_single (obj :> Gesture_single.t)

    method on_pressed ?(after = false) ~callback () =
      Gesture_click.on_pressed ~after self#as_gesture_click ~callback

    method on_released ?(after = false) ~callback () =
      Gesture_click.on_released ~after self#as_gesture_click ~callback

    method on_stopped ?(after = false) ~callback () =
      Gesture_click.on_stopped ~after self#as_gesture_click ~callback

    method as_gesture_click = obj
  end

let new_ () : gesture_click_t = new gesture_click (Gesture_click.new_ ())
