class type gesture_swipe_t = object
  inherit Gesture_single.gesture_single_t

  method on_swipe :
    ?after:bool ->
    callback:(velocity_x:float -> velocity_y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method as_gesture_swipe : Raw.Gesture_swipe.t
end

(* High-level class for GestureSwipe *)
class gesture_swipe (obj : Raw.Gesture_swipe.t) : gesture_swipe_t =
  object (self)
    inherit Gesture_single.gesture_single (obj :> Raw.Gesture_single.t)

    method on_swipe ?(after = false) ~callback () =
      Raw.Gesture_swipe.on_swipe ~after self#as_gesture_swipe ~callback

    method as_gesture_swipe = obj
  end

let new_ () : gesture_swipe_t = new gesture_swipe (Raw.Gesture_swipe.new_ ())
