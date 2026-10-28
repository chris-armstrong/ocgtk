class type gesture_stylus_t = object
  inherit Gesture_single.gesture_single_t

  method on_down :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the stylus touches the device. *)

  method on_motion :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the stylus moves while touching the device. *)

  method on_proximity :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the stylus is in proximity of the device. *)

  method on_up :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the stylus no longer touches the device. *)

  method get_device_tool : unit -> Ocgdk.Device_tool.device_tool_t option
  (** Returns the [GdkDeviceTool] currently driving input through this gesture.

      This function must be called from the handler of one of the
      [Gtk.GestureStylus::down], [Gtk.GestureStylus::motion],
      [Gtk.GestureStylus::up] or [Gtk.GestureStylus::proximity] signals. *)

  method get_stylus_only : unit -> bool
  (** Checks whether the gesture is for styluses only.

      Stylus-only gestures will signal events exclusively from stylus input
      devices. *)

  method set_stylus_only : bool -> unit
  (** Sets the state of stylus-only

      If true, the gesture will exclusively handle events from stylus input
      devices, otherwise it'll handle events from any pointing device. *)

  method as_gesture_stylus : Raw.Gesture_stylus.t
end

(* High-level class for GestureStylus *)
class gesture_stylus (obj : Raw.Gesture_stylus.t) : gesture_stylus_t =
  object (self)
    inherit Gesture_single.gesture_single (obj :> Raw.Gesture_single.t)

    method on_down ?(after = false) ~callback () =
      Raw.Gesture_stylus.on_down ~after self#as_gesture_stylus ~callback

    method on_motion ?(after = false) ~callback () =
      Raw.Gesture_stylus.on_motion ~after self#as_gesture_stylus ~callback

    method on_proximity ?(after = false) ~callback () =
      Raw.Gesture_stylus.on_proximity ~after self#as_gesture_stylus ~callback

    method on_up ?(after = false) ~callback () =
      Raw.Gesture_stylus.on_up ~after self#as_gesture_stylus ~callback

    method get_device_tool : unit -> Ocgdk.Device_tool.device_tool_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgdk.Device_tool.device_tool ret)
          (Raw.Gesture_stylus.get_device_tool obj)

    method get_stylus_only : unit -> bool =
      fun () -> Raw.Gesture_stylus.get_stylus_only obj

    method set_stylus_only : bool -> unit =
      fun stylus_only -> Raw.Gesture_stylus.set_stylus_only obj stylus_only

    method as_gesture_stylus = obj
  end

let new_ () : gesture_stylus_t = new gesture_stylus (Raw.Gesture_stylus.new_ ())
