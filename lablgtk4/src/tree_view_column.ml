(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeViewColumn *)

type t = Gtk.Widget.t

external new_ : unit -> t = "ml_gtk_tree_view_column_new"

external new_with_area : Gtk.Widget.t -> t = "ml_gtk_tree_view_column_new_with_area"

external new_with_attributes : string -> Gtk.Widget.t -> unit -> t = "ml_gtk_tree_view_column_new_with_attributes"

(* Properties *)

external get_alignment : t -> float = "ml_gtk_tree_view_column_get_alignment"

external set_alignment : t -> float -> unit = "ml_gtk_tree_view_column_set_alignment"

external get_clickable : t -> bool = "ml_gtk_tree_view_column_get_clickable"

external set_clickable : t -> bool -> unit = "ml_gtk_tree_view_column_set_clickable"

external get_expand : t -> bool = "ml_gtk_tree_view_column_get_expand"

external set_expand : t -> bool -> unit = "ml_gtk_tree_view_column_set_expand"

external get_fixed_width : t -> int = "ml_gtk_tree_view_column_get_fixed_width"

external set_fixed_width : t -> int -> unit = "ml_gtk_tree_view_column_set_fixed_width"

external get_max_width : t -> int = "ml_gtk_tree_view_column_get_max_width"

external set_max_width : t -> int -> unit = "ml_gtk_tree_view_column_set_max_width"

external get_min_width : t -> int = "ml_gtk_tree_view_column_get_min_width"

external set_min_width : t -> int -> unit = "ml_gtk_tree_view_column_set_min_width"

external get_reorderable : t -> bool = "ml_gtk_tree_view_column_get_reorderable"

external set_reorderable : t -> bool -> unit = "ml_gtk_tree_view_column_set_reorderable"

external get_resizable : t -> bool = "ml_gtk_tree_view_column_get_resizable"

external set_resizable : t -> bool -> unit = "ml_gtk_tree_view_column_set_resizable"

external get_sort_column_id : t -> int = "ml_gtk_tree_view_column_get_sort_column_id"

external set_sort_column_id : t -> int -> unit = "ml_gtk_tree_view_column_set_sort_column_id"

external get_sort_indicator : t -> bool = "ml_gtk_tree_view_column_get_sort_indicator"

external set_sort_indicator : t -> bool -> unit = "ml_gtk_tree_view_column_set_sort_indicator"

external get_spacing : t -> int = "ml_gtk_tree_view_column_get_spacing"

external set_spacing : t -> int -> unit = "ml_gtk_tree_view_column_set_spacing"

external get_title : t -> string = "ml_gtk_tree_view_column_get_title"

external set_title : t -> string -> unit = "ml_gtk_tree_view_column_set_title"

external get_visible : t -> bool = "ml_gtk_tree_view_column_get_visible"

external set_visible : t -> bool -> unit = "ml_gtk_tree_view_column_set_visible"

external get_width : t -> int = "ml_gtk_tree_view_column_get_width"

external get_x_offset : t -> int = "ml_gtk_tree_view_column_get_x_offset"

external set_widget : t -> Gtk.Widget.t option -> unit = "ml_gtk_tree_view_column_set_widget"

external set_sort_order : t -> Gtk_enums.sorttype -> unit = "ml_gtk_tree_view_column_set_sort_order"

external set_sizing : t -> Gtk_enums.treeviewcolumnsizing -> unit = "ml_gtk_tree_view_column_set_sizing"

external queue_resize : t -> unit = "ml_gtk_tree_view_column_queue_resize"

external pack_start : t -> Gtk.Widget.t -> bool -> unit = "ml_gtk_tree_view_column_pack_start"

external pack_end : t -> Gtk.Widget.t -> bool -> unit = "ml_gtk_tree_view_column_pack_end"

external get_widget : t -> Gtk.Widget.t = "ml_gtk_tree_view_column_get_widget"

external get_tree_view : t -> Gtk.Widget.t = "ml_gtk_tree_view_column_get_tree_view"

external get_sort_order : t -> Gtk_enums.sorttype = "ml_gtk_tree_view_column_get_sort_order"

external get_sizing : t -> Gtk_enums.treeviewcolumnsizing = "ml_gtk_tree_view_column_get_sizing"

external get_button : t -> Gtk.Widget.t = "ml_gtk_tree_view_column_get_button"

external focus_cell : t -> Gtk.Widget.t -> unit = "ml_gtk_tree_view_column_focus_cell"

external clicked : t -> unit = "ml_gtk_tree_view_column_clicked"

external clear_attributes : t -> Gtk.Widget.t -> unit = "ml_gtk_tree_view_column_clear_attributes"

external clear : t -> unit = "ml_gtk_tree_view_column_clear"

external cell_set_cell_data : t -> Gtk.Widget.t -> Gtk.Widget.t -> bool -> bool -> unit = "ml_gtk_tree_view_column_cell_set_cell_data"

external cell_is_visible : t -> bool = "ml_gtk_tree_view_column_cell_is_visible"

external add_attribute : t -> Gtk.Widget.t -> string -> int -> unit = "ml_gtk_tree_view_column_add_attribute"

