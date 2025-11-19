(* GENERATED CODE - DO NOT EDIT *)
(* Event controller: GesturePan *)

type t = EventController.t

(** Create a new GesturePan *)
external new_ : Gtk.orientation -> t = "ml_gtk_gesture_pan_new"

(* Properties *)

external set_orientation : t -> Gtk.orientation -> unit = "ml_gtk_gesture_pan_set_orientation"

external get_orientation : t -> Gtk.orientation = "ml_gtk_gesture_pan_get_orientation"

