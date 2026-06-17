(* GENERATED CODE - DO NOT EDIT *)
(* GestureClick: GestureClick *)

type t = [`gesture_click | `gesture_single | `gesture | `event_controller | `object_] Gobject.obj

(** Create a new GestureClick *)
external new_ : unit -> t = "ml_gtk_gesture_click_new"

(* Methods *)
val on_pressed : ?after:bool -> t -> callback:(n_press:int -> x:float -> y:float -> unit) -> Gobject.Signal.handler_id
val on_released : ?after:bool -> t -> callback:(n_press:int -> x:float -> y:float -> unit) -> Gobject.Signal.handler_id
val on_stopped : ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
