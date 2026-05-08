class type gesture_swipe_t = object
  inherit GGesture_single.gesture_single_t

  method on_swipe :
    callback:(velocity_x:float -> velocity_y:float -> unit) ->
    Gobject.Signal.handler_id

  method as_gesture_swipe : Gesture_swipe.t
end

(* High-level class for GestureSwipe *)
class gesture_swipe (obj : Gesture_swipe.t) : gesture_swipe_t =
  object (self)
    inherit GGesture_single.gesture_single (obj :> Gesture_single.t)

    method on_swipe ~callback =
      Gesture_swipe.on_swipe self#as_gesture_swipe ~callback

    method as_gesture_swipe = obj
  end

let new_ () : gesture_swipe_t = new gesture_swipe (Gesture_swipe.new_ ())
