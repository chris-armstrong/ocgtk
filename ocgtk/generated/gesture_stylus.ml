class type gesture_stylus_t = object
  inherit Gesture_single.gesture_single_t

  method on_down :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_motion :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_proximity :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_up :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_device_tool : unit -> Ocgdk.Device_tool.device_tool_t option
  method get_stylus_only : unit -> bool
  method set_stylus_only : bool -> unit
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
