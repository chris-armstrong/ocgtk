(* GENERATED CODE - DO NOT EDIT *)
(* GestureLongPress: GestureLongPress *)

(** Recognizes long press gestures.

    This gesture is also known as “Press and Hold”.

    When the timeout is exceeded, the gesture is triggering the
    {{!Ocgtk.Raw.Gesture_long_press.val-on_pressed}[Gtk.GestureLongPress::pressed]}
    signal.

    If the touchpoint is lifted before the timeout passes, or if it drifts too
    far of the initial press point, the
    {{!Ocgtk.Raw.Gesture_long_press.val-on_cancelled}[Gtk.GestureLongPress::cancelled]}
    signal will be emitted.

    How long the timeout is before the ::pressed signal gets emitted is
    determined by the
    {{!Ocgtk.Raw.Settings.val-get_gtk_long_press_time}[Gtk.Settings:gtk-long-press-time]}
    setting. It can be modified by the
    {{!Ocgtk.Raw.Gesture_long_press.val-get_delay_factor}[Gtk.GestureLongPress:delay-factor]}
    property.

    The class built on this module is in {!Ocgtk.Gesture_long_press}. *)

type t =
  [ `gesture_long_press
  | `gesture_single
  | `gesture
  | `event_controller
  | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_gesture_long_press_get_type"

external new_ : unit -> t = "ml_gtk_gesture_long_press_new"
(** Returns a newly created [GtkGesture] that recognizes long presses. *)

(* Methods *)

external set_delay_factor : t -> float -> unit
  = "ml_gtk_gesture_long_press_set_delay_factor"
(** Applies the given delay factor.

    The default long press time will be multiplied by this value. Valid values
    are in the range \[0.5..2.0\]. *)

external get_delay_factor : t -> float
  = "ml_gtk_gesture_long_press_get_delay_factor"
(** Returns the delay factor. *)

(* Properties *)

val on_cancelled :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
(** Emitted whenever a press moved too far, or was released before
    {{!Ocgtk.Raw.Gesture_long_press.val-on_pressed}[Gtk.GestureLongPress::pressed]}
    happened. *)

val on_pressed :
  ?after:bool ->
  t ->
  callback:(x:float -> y:float -> unit) ->
  Gobject.Signal.handler_id
(** Emitted whenever a press goes unmoved/unreleased longer than what the GTK
    defaults tell. *)
