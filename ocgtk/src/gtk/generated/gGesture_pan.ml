(* Signal class defined in ggesture_pan_signals.ml *)

(* High-level class for GesturePan *)
class gesture_pan (obj : Gesture_pan.t) = object (self)
  inherit Ggesture_pan_signals.gesture_pan_signals obj

  method get_orientation : unit -> Gtk_enums.orientation =
    fun () ->
      (Gesture_pan.get_orientation obj)

  method set_orientation : Gtk_enums.orientation -> unit =
    fun orientation ->
      (Gesture_pan.set_orientation obj orientation)

    method as_gesture_pan = obj
end

