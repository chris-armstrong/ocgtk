(* Signal class defined in ggesture_zoom_signals.ml *)

class type gesture_zoom_t = object
    inherit GGesture.gesture_t
    inherit Ggesture_zoom_signals.gesture_zoom_signals
    method get_scale_delta : unit -> float
    method as_gesture_zoom : Gesture_zoom.t
end

(* High-level class for GestureZoom *)
class gesture_zoom (obj : Gesture_zoom.t) : gesture_zoom_t = object (self)
  inherit GGesture.gesture (Obj.magic obj : Gesture.t)
  inherit Ggesture_zoom_signals.gesture_zoom_signals obj

  method get_scale_delta : unit -> float =
    fun () ->
      (Gesture_zoom.get_scale_delta obj)

    method as_gesture_zoom = obj
end

let new_ () : gesture_zoom_t =
  new gesture_zoom (Gesture_zoom.new_ ())

