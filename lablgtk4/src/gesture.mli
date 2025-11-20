(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Gesture *)

type t = Gtk.Widget.t

(* Properties *)

(** Get property: n-points *)
external get_n_points : t -> int = "ml_gtk_gesture_get_n_points"

external ungroup : t -> unit = "ml_gtk_gesture_ungroup"

external set_state : t -> Gtk_enums.eventsequencestate -> bool = "ml_gtk_gesture_set_state"

external set_sequence_state : t -> unit -> Gtk_enums.eventsequencestate -> bool = "ml_gtk_gesture_set_sequence_state"

external is_recognized : t -> bool = "ml_gtk_gesture_is_recognized"

external is_grouped_with : t -> Gtk.Widget.t -> bool = "ml_gtk_gesture_is_grouped_with"

external is_active : t -> bool = "ml_gtk_gesture_is_active"

external handles_sequence : t -> unit -> bool = "ml_gtk_gesture_handles_sequence"

external group : t -> Gtk.Widget.t -> unit = "ml_gtk_gesture_group"

external get_sequence_state : t -> unit -> Gtk_enums.eventsequencestate = "ml_gtk_gesture_get_sequence_state"

external get_point : t -> unit -> float -> float -> bool = "ml_gtk_gesture_get_point"

external get_last_event : t -> unit -> _ Gdk.event = "ml_gtk_gesture_get_last_event"

external get_bounding_box_center : t -> float -> float -> bool = "ml_gtk_gesture_get_bounding_box_center"

external get_bounding_box : t -> unit -> bool = "ml_gtk_gesture_get_bounding_box"

