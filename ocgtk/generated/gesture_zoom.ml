class type gesture_zoom_t = object
  inherit Gesture.gesture_t

  method on_scale_changed :
    ?after:bool ->
    callback:(scale:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_scale_delta : unit -> float
  (** Gets the scale delta.

      If [gesture] is active, this function returns the zooming difference since
      the gesture was recognized (hence the starting point is considered 1:1).
      If [gesture] is not active, 1 is returned. *)

  method as_gesture_zoom : Raw.Gesture_zoom.t
end

(* High-level class for GestureZoom *)
class gesture_zoom (obj : Raw.Gesture_zoom.t) : gesture_zoom_t =
  object (self)
    inherit Gesture.gesture (obj :> Raw.Gesture.t)

    method on_scale_changed ?(after = false) ~callback () =
      Raw.Gesture_zoom.on_scale_changed ~after self#as_gesture_zoom ~callback

    method get_scale_delta : unit -> float =
      fun () -> Raw.Gesture_zoom.get_scale_delta obj

    method as_gesture_zoom = obj
  end

let new_ () : gesture_zoom_t = new gesture_zoom (Raw.Gesture_zoom.new_ ())
