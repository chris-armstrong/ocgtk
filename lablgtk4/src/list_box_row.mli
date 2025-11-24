(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ListBoxRow *)

type t = Gtk.Widget.t

(** Create a new ListBoxRow *)
external new_ : unit -> t = "ml_gtk_list_box_row_new"

(* Properties *)

(** Get property: activatable *)
external get_activatable : t -> bool = "ml_gtk_list_box_row_get_activatable"

(** Set property: activatable *)
external set_activatable : t -> bool -> unit = "ml_gtk_list_box_row_set_activatable"

(** Get property: selectable *)
external get_selectable : t -> bool = "ml_gtk_list_box_row_get_selectable"

(** Set property: selectable *)
external set_selectable : t -> bool -> unit = "ml_gtk_list_box_row_set_selectable"

external set_header : t -> Gtk.Widget.t option -> unit = "ml_gtk_list_box_row_set_header"

external set_child : t -> Gtk.Widget.t option -> unit = "ml_gtk_list_box_row_set_child"

external is_selected : t -> bool = "ml_gtk_list_box_row_is_selected"

external get_index : t -> int = "ml_gtk_list_box_row_get_index"

external get_header : t -> Gtk.Widget.t = "ml_gtk_list_box_row_get_header"

external get_child : t -> Gtk.Widget.t = "ml_gtk_list_box_row_get_child"

external changed : t -> unit = "ml_gtk_list_box_row_changed"

