class type gesture_pan_t = object
    inherit GGesture_drag.gesture_drag_t
    inherit Ggesture_pan_signals.gesture_pan_signals
    method get_orientation : unit -> Gtk_enums.orientation
    method set_orientation : Gtk_enums.orientation -> unit
    method as_gesture_pan : Gesture_pan.t
end

class gesture_pan : Gesture_pan.t -> gesture_pan_t

val new_ : Gtk_enums.orientation -> gesture_pan_t
