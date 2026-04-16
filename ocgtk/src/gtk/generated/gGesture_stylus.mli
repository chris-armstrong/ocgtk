class type gesture_stylus_t = object
  inherit GGesture_single.gesture_single_t
  inherit Ggesture_stylus_signals.gesture_stylus_signals

  method get_device_tool :
    unit -> Ocgtk_gdk.Gdk.Device_tool.device_tool_t option

  method get_stylus_only : unit -> bool
  method set_stylus_only : bool -> unit
  method as_gesture_stylus : Gesture_stylus.t
end

class gesture_stylus : Gesture_stylus.t -> gesture_stylus_t

val new_ : unit -> gesture_stylus_t
