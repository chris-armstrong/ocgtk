(* GENERATED CODE - DO NOT EDIT *)
(* Widget: FlowBoxChild *)

type t = Gtk.Widget.t

(** Create a new FlowBoxChild *)
external new_ : unit -> t = "ml_gtk_flow_box_child_new"

(* Properties *)

external set_child : t -> Gtk.Widget.t option -> unit = "ml_gtk_flow_box_child_set_child"

external is_selected : t -> bool = "ml_gtk_flow_box_child_is_selected"

external get_index : t -> int = "ml_gtk_flow_box_child_get_index"

external get_child : t -> Gtk.Widget.t = "ml_gtk_flow_box_child_get_child"

external changed : t -> unit = "ml_gtk_flow_box_child_changed"

