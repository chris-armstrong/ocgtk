(* Signal class defined in ggesture_stylus_signals.ml *)

class type gesture_stylus_t = object
    inherit Ggesture_stylus_signals.gesture_stylus_signals
    method get_device_tool : unit -> Ocgtk_gdk.Gdk.device_tool_t option
    method get_stylus_only : unit -> bool
    method set_stylus_only : bool -> unit
    method as_gesture_stylus : Gesture_stylus.t
end

(* High-level class for GestureStylus *)
class gesture_stylus (obj : Gesture_stylus.t) : gesture_stylus_t = object (self)
  inherit Ggesture_stylus_signals.gesture_stylus_signals obj

  method get_device_tool : unit -> Ocgtk_gdk.Gdk.device_tool_t option =
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

