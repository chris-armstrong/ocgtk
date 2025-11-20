(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeViewColumn *)

type t = Gtk.Widget.t

(** Create a new TreeViewColumn *)
external new_ : unit -> t = "ml_gtk_tree_view_column_new"

(** Create a new TreeViewColumn *)
external new_with_area : Gtk.Widget.t -> t = "ml_gtk_tree_view_column_new_with_area"

(** Create a new TreeViewColumn *)
external new_with_attributes : string -> Gtk.Widget.t -> unit -> t = "ml_gtk_tree_view_column_new_with_attributes"

(* Properties *)

(** Get property: alignment *)
external get_alignment : t -> float = "ml_gtk_tree_view_column_get_alignment"

(** Set property: alignment *)
external set_alignment : t -> float -> unit = "ml_gtk_tree_view_column_set_alignment"

(** Get property: clickable *)
external get_clickable : t -> bool = "ml_gtk_tree_view_column_get_clickable"

(** Set property: clickable *)
external set_clickable : t -> bool -> unit = "ml_gtk_tree_view_column_set_clickable"

(** Get property: expand *)
external get_expand : t -> bool = "ml_gtk_tree_view_column_get_expand"

(** Set property: expand *)
external set_expand : t -> bool -> unit = "ml_gtk_tree_view_column_set_expand"

(** Get property: fixed-width *)
external get_fixed_width : t -> int = "ml_gtk_tree_view_column_get_fixed_width"

(** Set property: fixed-width *)
external set_fixed_width : t -> int -> unit = "ml_gtk_tree_view_column_set_fixed_width"

(** Get property: max-width *)
external get_max_width : t -> int = "ml_gtk_tree_view_column_get_max_width"

(** Set property: max-width *)
external set_max_width : t -> int -> unit = "ml_gtk_tree_view_column_set_max_width"

(** Get property: min-width *)
external get_min_width : t -> int = "ml_gtk_tree_view_column_get_min_width"

(** Set property: min-width *)
external set_min_width : t -> int -> unit = "ml_gtk_tree_view_column_set_min_width"

(** Get property: reorderable *)
external get_reorderable : t -> bool = "ml_gtk_tree_view_column_get_reorderable"

(** Set property: reorderable *)
external set_reorderable : t -> bool -> unit = "ml_gtk_tree_view_column_set_reorderable"

(** Get property: resizable *)
external get_resizable : t -> bool = "ml_gtk_tree_view_column_get_resizable"

(** Set property: resizable *)
external set_resizable : t -> bool -> unit = "ml_gtk_tree_view_column_set_resizable"

(** Get property: sort-column-id *)
external get_sort_column_id : t -> int = "ml_gtk_tree_view_column_get_sort_column_id"

(** Set property: sort-column-id *)
external set_sort_column_id : t -> int -> unit = "ml_gtk_tree_view_column_set_sort_column_id"

(** Get property: sort-indicator *)
external get_sort_indicator : t -> bool = "ml_gtk_tree_view_column_get_sort_indicator"

(** Set property: sort-indicator *)
external set_sort_indicator : t -> bool -> unit = "ml_gtk_tree_view_column_set_sort_indicator"

(** Get property: spacing *)
external get_spacing : t -> int = "ml_gtk_tree_view_column_get_spacing"

(** Set property: spacing *)
external set_spacing : t -> int -> unit = "ml_gtk_tree_view_column_set_spacing"

(** Get property: title *)
external get_title : t -> string = "ml_gtk_tree_view_column_get_title"

(** Set property: title *)
external set_title : t -> string -> unit = "ml_gtk_tree_view_column_set_title"

(** Get property: visible *)
external get_visible : t -> bool = "ml_gtk_tree_view_column_get_visible"

(** Set property: visible *)
external set_visible : t -> bool -> unit = "ml_gtk_tree_view_column_set_visible"

(** Get property: width *)
external get_width : t -> int = "ml_gtk_tree_view_column_get_width"

(** Get property: x-offset *)
external get_x_offset : t -> int = "ml_gtk_tree_view_column_get_x_offset"

external set_widget : t -> Gtk.Widget.t option -> unit = "ml_gtk_tree_view_column_set_widget"

external set_sort_order : t -> Gtk_enums.sorttype -> unit = "ml_gtk_tree_view_column_set_sort_order"

external set_sizing : t -> Gtk_enums.treeviewcolumnsizing -> unit = "ml_gtk_tree_view_column_set_sizing"

external set_cell_data_func : t -> Gtk.Widget.t -> unit -> unit -> unit -> unit = "ml_gtk_tree_view_column_set_cell_data_func"

external set_attributes : t -> Gtk.Widget.t -> unit -> unit = "ml_gtk_tree_view_column_set_attributes"

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

external cell_get_size : t -> int -> int -> int -> int -> unit = "ml_gtk_tree_view_column_cell_get_size"

external cell_get_position : t -> Gtk.Widget.t -> int -> int -> bool = "ml_gtk_tree_view_column_cell_get_position"

external add_attribute : t -> Gtk.Widget.t -> string -> int -> unit = "ml_gtk_tree_view_column_add_attribute"

