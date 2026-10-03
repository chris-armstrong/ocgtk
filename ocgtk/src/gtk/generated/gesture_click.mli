(* GENERATED CODE - DO NOT EDIT *)
(* GestureClick: GestureClick *)

(** Recognizes click gestures.

    It is able to recognize multiple clicks on a nearby zone, which can be
    listened for through the [Gtk.GestureClick::pressed] signal. Whenever time
    or distance between clicks exceed the GTK defaults,
    [Gtk.GestureClick::stopped] is emitted, and the click counter is reset. *)

type t =
  [ `gesture_click | `gesture_single | `gesture | `event_controller | `object_ ]
  Gobject.obj

external new_ : unit -> t = "ml_gtk_gesture_click_new"
(** Create a new GestureClick *)

(* Methods *)
val on_pressed :
  ?after:bool ->
  t ->
  callback:(n_press:int -> x:float -> y:float -> unit) ->
  Gobject.Signal.handler_id

val on_released :
  ?after:bool ->
  t ->
  callback:(n_press:int -> x:float -> y:float -> unit) ->
  Gobject.Signal.handler_id

val on_stopped :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
