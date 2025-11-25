(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: GestureLongPress *)

type t = EventController.t

(** Create a new GestureLongPress *)
external new_ : unit -> t = "ml_gtk_gesture_long_press_new"

(* Properties *)

(** Applies the given delay factor.

The default long press time will be multiplied by this value.
Valid values are in the range [0.5..2.0]. *)
external set_delay_factor : t -> float -> unit = "ml_gtk_gesture_long_press_set_delay_factor"

(** Returns the delay factor. *)
external get_delay_factor : t -> float = "ml_gtk_gesture_long_press_get_delay_factor"

