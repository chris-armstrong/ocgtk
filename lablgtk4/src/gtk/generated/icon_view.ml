(* GENERATED CODE - DO NOT EDIT *)
(* Widget: IconView *)

type t = [`icon_view | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new IconView *)
external new_ : unit -> t = "ml_gtk_icon_view_new"

(** Create a new IconView *)
external new_with_area : Cell_area_and__cell_area_context.Cell_area.t -> t = "ml_gtk_icon_view_new_with_area"

(** Create a new IconView *)
external new_with_model : Tree_model.t -> t = "ml_gtk_icon_view_new_with_model"

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

(** Undoes the effect of gtk_icon_view_enable_model_drag_source(). Calling this
method sets `GtkIconView`:reorderable to %FALSE. *)
external unset_model_drag_source : t -> unit = "ml_gtk_icon_view_unset_model_drag_source"

(** Undoes the effect of gtk_icon_view_enable_model_drag_dest(). Calling this
method sets `GtkIconView`:reorderable to %FALSE. *)
external unset_model_drag_dest : t -> unit = "ml_gtk_icon_view_unset_model_drag_dest"

(** Unselects the row at @path. *)
external unselect_path : t -> Tree_path.t -> unit = "ml_gtk_icon_view_unselect_path"

(** Unselects all the icons. *)
external unselect_all : t -> unit = "ml_gtk_icon_view_unselect_all"

(** Sets the tip area of @tooltip to be the area covered by the item at @path.
See also gtk_icon_view_set_tooltip_column() for a simpler alternative.
See also gtk_tooltip_set_tip_area(). *)
external set_tooltip_item : t -> Tooltip.t -> Tree_path.t -> unit = "ml_gtk_icon_view_set_tooltip_item"

(** Sets the tip area of @tooltip to the area which @cell occupies in
the item pointed to by @path. See also gtk_tooltip_set_tip_area().

See also gtk_icon_view_set_tooltip_column() for a simpler alternative. *)
external set_tooltip_cell : t -> Tooltip.t -> Tree_path.t -> Cell_renderer.t option -> unit = "ml_gtk_icon_view_set_tooltip_cell"

(** Sets the selection mode of the @icon_view. *)
external set_selection_mode : t -> Gtk_enums.selectionmode -> unit = "ml_gtk_icon_view_set_selection_mode"

(** Sets the model for a `GtkIconView`.
If the @icon_view already has a model set, it will remove
it before setting the new model.  If @model is %NULL, then
it will unset the old model. *)
external set_model : t -> Tree_model.t option -> unit = "ml_gtk_icon_view_set_model"

(** Sets the ::item-orientation property which determines whether the labels
are drawn beside the icons instead of below. *)
external set_item_orientation : t -> Gtk_enums.orientation -> unit = "ml_gtk_icon_view_set_item_orientation"

(** Sets the item that is highlighted for feedback. *)
external set_drag_dest_item : t -> Tree_path.t option -> Gtk_enums.iconviewdropposition -> unit = "ml_gtk_icon_view_set_drag_dest_item"

(** Sets the current keyboard focus to be at @path, and selects it.  This is
useful when you want to focus the user’s attention on a particular item.
If @cell is not %NULL, then focus is given to the cell specified by
it. Additionally, if @start_editing is %TRUE, then editing should be
started in the specified cell.

This function is often followed by `gtk_widget_grab_focus
(icon_view)` in order to give keyboard focus to the widget.
Please note that editing can only happen when the widget is realized. *)
external set_cursor : t -> Tree_path.t -> Cell_renderer.t option -> bool -> unit = "ml_gtk_icon_view_set_cursor"

(** Selects the row at @path. *)
external select_path : t -> Tree_path.t -> unit = "ml_gtk_icon_view_select_path"

(** Selects all the icons. @icon_view must has its selection mode set
to %GTK_SELECTION_MULTIPLE. *)
external select_all : t -> unit = "ml_gtk_icon_view_select_all"

(** Moves the alignments of @icon_view to the position specified by @path.
@row_align determines where the row is placed, and @col_align determines
where @column is placed.  Both are expected to be between 0.0 and 1.0.
0.0 means left/top alignment, 1.0 means right/bottom alignment, 0.5 means
center.

If @use_align is %FALSE, then the alignment arguments are ignored, and the
tree does the minimum amount of work to scroll the item onto the screen.
This means that the item will be scrolled to the edge closest to its current
position.  If the item is currently visible on the screen, nothing is done.

This function only works if the model is set, and @path is a valid row on
the model. If the model changes before the @icon_view is realized, the
centered path will be modified to reflect this change. *)
external scroll_to_path : t -> Tree_path.t -> bool -> float -> float -> unit = "ml_gtk_icon_view_scroll_to_path"

(** Returns %TRUE if the icon pointed to by @path is currently
selected. If @path does not point to a valid location, %FALSE is returned. *)
external path_is_selected : t -> Tree_path.t -> bool = "ml_gtk_icon_view_path_is_selected"

(** Activates the item determined by @path. *)
external item_activated : t -> Tree_path.t -> unit = "ml_gtk_icon_view_item_activated"

(** Sets @start_path and @end_path to be the first and last visible path.
Note that there may be invisible paths in between.

Both paths should be freed with gtk_tree_path_free() after use. *)
external get_visible_range : t -> bool * Tree_path.t * Tree_path.t = "ml_gtk_icon_view_get_visible_range"

(** This function is supposed to be used in a `GtkWidget::query-tooltip`
signal handler for `GtkIconView`. The @x, @y and @keyboard_tip values
which are received in the signal handler, should be passed to this
function without modification.

The return value indicates whether there is an icon view item at the given
coordinates (%TRUE) or not (%FALSE) for mouse tooltips. For keyboard
tooltips the item returned will be the cursor item. When %TRUE, then any of
@model, @path and @iter which have been provided will be set to point to
that row and the corresponding model. *)
external get_tooltip_context : t -> int -> int -> bool -> bool * Tree_model.t * Tree_path.t * Tree_iter.t = "ml_gtk_icon_view_get_tooltip_context_bytecode" "ml_gtk_icon_view_get_tooltip_context_native"

(** Gets the selection mode of the @icon_view. *)
external get_selection_mode : t -> Gtk_enums.selectionmode = "ml_gtk_icon_view_get_selection_mode"

(** Gets the path for the icon at the given position. *)
external get_path_at_pos : t -> int -> int -> Tree_path.t option = "ml_gtk_icon_view_get_path_at_pos"

(** Returns the model the `GtkIconView` is based on.  Returns %NULL if the
model is unset. *)
external get_model : t -> Tree_model.t option = "ml_gtk_icon_view_get_model"

(** Gets the row in which the item @path is currently
displayed. Row numbers start at 0. *)
external get_item_row : t -> Tree_path.t -> int = "ml_gtk_icon_view_get_item_row"

(** Returns the value of the ::item-orientation property which determines
whether the labels are drawn beside the icons instead of below. *)
external get_item_orientation : t -> Gtk_enums.orientation = "ml_gtk_icon_view_get_item_orientation"

(** Gets the column in which the item @path is currently
displayed. Column numbers start at 0. *)
external get_item_column : t -> Tree_path.t -> int = "ml_gtk_icon_view_get_item_column"

(** Gets the path and cell for the icon at the given position. *)
external get_item_at_pos : t -> int -> int -> bool * Tree_path.t * Cell_renderer.t = "ml_gtk_icon_view_get_item_at_pos"

(** Gets information about the item that is highlighted for feedback. *)
external get_drag_dest_item : t -> Tree_path.t option * Gtk_enums.iconviewdropposition = "ml_gtk_icon_view_get_drag_dest_item"

(** Determines the destination item for a given position. *)
external get_dest_item_at_pos : t -> int -> int -> bool * Tree_path.t * Gtk_enums.iconviewdropposition = "ml_gtk_icon_view_get_dest_item_at_pos"

(** Fills in @path and @cell with the current cursor path and cell.
If the cursor isn’t currently set, then *@path will be %NULL.
If no cell currently has focus, then *@cell will be %NULL.

The returned `GtkTreePath` must be freed with gtk_tree_path_free(). *)
external get_cursor : t -> bool * Tree_path.t * Cell_renderer.t = "ml_gtk_icon_view_get_cursor"

