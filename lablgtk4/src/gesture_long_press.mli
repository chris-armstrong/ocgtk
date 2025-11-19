(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: GestureLongPress *)

type t = EventController.t

(** Create a new GestureLongPress *)
external new_ : unit -> t = "ml_gtk_gesture_long_press_new"

(* Properties *)

(** Get property: delay-factor *)
external get_delay_factor : t -> float = "ml_gtk_gesture_long_press_get_delay_factor"

(** Set property: delay-factor *)
external set_delay_factor : t -> float -> unit = "ml_gtk_gesture_long_press_set_delay_factor"

