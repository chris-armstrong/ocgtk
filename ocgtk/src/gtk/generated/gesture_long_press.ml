(* GENERATED CODE - DO NOT EDIT *)
(* GestureLongPress: GestureLongPress *)

type t =
  [ `gesture_long_press
  | `gesture_single
  | `gesture
  | `event_controller
  | `object_ ]
  Gobject.obj
(** Recognizes long press gestures.

    This gesture is also known as “Press and Hold”.

    When the timeout is exceeded, the gesture is triggering the
    [Gtk.GestureLongPress::pressed] signal.

    If the touchpoint is lifted before the timeout passes, or if it drifts too
    far of the initial press point, the [Gtk.GestureLongPress::cancelled] signal
    will be emitted.

    How long the timeout is before the ::pressed signal gets emitted is
    determined by the [Gtk.Settings:gtk-long-press-time] setting. It can be
    modified by the [Gtk.GestureLongPress:delay-factor] property. *)

external new_ : unit -> t = "ml_gtk_gesture_long_press_new"
(** Create a new GestureLongPress *)

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

let on_cancelled ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"cancelled" ~callback
    ~after:(Option.value after ~default:false)

let on_pressed ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let x =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_double v
        in
        let y =
          let v = Gobject.Closure.nth argv ~pos:2 in
          Gobject.Value.get_double v
        in
        callback ~x ~y)
  in
  Gobject.Signal.connect obj ~name:"pressed" ~callback:closure
    ~after:(Option.value after ~default:false)
