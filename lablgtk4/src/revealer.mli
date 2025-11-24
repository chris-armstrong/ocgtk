(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Revealer *)

type t = Gtk.widget

(** Create a new Revealer *)
external new_ : unit -> t = "ml_gtk_revealer_new"

(* Properties *)

(** Get property: child-revealed *)
external get_child_revealed : t -> bool = "ml_gtk_revealer_get_child_revealed"

(** Get property: reveal-child *)
external get_reveal_child : t -> bool = "ml_gtk_revealer_get_reveal_child"

(** Set property: reveal-child *)
external set_reveal_child : t -> bool -> unit = "ml_gtk_revealer_set_reveal_child"

(** Get property: transition-duration *)
external get_transition_duration : t -> int = "ml_gtk_revealer_get_transition_duration"

(** Set property: transition-duration *)
external set_transition_duration : t -> int -> unit = "ml_gtk_revealer_set_transition_duration"

external set_transition_type : t -> Gtk_enums.revealertransitiontype -> unit = "ml_gtk_revealer_set_transition_type"

external set_child : t -> Gtk.widget option -> unit = "ml_gtk_revealer_set_child"

external get_transition_type : t -> Gtk_enums.revealertransitiontype = "ml_gtk_revealer_get_transition_type"

external get_child : t -> Gtk.widget = "ml_gtk_revealer_get_child"

