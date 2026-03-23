(* Signal class defined in ggesture_pan_signals.ml *)

class type gesture_pan_t = object
    inherit GGesture_drag.gesture_drag_t
    inherit Ggesture_pan_signals.gesture_pan_signals
    method get_orientation : unit -> Gtk_enums.orientation
    method set_orientation : Gtk_enums.orientation -> unit
    method as_gesture_pan : Gesture_pan.t
end

(* High-level class for GesturePan *)
class gesture_pan (obj : Gesture_pan.t) : gesture_pan_t = object (self)
  inherit GGesture_drag.gesture_drag (obj :> Gesture_drag.t)
  inherit Ggesture_pan_signals.gesture_pan_signals obj

  method get_orientation : unit -> Gtk_enums.orientation =
    fun () ->
      (Gesture_pan.get_orientation obj)

  method set_orientation : Gtk_enums.orientation -> unit =
    fun orientation ->
      (Gesture_pan.set_orientation obj orientation)

    method as_gesture_pan = obj
end

let new_ (orientation : Gtk_enums.orientation) : gesture_pan_t =
  new gesture_pan (Gesture_pan.new_ orientation)

