(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CellArea *)

type t = Gtk.Widget.t

(* Properties *)

external stop_editing : t -> bool -> unit = "ml_gtk_cell_area_stop_editing"

external snapshot : t -> Gtk.Widget.t -> Gtk.Widget.t -> Gtk.Widget.t -> unit -> unit -> Gtk_enums.cellrendererstate -> bool -> unit = "ml_gtk_cell_area_snapshot_bytecode" "ml_gtk_cell_area_snapshot_native"

external set_focus_cell : t -> Gtk.Widget.t option -> unit = "ml_gtk_cell_area_set_focus_cell"

external request_renderer : t -> Gtk.Widget.t -> Gtk_enums.orientation -> Gtk.Widget.t -> int -> int -> int -> unit = "ml_gtk_cell_area_request_renderer_bytecode" "ml_gtk_cell_area_request_renderer_native"

external remove_focus_sibling : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_cell_area_remove_focus_sibling"

external remove : t -> Gtk.Widget.t -> unit = "ml_gtk_cell_area_remove"

external is_focus_sibling : t -> Gtk.Widget.t -> Gtk.Widget.t -> bool = "ml_gtk_cell_area_is_focus_sibling"

external is_activatable : t -> bool = "ml_gtk_cell_area_is_activatable"

external inner_cell_area : t -> Gtk.Widget.t -> unit -> unit -> unit = "ml_gtk_cell_area_inner_cell_area"

external has_renderer : t -> Gtk.Widget.t -> bool = "ml_gtk_cell_area_has_renderer"

external get_request_mode : t -> Gtk_enums.sizerequestmode = "ml_gtk_cell_area_get_request_mode"

external get_preferred_width_for_height : t -> Gtk.Widget.t -> Gtk.Widget.t -> int -> int -> int -> unit = "ml_gtk_cell_area_get_preferred_width_for_height_bytecode" "ml_gtk_cell_area_get_preferred_width_for_height_native"

external get_preferred_width : t -> Gtk.Widget.t -> Gtk.Widget.t -> int -> int -> unit = "ml_gtk_cell_area_get_preferred_width"

external get_preferred_height_for_width : t -> Gtk.Widget.t -> Gtk.Widget.t -> int -> int -> int -> unit = "ml_gtk_cell_area_get_preferred_height_for_width_bytecode" "ml_gtk_cell_area_get_preferred_height_for_width_native"

external get_preferred_height : t -> Gtk.Widget.t -> Gtk.Widget.t -> int -> int -> unit = "ml_gtk_cell_area_get_preferred_height"

external get_focus_from_sibling : t -> Gtk.Widget.t -> Gtk.Widget.t = "ml_gtk_cell_area_get_focus_from_sibling"

external get_focus_cell : t -> Gtk.Widget.t = "ml_gtk_cell_area_get_focus_cell"

external get_edited_cell : t -> Gtk.Widget.t = "ml_gtk_cell_area_get_edited_cell"

external get_edit_widget : t -> Gtk.Widget.t = "ml_gtk_cell_area_get_edit_widget"

external get_current_path_string : t -> string = "ml_gtk_cell_area_get_current_path_string"

external get_cell_at_position : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit -> int -> int -> unit -> Gtk.Widget.t = "ml_gtk_cell_area_get_cell_at_position_bytecode" "ml_gtk_cell_area_get_cell_at_position_native"

external get_cell_allocation : t -> Gtk.Widget.t -> Gtk.Widget.t -> Gtk.Widget.t -> unit -> unit -> unit = "ml_gtk_cell_area_get_cell_allocation_bytecode" "ml_gtk_cell_area_get_cell_allocation_native"

external foreach_alloc : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit -> unit -> unit -> unit -> unit = "ml_gtk_cell_area_foreach_alloc_bytecode" "ml_gtk_cell_area_foreach_alloc_native"

external foreach : t -> unit -> unit -> unit = "ml_gtk_cell_area_foreach"

external focus : t -> Gtk_enums.directiontype -> bool = "ml_gtk_cell_area_focus"

external event : t -> Gtk.Widget.t -> Gtk.Widget.t -> _ Gdk.event -> unit -> Gtk_enums.cellrendererstate -> int = "ml_gtk_cell_area_event_bytecode" "ml_gtk_cell_area_event_native"

external create_context : t -> Gtk.Widget.t = "ml_gtk_cell_area_create_context"

external copy_context : t -> Gtk.Widget.t -> Gtk.Widget.t = "ml_gtk_cell_area_copy_context"

external cell_set_valist : t -> Gtk.Widget.t -> string -> unit -> unit = "ml_gtk_cell_area_cell_set_valist"

external cell_set_property : t -> Gtk.Widget.t -> string -> unit -> unit = "ml_gtk_cell_area_cell_set_property"

external cell_set : t -> Gtk.Widget.t -> string -> unit -> unit = "ml_gtk_cell_area_cell_set"

external cell_get_valist : t -> Gtk.Widget.t -> string -> unit -> unit = "ml_gtk_cell_area_cell_get_valist"

external cell_get_property : t -> Gtk.Widget.t -> string -> unit -> unit = "ml_gtk_cell_area_cell_get_property"

external cell_get : t -> Gtk.Widget.t -> string -> unit -> unit = "ml_gtk_cell_area_cell_get"

external attribute_get_column : t -> Gtk.Widget.t -> string -> int = "ml_gtk_cell_area_attribute_get_column"

external attribute_disconnect : t -> Gtk.Widget.t -> string -> unit = "ml_gtk_cell_area_attribute_disconnect"

external attribute_connect : t -> Gtk.Widget.t -> string -> int -> unit = "ml_gtk_cell_area_attribute_connect"

external apply_attributes : t -> Gtk.Widget.t -> Gtk.Widget.t -> bool -> bool -> unit = "ml_gtk_cell_area_apply_attributes"

external add_with_properties : t -> Gtk.Widget.t -> string -> unit -> unit = "ml_gtk_cell_area_add_with_properties"

external add_focus_sibling : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_cell_area_add_focus_sibling"

external add : t -> Gtk.Widget.t -> unit = "ml_gtk_cell_area_add"

external activate_cell : t -> Gtk.Widget.t -> Gtk.Widget.t -> _ Gdk.event -> unit -> Gtk_enums.cellrendererstate -> bool = "ml_gtk_cell_area_activate_cell_bytecode" "ml_gtk_cell_area_activate_cell_native"

external activate : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit -> Gtk_enums.cellrendererstate -> bool -> bool = "ml_gtk_cell_area_activate_bytecode" "ml_gtk_cell_area_activate_native"

