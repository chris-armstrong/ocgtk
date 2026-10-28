(** Recognizes long press gestures.

    This gesture is also known as “Press and Hold”.

    When the timeout is exceeded, the gesture is triggering the
    [Gtk.GestureLongPress::pressed] signal.

    If the touchpoint is lifted before the timeout passes, or if it drifts too
    far of the initial press point, the [Gtk.GestureLongPress::cancelled] signal
    will be emitted.

    How long the timeout is before the ::pressed signal gets emitted is
    determined by the [Gtk.Settings:gtk-long-press-time] setting. It can be
    modified by the [Gtk.GestureLongPress:delay-factor] property.

    Its methods, signals and properties are on
    {!class-type-gesture_long_press_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Gesture_long_press}. *)

(** {b The methods, signals and properties of a [GestureLongPress].}

    Recognizes long press gestures.

    This gesture is also known as “Press and Hold”.

    When the timeout is exceeded, the gesture is triggering the
    [Gtk.GestureLongPress::pressed] signal.

    If the touchpoint is lifted before the timeout passes, or if it drifts too
    far of the initial press point, the [Gtk.GestureLongPress::cancelled] signal
    will be emitted.

    How long the timeout is before the ::pressed signal gets emitted is
    determined by the [Gtk.Settings:gtk-long-press-time] setting. It can be
    modified by the [Gtk.GestureLongPress:delay-factor] property. *)
class type gesture_long_press_t = object
  inherit Gesture_single.gesture_single_t

  method on_cancelled :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted whenever a press moved too far, or was released before
      [Gtk.GestureLongPress::pressed] happened. *)

  method on_pressed :
    ?after:bool ->
    callback:(x:float -> y:float -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever a press goes unmoved/unreleased longer than what the GTK
      defaults tell. *)

  method get_delay_factor : unit -> float
  (** Returns the delay factor. *)

  method set_delay_factor : float -> unit
  (** Applies the given delay factor.

      The default long press time will be multiplied by this value. Valid values
      are in the range \[0.5..2.0\]. *)

  method as_gesture_long_press : Raw.Gesture_long_press.t
end

class gesture_long_press : Raw.Gesture_long_press.t -> gesture_long_press_t
(** Wraps a raw handle of {!Ocgtk.Raw.Gesture_long_press.t}. *)

(** {2:constructors Constructors} *)

val new_ : unit -> gesture_long_press_t
(** Returns a newly created [GtkGesture] that recognizes long presses. *)
