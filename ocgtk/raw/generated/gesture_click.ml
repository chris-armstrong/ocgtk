(* GENERATED CODE - DO NOT EDIT *)
(* GestureClick: GestureClick *)

(** Recognizes click gestures.

    It is able to recognize multiple clicks on a nearby zone, which can be
    listened for through the
    {{!Ocgtk.Raw.Gesture_click.val-on_pressed}[Gtk.GestureClick::pressed]}
    signal. Whenever time or distance between clicks exceed the GTK defaults,
    {{!Ocgtk.Raw.Gesture_click.val-on_stopped}[Gtk.GestureClick::stopped]} is
    emitted, and the click counter is reset.

    The class built on this module is in {!Ocgtk.Gesture_click}. *)

type t =
  [ `gesture_click | `gesture_single | `gesture | `event_controller | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_gesture_click_get_type"

external new_ : unit -> t = "ml_gtk_gesture_click_new"
(** Returns a newly created [GtkGesture] that recognizes single and multiple
    presses. *)

(* Methods *)
let on_pressed ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let n_press =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_int v
        in
        let x =
          let v = Gobject.Closure.nth argv ~pos:2 in
          Gobject.Value.get_double v
        in
        let y =
          let v = Gobject.Closure.nth argv ~pos:3 in
          Gobject.Value.get_double v
        in
        callback ~n_press ~x ~y)
  in
  Gobject.Signal.connect obj ~name:"pressed" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_released ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let n_press =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_int v
        in
        let x =
          let v = Gobject.Closure.nth argv ~pos:2 in
          Gobject.Value.get_double v
        in
        let y =
          let v = Gobject.Closure.nth argv ~pos:3 in
          Gobject.Value.get_double v
        in
        callback ~n_press ~x ~y)
  in
  Gobject.Signal.connect obj ~name:"released" ~callback:closure
    ~after:(Option.value after ~default:false)

let on_stopped ?after obj ~callback =
  Gobject.Signal.connect_simple obj ~name:"stopped" ~callback
    ~after:(Option.value after ~default:false)
