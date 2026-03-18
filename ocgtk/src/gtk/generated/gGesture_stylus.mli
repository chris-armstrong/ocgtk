class gesture_stylus : Gesture_stylus.t ->
  object
    inherit Ggesture_stylus_signals.gesture_stylus_signals
    method get_device_tool : unit -> Ocgtk_gdk.Gdk.device_tool option
    method get_stylus_only : unit -> bool
    method set_stylus_only : bool -> unit
    method as_gesture_stylus : Gesture_stylus.t
  end

