(* GENERATED CODE - DO NOT EDIT *)
(* Widget: ListBoxRow *)

type t = Gtk.widget

external new_ : unit -> t = "ml_gtk_list_box_row_new"

(* Properties *)

external get_activatable : t -> bool = "ml_gtk_list_box_row_get_activatable"

external set_activatable : t -> bool -> unit = "ml_gtk_list_box_row_set_activatable"

external get_selectable : t -> bool = "ml_gtk_list_box_row_get_selectable"

external set_selectable : t -> bool -> unit = "ml_gtk_list_box_row_set_selectable"

external set_header : t -> Gtk.widget option -> unit = "ml_gtk_list_box_row_set_header"

external set_child : t -> Gtk.widget option -> unit = "ml_gtk_list_box_row_set_child"

external is_selected : t -> bool = "ml_gtk_list_box_row_is_selected"

external get_index : t -> int = "ml_gtk_list_box_row_get_index"

external get_header : t -> Gtk.widget = "ml_gtk_list_box_row_get_header"

external get_child : t -> Gtk.widget = "ml_gtk_list_box_row_get_child"

external changed : t -> unit = "ml_gtk_list_box_row_changed"

