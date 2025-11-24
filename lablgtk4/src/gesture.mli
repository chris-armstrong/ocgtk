(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Gesture *)

type t = Gtk.widget

(* Properties *)

(** Get property: n-points *)
external get_n_points : t -> int = "ml_gtk_gesture_get_n_points"

external ungroup : t -> unit = "ml_gtk_gesture_ungroup"

external set_state : t -> Gtk_enums.eventsequencestate -> bool = "ml_gtk_gesture_set_state"

external is_recognized : t -> bool = "ml_gtk_gesture_is_recognized"

external is_grouped_with : t -> Gtk.widget -> bool = "ml_gtk_gesture_is_grouped_with"

external is_active : t -> bool = "ml_gtk_gesture_is_active"

external group : t -> Gtk.widget -> unit = "ml_gtk_gesture_group"

