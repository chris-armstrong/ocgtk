(** Recognizes tablet stylus input.

    The provided signals just relay the basic information of the stylus events.

    Its methods, signals and properties are on {!class-type-gesture_stylus_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Gesture_stylus}. *)

(** The methods, signals and properties of a [GestureStylus]. *)
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

class gesture_stylus : Raw.Gesture_stylus.t -> gesture_stylus_t
(** Wraps a raw handle of {!Ocgtk.Raw.Gesture_stylus.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> gesture_stylus_t
(** Creates a new [GtkGestureStylus]. *)
