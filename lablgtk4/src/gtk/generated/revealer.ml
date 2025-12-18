(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Revealer *)

type t = [`revealer | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

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

(** Sets the type of animation that will be used for
transitions in @revealer.

Available types include various kinds of fades and slides. *)
external set_transition_type : t -> Gtk_enums.revealertransitiontype -> unit = "ml_gtk_revealer_set_transition_type"

(** Sets the child widget of @revealer. *)
external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_revealer_set_child"

(** Gets the type of animation that will be used
for transitions in @revealer. *)
external get_transition_type : t -> Gtk_enums.revealertransitiontype = "ml_gtk_revealer_get_transition_type"

(** Gets the child widget of @revealer. *)
external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_revealer_get_child"

