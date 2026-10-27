class type gesture_long_press_t = object
  inherit Gesture_single.gesture_single_t

  method on_cancelled :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_pressed :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_delay_factor : unit -> float
  method set_delay_factor : float -> unit
  method as_gesture_long_press : Raw.Gesture_long_press.t
end

(* High-level class for GestureLongPress *)
class gesture_long_press (obj : Raw.Gesture_long_press.t) : gesture_long_press_t
  =
  object (self)
    inherit Gesture_single.gesture_single (obj :> Raw.Gesture_single.t)

    method on_cancelled ?(after = false) ~callback () =
      Raw.Gesture_long_press.on_cancelled ~after self#as_gesture_long_press
        ~callback

    method on_pressed ?(after = false) ~callback () =
      Raw.Gesture_long_press.on_pressed ~after self#as_gesture_long_press
        ~callback

    method get_delay_factor : unit -> float =
      fun () -> Raw.Gesture_long_press.get_delay_factor obj

    method set_delay_factor : float -> unit =
      fun delay_factor ->
        Raw.Gesture_long_press.set_delay_factor obj delay_factor

    method as_gesture_long_press = obj
  end

let new_ () : gesture_long_press_t =
  new gesture_long_press (Raw.Gesture_long_press.new_ ())
