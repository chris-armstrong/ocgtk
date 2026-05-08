class type gesture_stylus_t = object
  inherit GGesture_single.gesture_single_t

  method on_down :
    callback:(x:float -> y:float -> unit) -> Gobject.Signal.handler_id

  method on_motion :
    callback:(x:float -> y:float -> unit) -> Gobject.Signal.handler_id

  method on_proximity :
    callback:(x:float -> y:float -> unit) -> Gobject.Signal.handler_id

  method on_up :
    callback:(x:float -> y:float -> unit) -> Gobject.Signal.handler_id

  method get_device_tool :
    unit -> Ocgtk_gdk.Gdk.Device_tool.device_tool_t option

  method get_stylus_only : unit -> bool
  method set_stylus_only : bool -> unit
  method as_gesture_stylus : Gesture_stylus.t
end

(* High-level class for GestureStylus *)
class gesture_stylus (obj : Gesture_stylus.t) : gesture_stylus_t =
  object (self)
    inherit GGesture_single.gesture_single (obj :> Gesture_single.t)

    method on_down ~callback =
      Gesture_stylus.on_down self#as_gesture_stylus ~callback

    method on_motion ~callback =
      Gesture_stylus.on_motion self#as_gesture_stylus ~callback

    method on_proximity ~callback =
      Gesture_stylus.on_proximity self#as_gesture_stylus ~callback

    method on_up ~callback =
      Gesture_stylus.on_up self#as_gesture_stylus ~callback

    method get_device_tool :
        unit -> Ocgtk_gdk.Gdk.Device_tool.device_tool_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgtk_gdk.Gdk.Device_tool.device_tool ret)
          (Gesture_stylus.get_device_tool obj)

    method get_stylus_only : unit -> bool =
      fun () -> Gesture_stylus.get_stylus_only obj

    method set_stylus_only : bool -> unit =
      fun stylus_only -> Gesture_stylus.set_stylus_only obj stylus_only

    method as_gesture_stylus = obj
  end

let new_ () : gesture_stylus_t = new gesture_stylus (Gesture_stylus.new_ ())
