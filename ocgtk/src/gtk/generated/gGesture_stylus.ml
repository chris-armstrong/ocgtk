(* Signal class defined in ggesture_stylus_signals.ml *)

(* High-level class for GestureStylus *)
class gesture_stylus (obj : Gesture_stylus.t) = object (self)
  inherit Ggesture_stylus_signals.gesture_stylus_signals obj

  method get_device_tool : unit -> Ocgtk_gdk.Gdk.device_tool option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.device_tool ret) (Gesture_stylus.get_device_tool obj)

  method get_stylus_only : unit -> bool =
    fun () ->
      (Gesture_stylus.get_stylus_only obj)

  method set_stylus_only : bool -> unit =
    fun stylus_only ->
      (Gesture_stylus.set_stylus_only obj stylus_only)

    method as_gesture_stylus = obj
end

