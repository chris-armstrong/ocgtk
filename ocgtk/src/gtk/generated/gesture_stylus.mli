(* GENERATED CODE - DO NOT EDIT *)
(* GestureStylus: GestureStylus *)

(** Recognizes tablet stylus input.

    The provided signals just relay the basic information of the stylus events.
*)

type t =
  [ `gesture_stylus | `gesture_single | `gesture | `event_controller | `object_ ]
  Gobject.obj

external new_ : unit -> t = "ml_gtk_gesture_stylus_new"
(** Create a new GestureStylus *)

(* Methods *)

external set_stylus_only : t -> bool -> unit
  = "ml_gtk_gesture_stylus_set_stylus_only"
(** Sets the state of stylus-only

    If true, the gesture will exclusively handle events from stylus input
    devices, otherwise it'll handle events from any pointing device. *)

external get_stylus_only : t -> bool = "ml_gtk_gesture_stylus_get_stylus_only"
(** Checks whether the gesture is for styluses only.

    Stylus-only gestures will signal events exclusively from stylus input
    devices. *)

external get_device_tool : t -> Ocgtk_gdk.Gdk.Wrappers.Device_tool.t option
  = "ml_gtk_gesture_stylus_get_device_tool"
(** Returns the [GdkDeviceTool] currently driving input through this gesture.

    This function must be called from the handler of one of the
    [Gtk.GestureStylus::down], [Gtk.GestureStylus::motion],
    [Gtk.GestureStylus::up] or [Gtk.GestureStylus::proximity] signals. *)

external get_backlog :
  t -> bool * Ocgtk_gdk.Gdk.Wrappers.Time_coord.t array * int
  = "ml_gtk_gesture_stylus_get_backlog"
(** Returns the accumulated backlog of tracking information.

    By default, GTK will limit rate of input events. On stylus input where
    accuracy of strokes is paramount, this function returns the accumulated
    coordinate/timing state before the emission of the current
    \[Gtk.GestureStylus::motion\] signal.

    This function may only be called within a [Gtk.GestureStylus::motion] signal
    handler, the state given in this signal and obtainable through
    [Gtk.GestureStylus.get_axis] express the latest (most up-to-date) state in
    motion history.

    The [backlog] is provided in chronological order. *)

external get_axis : t -> Ocgtk_gdk.Gdk.axisuse -> bool * float
  = "ml_gtk_gesture_stylus_get_axis"
(** Returns the current value for the requested [axis].

    This function must be called from the handler of one of the
    [Gtk.GestureStylus::down], [Gtk.GestureStylus::motion],
    [Gtk.GestureStylus::up] or [Gtk.GestureStylus::proximity] signals. *)

(* Properties *)

val on_down :
  ?after:bool ->
  t ->
  callback:(x:float -> y:float -> unit) ->
  Gobject.Signal.handler_id

val on_motion :
  ?after:bool ->
  t ->
  callback:(x:float -> y:float -> unit) ->
  Gobject.Signal.handler_id

val on_proximity :
  ?after:bool ->
  t ->
  callback:(x:float -> y:float -> unit) ->
  Gobject.Signal.handler_id

val on_up :
  ?after:bool ->
  t ->
  callback:(x:float -> y:float -> unit) ->
  Gobject.Signal.handler_id
