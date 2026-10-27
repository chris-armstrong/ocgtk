(** Recognizes tablet stylus input.

    The provided signals just relay the basic information of the stylus events.

    Its methods, signals and properties are on {!class-type-gesture_stylus_t}.
    The functions it is built on are in {!Ocgtk.Raw.Gesture_stylus}. *)

(** The methods, signals and properties of a [GtkGestureStylus]. *)
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

class gesture_stylus : Raw.Gesture_stylus.t -> gesture_stylus_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Gesture_stylus.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkGestureStylus], give one already wrapped. *)

val new_ : unit -> gesture_stylus_t
