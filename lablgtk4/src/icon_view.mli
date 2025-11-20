(* GENERATED CODE - DO NOT EDIT *)
(* Widget: IconView *)

type t = Gtk.Widget.t

(** Create a new IconView *)
external new_ : unit -> t = "ml_gtk_icon_view_new"

(** Create a new IconView *)
external new_with_area : Gtk.Widget.t -> t = "ml_gtk_icon_view_new_with_area"

(** Create a new IconView *)
external new_with_model : Gtk.Widget.t -> t = "ml_gtk_icon_view_new_with_model"

(* Properties *)

(** Get property: activate-on-single-click *)
external get_activate_on_single_click : t -> bool = "ml_gtk_icon_view_get_activate_on_single_click"

(** Set property: activate-on-single-click *)
external set_activate_on_single_click : t -> bool -> unit = "ml_gtk_icon_view_set_activate_on_single_click"

(** Get property: column-spacing *)
external get_column_spacing : t -> int = "ml_gtk_icon_view_get_column_spacing"

(** Set property: column-spacing *)
external set_column_spacing : t -> int -> unit = "ml_gtk_icon_view_set_column_spacing"

(** Get property: columns *)
external get_columns : t -> int = "ml_gtk_icon_view_get_columns"

(** Set property: columns *)
external set_columns : t -> int -> unit = "ml_gtk_icon_view_set_columns"

(** Get property: item-padding *)
external get_item_padding : t -> int = "ml_gtk_icon_view_get_item_padding"

(** Set property: item-padding *)
external set_item_padding : t -> int -> unit = "ml_gtk_icon_view_set_item_padding"

(** Get property: item-width *)
external get_item_width : t -> int = "ml_gtk_icon_view_get_item_width"

(** Set property: item-width *)
external set_item_width : t -> int -> unit = "ml_gtk_icon_view_set_item_width"

(** Get property: margin *)
external get_margin : t -> int = "ml_gtk_icon_view_get_margin"

(** Set property: margin *)
external set_margin : t -> int -> unit = "ml_gtk_icon_view_set_margin"

(** Get property: markup-column *)
external get_markup_column : t -> int = "ml_gtk_icon_view_get_markup_column"

(** Set property: markup-column *)
external set_markup_column : t -> int -> unit = "ml_gtk_icon_view_set_markup_column"

(** Get property: pixbuf-column *)
external get_pixbuf_column : t -> int = "ml_gtk_icon_view_get_pixbuf_column"

(** Set property: pixbuf-column *)
external set_pixbuf_column : t -> int -> unit = "ml_gtk_icon_view_set_pixbuf_column"

(** Get property: reorderable *)
external get_reorderable : t -> bool = "ml_gtk_icon_view_get_reorderable"

(** Set property: reorderable *)
external set_reorderable : t -> bool -> unit = "ml_gtk_icon_view_set_reorderable"

(** Get property: row-spacing *)
external get_row_spacing : t -> int = "ml_gtk_icon_view_get_row_spacing"

(** Set property: row-spacing *)
external set_row_spacing : t -> int -> unit = "ml_gtk_icon_view_set_row_spacing"

(** Get property: spacing *)
external get_spacing : t -> int = "ml_gtk_icon_view_get_spacing"

(** Set property: spacing *)
external set_spacing : t -> int -> unit = "ml_gtk_icon_view_set_spacing"

(** Get property: text-column *)
external get_text_column : t -> int = "ml_gtk_icon_view_get_text_column"

(** Set property: text-column *)
external set_text_column : t -> int -> unit = "ml_gtk_icon_view_set_text_column"

(** Get property: tooltip-column *)
external get_tooltip_column : t -> int = "ml_gtk_icon_view_get_tooltip_column"

(** Set property: tooltip-column *)
external set_tooltip_column : t -> int -> unit = "ml_gtk_icon_view_set_tooltip_column"

external unset_model_drag_source : t -> unit = "ml_gtk_icon_view_unset_model_drag_source"

external unset_model_drag_dest : t -> unit = "ml_gtk_icon_view_unset_model_drag_dest"

external unselect_path : t -> Gtk.Widget.t -> unit = "ml_gtk_icon_view_unselect_path"

external unselect_all : t -> unit = "ml_gtk_icon_view_unselect_all"

external set_tooltip_item : t -> Gtk.Widget.t -> Gtk.Widget.t -> unit = "ml_gtk_icon_view_set_tooltip_item"

external set_tooltip_cell : t -> Gtk.Widget.t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit = "ml_gtk_icon_view_set_tooltip_cell"

external set_selection_mode : t -> Gtk_enums.selectionmode -> unit = "ml_gtk_icon_view_set_selection_mode"

external set_model : t -> Gtk.Widget.t option -> unit = "ml_gtk_icon_view_set_model"

external set_item_orientation : t -> Gtk_enums.orientation -> unit = "ml_gtk_icon_view_set_item_orientation"

external set_drag_dest_item : t -> Gtk.Widget.t option -> Gtk_enums.iconviewdropposition -> unit = "ml_gtk_icon_view_set_drag_dest_item"

external set_cursor : t -> Gtk.Widget.t -> Gtk.Widget.t option -> bool -> unit = "ml_gtk_icon_view_set_cursor"

external selected_foreach : t -> unit -> unit -> unit = "ml_gtk_icon_view_selected_foreach"

external select_path : t -> Gtk.Widget.t -> unit = "ml_gtk_icon_view_select_path"

external select_all : t -> unit = "ml_gtk_icon_view_select_all"

external scroll_to_path : t -> Gtk.Widget.t -> bool -> float -> float -> unit = "ml_gtk_icon_view_scroll_to_path"

external path_is_selected : t -> Gtk.Widget.t -> bool = "ml_gtk_icon_view_path_is_selected"

external item_activated : t -> Gtk.Widget.t -> unit = "ml_gtk_icon_view_item_activated"

external get_visible_range : t -> Gtk.Widget.t -> Gtk.Widget.t -> bool = "ml_gtk_icon_view_get_visible_range"

external get_tooltip_context : t -> int -> int -> bool -> Gtk.Widget.t -> Gtk.Widget.t -> Gtk.Widget.t -> bool = "ml_gtk_icon_view_get_tooltip_context_bytecode" "ml_gtk_icon_view_get_tooltip_context_native"

external get_selection_mode : t -> Gtk_enums.selectionmode = "ml_gtk_icon_view_get_selection_mode"

external get_path_at_pos : t -> int -> int -> Gtk.Widget.t = "ml_gtk_icon_view_get_path_at_pos"

external get_model : t -> Gtk.Widget.t = "ml_gtk_icon_view_get_model"

external get_item_row : t -> Gtk.Widget.t -> int = "ml_gtk_icon_view_get_item_row"

external get_item_orientation : t -> Gtk_enums.orientation = "ml_gtk_icon_view_get_item_orientation"

external get_item_column : t -> Gtk.Widget.t -> int = "ml_gtk_icon_view_get_item_column"

external get_item_at_pos : t -> int -> int -> Gtk.Widget.t -> Gtk.Widget.t -> bool = "ml_gtk_icon_view_get_item_at_pos"

external get_drag_dest_item : t -> Gtk.Widget.t option -> Gtk.Widget.t -> unit = "ml_gtk_icon_view_get_drag_dest_item"

external get_dest_item_at_pos : t -> int -> int -> Gtk.Widget.t -> Gtk.Widget.t -> bool = "ml_gtk_icon_view_get_dest_item_at_pos"

external get_cursor : t -> Gtk.Widget.t -> Gtk.Widget.t -> bool = "ml_gtk_icon_view_get_cursor"

external get_cell_rect : t -> Gtk.Widget.t -> Gtk.Widget.t option -> unit -> bool = "ml_gtk_icon_view_get_cell_rect"

external enable_model_drag_source : t -> Gdk.modifiertype -> unit -> Gdk.dragaction -> unit = "ml_gtk_icon_view_enable_model_drag_source"

external enable_model_drag_dest : t -> unit -> Gdk.dragaction -> unit = "ml_gtk_icon_view_enable_model_drag_dest"

