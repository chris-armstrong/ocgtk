(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeView *)

type t = Gtk.Widget.t

(** Create a new TreeView *)
external new_ : unit -> t = "ml_gtk_tree_view_new"

(** Create a new TreeView *)
external new_with_model : Gtk.Widget.t -> t = "ml_gtk_tree_view_new_with_model"

(* Properties *)

(** Get property: activate-on-single-click *)
external get_activate_on_single_click : t -> bool = "ml_gtk_tree_view_get_activate_on_single_click"

(** Set property: activate-on-single-click *)
external set_activate_on_single_click : t -> bool -> unit = "ml_gtk_tree_view_set_activate_on_single_click"

(** Get property: enable-search *)
external get_enable_search : t -> bool = "ml_gtk_tree_view_get_enable_search"

(** Set property: enable-search *)
external set_enable_search : t -> bool -> unit = "ml_gtk_tree_view_set_enable_search"

(** Get property: enable-tree-lines *)
external get_enable_tree_lines : t -> bool = "ml_gtk_tree_view_get_enable_tree_lines"

(** Set property: enable-tree-lines *)
external set_enable_tree_lines : t -> bool -> unit = "ml_gtk_tree_view_set_enable_tree_lines"

(** Get property: fixed-height-mode *)
external get_fixed_height_mode : t -> bool = "ml_gtk_tree_view_get_fixed_height_mode"

(** Set property: fixed-height-mode *)
external set_fixed_height_mode : t -> bool -> unit = "ml_gtk_tree_view_set_fixed_height_mode"

(** Get property: headers-clickable *)
external get_headers_clickable : t -> bool = "ml_gtk_tree_view_get_headers_clickable"

(** Set property: headers-clickable *)
external set_headers_clickable : t -> bool -> unit = "ml_gtk_tree_view_set_headers_clickable"

(** Get property: headers-visible *)
external get_headers_visible : t -> bool = "ml_gtk_tree_view_get_headers_visible"

(** Set property: headers-visible *)
external set_headers_visible : t -> bool -> unit = "ml_gtk_tree_view_set_headers_visible"

(** Get property: hover-expand *)
external get_hover_expand : t -> bool = "ml_gtk_tree_view_get_hover_expand"

(** Set property: hover-expand *)
external set_hover_expand : t -> bool -> unit = "ml_gtk_tree_view_set_hover_expand"

(** Get property: hover-selection *)
external get_hover_selection : t -> bool = "ml_gtk_tree_view_get_hover_selection"

(** Set property: hover-selection *)
external set_hover_selection : t -> bool -> unit = "ml_gtk_tree_view_set_hover_selection"

(** Get property: level-indentation *)
external get_level_indentation : t -> int = "ml_gtk_tree_view_get_level_indentation"

(** Set property: level-indentation *)
external set_level_indentation : t -> int -> unit = "ml_gtk_tree_view_set_level_indentation"

(** Get property: reorderable *)
external get_reorderable : t -> bool = "ml_gtk_tree_view_get_reorderable"

(** Set property: reorderable *)
external set_reorderable : t -> bool -> unit = "ml_gtk_tree_view_set_reorderable"

(** Get property: rubber-banding *)
external get_rubber_banding : t -> bool = "ml_gtk_tree_view_get_rubber_banding"

(** Set property: rubber-banding *)
external set_rubber_banding : t -> bool -> unit = "ml_gtk_tree_view_set_rubber_banding"

(** Get property: search-column *)
external get_search_column : t -> int = "ml_gtk_tree_view_get_search_column"

(** Set property: search-column *)
external set_search_column : t -> int -> unit = "ml_gtk_tree_view_set_search_column"

(** Get property: show-expanders *)
external get_show_expanders : t -> bool = "ml_gtk_tree_view_get_show_expanders"

(** Set property: show-expanders *)
external set_show_expanders : t -> bool -> unit = "ml_gtk_tree_view_set_show_expanders"

(** Get property: tooltip-column *)
external get_tooltip_column : t -> int = "ml_gtk_tree_view_get_tooltip_column"

(** Set property: tooltip-column *)
external set_tooltip_column : t -> int -> unit = "ml_gtk_tree_view_set_tooltip_column"

external unset_rows_drag_source : t -> unit = "ml_gtk_tree_view_unset_rows_drag_source"

external unset_rows_drag_dest : t -> unit = "ml_gtk_tree_view_unset_rows_drag_dest"

external set_tooltip_row : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_tree_view_set_tooltip_row"

external set_tooltip_cell : t -> Gtk.Widget.t -> Gtk.Widget.t option -> Gtk.Widget.t option -> Gtk.Widget.t option -> unit = "ml_gtk_tree_view_set_tooltip_cell"

external set_search_equal_func : t -> unit -> unit -> unit -> unit = "ml_gtk_tree_view_set_search_equal_func"

external set_search_entry : t -> Gtk.Widget.t option -> unit = "ml_gtk_tree_view_set_search_entry"

external set_row_separator_func : t -> unit -> unit -> unit -> unit = "ml_gtk_tree_view_set_row_separator_func"

external set_model : t -> Gtk.Widget.t option -> unit = "ml_gtk_tree_view_set_model"

external set_grid_lines : t -> Gtk_enums.treeviewgridlines -> unit = "ml_gtk_tree_view_set_grid_lines"

external set_expander_column : t -> Gtk.Widget.t option -> unit = "ml_gtk_tree_view_set_expander_column"

external set_drag_dest_row : t -> Gtk.Widget.t option -> Gtk_enums.treeviewdropposition -> unit = "ml_gtk_tree_view_set_drag_dest_row"

external set_cursor_on_cell : t -> Gtk.Widget.t -> Gtk.Widget.t option -> Gtk.Widget.t option -> bool -> unit = "ml_gtk_tree_view_set_cursor_on_cell"

external set_cursor : t -> Gtk.Widget.t -> Gtk.Widget.t option -> bool -> unit = "ml_gtk_tree_view_set_cursor"

external set_column_drag_function : t -> unit -> unit -> unit -> unit = "ml_gtk_tree_view_set_column_drag_function"

external scroll_to_point : t -> int -> int -> unit = "ml_gtk_tree_view_scroll_to_point"

external scroll_to_cell : t -> Gtk.Widget.t option -> Gtk.Widget.t option -> bool -> float -> float -> unit = "ml_gtk_tree_view_scroll_to_cell_bytecode" "ml_gtk_tree_view_scroll_to_cell_native"

external row_expanded : t -> Gtk.Widget.t -> bool = "ml_gtk_tree_view_row_expanded"

external row_activated : t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit = "ml_gtk_tree_view_row_activated"

external remove_column : t -> Gtk.Widget.t -> int = "ml_gtk_tree_view_remove_column"

external move_column_after : t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit = "ml_gtk_tree_view_move_column_after"

external map_expanded_rows : t -> unit -> unit -> unit = "ml_gtk_tree_view_map_expanded_rows"

external is_rubber_banding_active : t -> bool = "ml_gtk_tree_view_is_rubber_banding_active"

external is_blank_at_pos : t -> int -> int -> Gtk.Widget.t option -> Gtk.Widget.t option -> int -> int -> bool = "ml_gtk_tree_view_is_blank_at_pos_bytecode" "ml_gtk_tree_view_is_blank_at_pos_native"

external insert_column_with_data_func : t -> int -> string -> Gtk.Widget.t -> unit -> unit -> unit -> int = "ml_gtk_tree_view_insert_column_with_data_func_bytecode" "ml_gtk_tree_view_insert_column_with_data_func_native"

external insert_column_with_attributes : t -> int -> string -> Gtk.Widget.t -> unit -> int = "ml_gtk_tree_view_insert_column_with_attributes"

external insert_column : t -> Gtk.Widget.t -> int -> int = "ml_gtk_tree_view_insert_column"

external get_visible_rect : t -> unit -> unit = "ml_gtk_tree_view_get_visible_rect"

external get_visible_range : t -> Gtk.Widget.t -> Gtk.Widget.t -> bool = "ml_gtk_tree_view_get_visible_range"

external get_tooltip_context : t -> int -> int -> bool -> Gtk.Widget.t option -> Gtk.Widget.t -> Gtk.Widget.t -> bool = "ml_gtk_tree_view_get_tooltip_context_bytecode" "ml_gtk_tree_view_get_tooltip_context_native"

external get_selection : t -> Gtk.Widget.t = "ml_gtk_tree_view_get_selection"

external get_search_entry : t -> Gtk.Widget.t = "ml_gtk_tree_view_get_search_entry"

external get_path_at_pos : t -> int -> int -> Gtk.Widget.t option -> Gtk.Widget.t option -> int -> int -> bool = "ml_gtk_tree_view_get_path_at_pos_bytecode" "ml_gtk_tree_view_get_path_at_pos_native"

external get_n_columns : t -> int = "ml_gtk_tree_view_get_n_columns"

external get_model : t -> Gtk.Widget.t = "ml_gtk_tree_view_get_model"

external get_grid_lines : t -> Gtk_enums.treeviewgridlines = "ml_gtk_tree_view_get_grid_lines"

external get_expander_column : t -> Gtk.Widget.t = "ml_gtk_tree_view_get_expander_column"

external get_drag_dest_row : t -> Gtk.Widget.t option -> Gtk.Widget.t -> unit = "ml_gtk_tree_view_get_drag_dest_row"

external get_dest_row_at_pos : t -> int -> int -> Gtk.Widget.t option -> Gtk.Widget.t -> bool = "ml_gtk_tree_view_get_dest_row_at_pos"

external get_cursor : t -> Gtk.Widget.t option -> Gtk.Widget.t option -> unit = "ml_gtk_tree_view_get_cursor"

external get_column : t -> int -> Gtk.Widget.t = "ml_gtk_tree_view_get_column"

external get_cell_area : t -> Gtk.Widget.t option -> Gtk.Widget.t option -> unit -> unit = "ml_gtk_tree_view_get_cell_area"

external get_background_area : t -> Gtk.Widget.t option -> Gtk.Widget.t option -> unit -> unit = "ml_gtk_tree_view_get_background_area"

external expand_to_path : t -> Gtk.Widget.t -> unit = "ml_gtk_tree_view_expand_to_path"

external expand_row : t -> Gtk.Widget.t -> bool -> bool = "ml_gtk_tree_view_expand_row"

external expand_all : t -> unit = "ml_gtk_tree_view_expand_all"

external enable_model_drag_source : t -> Gdk.modifiertype -> unit -> Gdk.dragaction -> unit = "ml_gtk_tree_view_enable_model_drag_source"

external enable_model_drag_dest : t -> unit -> Gdk.dragaction -> unit = "ml_gtk_tree_view_enable_model_drag_dest"

external convert_widget_to_tree_coords : t -> int -> int -> int -> int -> unit = "ml_gtk_tree_view_convert_widget_to_tree_coords"

external convert_widget_to_bin_window_coords : t -> int -> int -> int -> int -> unit = "ml_gtk_tree_view_convert_widget_to_bin_window_coords"

external convert_tree_to_widget_coords : t -> int -> int -> int -> int -> unit = "ml_gtk_tree_view_convert_tree_to_widget_coords"

external convert_tree_to_bin_window_coords : t -> int -> int -> int -> int -> unit = "ml_gtk_tree_view_convert_tree_to_bin_window_coords"

external convert_bin_window_to_widget_coords : t -> int -> int -> int -> int -> unit = "ml_gtk_tree_view_convert_bin_window_to_widget_coords"

external convert_bin_window_to_tree_coords : t -> int -> int -> int -> int -> unit = "ml_gtk_tree_view_convert_bin_window_to_tree_coords"

external columns_autosize : t -> unit = "ml_gtk_tree_view_columns_autosize"

external collapse_row : t -> Gtk.Widget.t -> bool = "ml_gtk_tree_view_collapse_row"

external collapse_all : t -> unit = "ml_gtk_tree_view_collapse_all"

external append_column : t -> Gtk.Widget.t -> int = "ml_gtk_tree_view_append_column"

