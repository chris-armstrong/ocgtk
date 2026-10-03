(* GENERATED CODE - DO NOT EDIT *)
(* GesturePan: GesturePan *)

(** Recognizes pan gestures.

    These are drags that are locked to happen along one axis. The axis that a
    [GtkGesturePan] handles is defined at construct time, and can be changed
    through [Gtk.GesturePan.set_orientation].

    When the gesture starts to be recognized, [GtkGesturePan] will attempt to
    determine as early as possible whether the sequence is moving in the
    expected direction, and denying the sequence if this does not happen.

    Once a panning gesture along the expected axis is recognized, the
    [Gtk.GesturePan::pan] signal will be emitted as input events are received,
    containing the offset in the given axis. *)

type t =
  [ `gesture_pan
  | `gesture_drag
  | `gesture_single
  | `gesture
  | `event_controller
  | `object_ ]
  Gobject.obj

external new_ : Gtk_enums.orientation -> t = "ml_gtk_gesture_pan_new"
(** Create a new GesturePan *)

(* Methods *)

external set_orientation : t -> Gtk_enums.orientation -> unit
  = "ml_gtk_gesture_pan_set_orientation"
(** Sets the orientation to be expected on pan gestures. *)

external get_orientation : t -> Gtk_enums.orientation
  = "ml_gtk_gesture_pan_get_orientation"
(** Returns the orientation of the pan gestures that this [gesture] expects. *)

(* Properties *)

let on_pan ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let direction =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gtk_enums.pandirection_of_int (Gobject.Value.get_enum_int v)
        in
        let offset =
          let v = Gobject.Closure.nth argv ~pos:2 in
          Gobject.Value.get_double v
        in
        callback ~direction ~offset)
  in
  Gobject.Signal.connect obj ~name:"pan" ~callback:closure
    ~after:(Option.value after ~default:false)
