class type gesture_zoom_t = object
  inherit GGesture.gesture_t

  method on_scale_changed :
    callback:(scale:float -> unit) -> Gobject.Signal.handler_id

  method get_scale_delta : unit -> float
  method as_gesture_zoom : Gesture_zoom.t
end

(* High-level class for GestureZoom *)
class gesture_zoom (obj : Gesture_zoom.t) : gesture_zoom_t =
  object (self)
    inherit GGesture.gesture (obj :> Gesture.t)

    method on_scale_changed ~callback =
      Gesture_zoom.on_scale_changed self#as_gesture_zoom ~callback

    method get_scale_delta : unit -> float =
      fun () -> Gesture_zoom.get_scale_delta obj

    method as_gesture_zoom = obj
  end

let new_ () : gesture_zoom_t = new gesture_zoom (Gesture_zoom.new_ ())
