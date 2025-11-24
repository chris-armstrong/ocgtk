(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CellArea *)

type t = Gtk.widget

(* Properties *)

external stop_editing : t -> bool -> unit = "ml_gtk_cell_area_stop_editing"

external set_focus_cell : t -> Gtk.widget option -> unit = "ml_gtk_cell_area_set_focus_cell"

external remove_focus_sibling : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_cell_area_remove_focus_sibling"

external remove : t -> Gtk.widget -> unit = "ml_gtk_cell_area_remove"

external is_focus_sibling : t -> Gtk.widget -> Gtk.widget -> bool = "ml_gtk_cell_area_is_focus_sibling"

external is_activatable : t -> bool = "ml_gtk_cell_area_is_activatable"

external has_renderer : t -> Gtk.widget -> bool = "ml_gtk_cell_area_has_renderer"

external get_request_mode : t -> Gtk_enums.sizerequestmode = "ml_gtk_cell_area_get_request_mode"

external get_focus_from_sibling : t -> Gtk.widget -> Gtk.widget = "ml_gtk_cell_area_get_focus_from_sibling"

external get_focus_cell : t -> Gtk.widget = "ml_gtk_cell_area_get_focus_cell"

external get_edited_cell : t -> Gtk.widget = "ml_gtk_cell_area_get_edited_cell"

external get_edit_widget : t -> Gtk.widget = "ml_gtk_cell_area_get_edit_widget"

external get_current_path_string : t -> string = "ml_gtk_cell_area_get_current_path_string"

external focus : t -> Gtk_enums.directiontype -> bool = "ml_gtk_cell_area_focus"

external create_context : t -> Gtk.widget = "ml_gtk_cell_area_create_context"

external copy_context : t -> Gtk.widget -> Gtk.widget = "ml_gtk_cell_area_copy_context"

external attribute_get_column : t -> Gtk.widget -> string -> int = "ml_gtk_cell_area_attribute_get_column"

external attribute_disconnect : t -> Gtk.widget -> string -> unit = "ml_gtk_cell_area_attribute_disconnect"

external attribute_connect : t -> Gtk.widget -> string -> int -> unit = "ml_gtk_cell_area_attribute_connect"

external apply_attributes : t -> Gtk.widget -> Gtk.widget -> bool -> bool -> unit = "ml_gtk_cell_area_apply_attributes"

external add_focus_sibling : t -> Gtk.widget -> Gtk.widget -> unit = "ml_gtk_cell_area_add_focus_sibling"

external add : t -> Gtk.widget -> unit = "ml_gtk_cell_area_add"

