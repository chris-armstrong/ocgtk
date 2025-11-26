(* GENERATED CODE - DO NOT EDIT *)
(* Widget: IconView *)

type t = [`icon_view | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new IconView *)
external new_ : unit -> t = "ml_gtk_icon_view_new"

(** Create a new IconView *)
external new_with_area : Gtk.widget -> t = "ml_gtk_icon_view_new_with_area"

(** Create a new IconView *)
external new_with_model : Gtk.widget -> t = "ml_gtk_icon_view_new_with_model"

(* Properties *)

(** Undoes the effect of gtk_icon_view_enable_model_drag_source(). Calling this
method sets `GtkIconView`:reorderable to %FALSE. *)
external unset_model_drag_source : t -> unit = "ml_gtk_icon_view_unset_model_drag_source"

(** Undoes the effect of gtk_icon_view_enable_model_drag_dest(). Calling this
method sets `GtkIconView`:reorderable to %FALSE. *)
external unset_model_drag_dest : t -> unit = "ml_gtk_icon_view_unset_model_drag_dest"

(** Unselects the row at @path. *)
external unselect_path : t -> Obj.t -> unit = "ml_gtk_icon_view_unselect_path"

(** Unselects all the icons. *)
external unselect_all : t -> unit = "ml_gtk_icon_view_unselect_all"

(** Sets the tip area of @tooltip to be the area covered by the item at @path.
See also gtk_icon_view_set_tooltip_column() for a simpler alternative.
See also gtk_tooltip_set_tip_area(). *)
external set_tooltip_item : t -> Gtk.widget -> Obj.t -> unit = "ml_gtk_icon_view_set_tooltip_item"

(** If you only plan to have simple (text-only) tooltips on full items, you
can use this function to have `GtkIconView` handle these automatically
for you. @column should be set to the column in @icon_view’s model
containing the tooltip texts, or -1 to disable this feature.

When enabled, `GtkWidget:has-tooltip` will be set to %TRUE and
@icon_view will connect a `GtkWidget::query-tooltip` signal handler.

Note that the signal handler sets the text with gtk_tooltip_set_markup(),
so &, <, etc have to be escaped in the text. *)
external set_tooltip_column : t -> int -> unit = "ml_gtk_icon_view_set_tooltip_column"

(** Sets the tip area of @tooltip to the area which @cell occupies in
the item pointed to by @path. See also gtk_tooltip_set_tip_area().

See also gtk_icon_view_set_tooltip_column() for a simpler alternative. *)
external set_tooltip_cell : t -> Gtk.widget -> Obj.t -> Gtk.widget option -> unit = "ml_gtk_icon_view_set_tooltip_cell"

(** Sets the column with text for @icon_view to be @column. The text
column must be of type `G_TYPE_STRING`. *)
external set_text_column : t -> int -> unit = "ml_gtk_icon_view_set_text_column"

(** Sets the ::spacing property which specifies the space
which is inserted between the cells (i.e. the icon and
the text) of an item. *)
external set_spacing : t -> int -> unit = "ml_gtk_icon_view_set_spacing"

(** Sets the selection mode of the @icon_view. *)
external set_selection_mode : t -> Gtk_enums.selectionmode -> unit = "ml_gtk_icon_view_set_selection_mode"

(** Sets the ::row-spacing property which specifies the space
which is inserted between the rows of the icon view. *)
external set_row_spacing : t -> int -> unit = "ml_gtk_icon_view_set_row_spacing"

(** This function is a convenience function to allow you to reorder models that
support the `GtkTreeDragSourceIface` and the `GtkTreeDragDestIface`. Both
`GtkTreeStore` and `GtkListStore` support these. If @reorderable is %TRUE, then
the user can reorder the model by dragging and dropping rows.  The
developer can listen to these changes by connecting to the model's
row_inserted and row_deleted signals. The reordering is implemented by setting up
the icon view as a drag source and destination. Therefore, drag and
drop can not be used in a reorderable view for any other purpose.

This function does not give you any degree of control over the order -- any
reordering is allowed.  If more control is needed, you should probably
handle drag and drop manually. *)
external set_reorderable : t -> bool -> unit = "ml_gtk_icon_view_set_reorderable"

(** Sets the column with pixbufs for @icon_view to be @column. The pixbuf
column must be of type `GDK_TYPE_PIXBUF` *)
external set_pixbuf_column : t -> int -> unit = "ml_gtk_icon_view_set_pixbuf_column"

(** Sets the model for a `GtkIconView`.
If the @icon_view already has a model set, it will remove
it before setting the new model.  If @model is %NULL, then
it will unset the old model. *)
external set_model : t -> Gtk.widget option -> unit = "ml_gtk_icon_view_set_model"

(** Sets the column with markup information for @icon_view to be
@column. The markup column must be of type `G_TYPE_STRING`.
If the markup column is set to something, it overrides
the text column set by gtk_icon_view_set_text_column(). *)
external set_markup_column : t -> int -> unit = "ml_gtk_icon_view_set_markup_column"

(** Sets the ::margin property which specifies the space
which is inserted at the top, bottom, left and right
of the icon view. *)
external set_margin : t -> int -> unit = "ml_gtk_icon_view_set_margin"

(** Sets the ::item-width property which specifies the width
to use for each item. If it is set to -1, the icon view will
automatically determine a suitable item size. *)
external set_item_width : t -> int -> unit = "ml_gtk_icon_view_set_item_width"

(** Sets the `GtkIconView`:item-padding property which specifies the padding
around each of the icon view’s items. *)
external set_item_padding : t -> int -> unit = "ml_gtk_icon_view_set_item_padding"

(** Sets the ::item-orientation property which determines whether the labels
are drawn beside the icons instead of below. *)
external set_item_orientation : t -> Gtk_enums.orientation -> unit = "ml_gtk_icon_view_set_item_orientation"

(** Sets the item that is highlighted for feedback. *)
external set_drag_dest_item : t -> Obj.t option -> Gtk_enums.iconviewdropposition -> unit = "ml_gtk_icon_view_set_drag_dest_item"

(** Sets the current keyboard focus to be at @path, and selects it.  This is
useful when you want to focus the user’s attention on a particular item.
If @cell is not %NULL, then focus is given to the cell specified by
it. Additionally, if @start_editing is %TRUE, then editing should be
started in the specified cell.

This function is often followed by `gtk_widget_grab_focus
(icon_view)` in order to give keyboard focus to the widget.
Please note that editing can only happen when the widget is realized. *)
external set_cursor : t -> Obj.t -> Gtk.widget option -> bool -> unit = "ml_gtk_icon_view_set_cursor"

(** Sets the ::columns property which determines in how
many columns the icons are arranged. If @columns is
-1, the number of columns will be chosen automatically
to fill the available area. *)
external set_columns : t -> int -> unit = "ml_gtk_icon_view_set_columns"

(** Sets the ::column-spacing property which specifies the space
which is inserted between the columns of the icon view. *)
external set_column_spacing : t -> int -> unit = "ml_gtk_icon_view_set_column_spacing"

(** Causes the `GtkIconView`::item-activated signal to be emitted on
a single click instead of a double click. *)
external set_activate_on_single_click : t -> bool -> unit = "ml_gtk_icon_view_set_activate_on_single_click"

(** Selects the row at @path. *)
external select_path : t -> Obj.t -> unit = "ml_gtk_icon_view_select_path"

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
external scroll_to_path : t -> Obj.t -> bool -> float -> float -> unit = "ml_gtk_icon_view_scroll_to_path"

(** Returns %TRUE if the icon pointed to by @path is currently
selected. If @path does not point to a valid location, %FALSE is returned. *)
external path_is_selected : t -> Obj.t -> bool = "ml_gtk_icon_view_path_is_selected"

(** Activates the item determined by @path. *)
external item_activated : t -> Obj.t -> unit = "ml_gtk_icon_view_item_activated"

(** Sets @start_path and @end_path to be the first and last visible path.
Note that there may be invisible paths in between.

Both paths should be freed with gtk_tree_path_free() after use. *)
external get_visible_range : t -> bool * Obj.t * Obj.t = "ml_gtk_icon_view_get_visible_range"

(** This function is supposed to be used in a `GtkWidget::query-tooltip`
signal handler for `GtkIconView`. The @x, @y and @keyboard_tip values
which are received in the signal handler, should be passed to this
function without modification.

The return value indicates whether there is an icon view item at the given
coordinates (%TRUE) or not (%FALSE) for mouse tooltips. For keyboard
tooltips the item returned will be the cursor item. When %TRUE, then any of
@model, @path and @iter which have been provided will be set to point to
that row and the corresponding model. *)
external get_tooltip_context : t -> int -> int -> bool -> bool * Gtk.widget * Obj.t * Obj.t = "ml_gtk_icon_view_get_tooltip_context_bytecode" "ml_gtk_icon_view_get_tooltip_context_native"

(** Returns the column of @icon_view’s model which is being used for
displaying tooltips on @icon_view’s rows. *)
external get_tooltip_column : t -> int = "ml_gtk_icon_view_get_tooltip_column"

(** Returns the column with text for @icon_view. *)
external get_text_column : t -> int = "ml_gtk_icon_view_get_text_column"

(** Returns the value of the ::spacing property. *)
external get_spacing : t -> int = "ml_gtk_icon_view_get_spacing"

(** Gets the selection mode of the @icon_view. *)
external get_selection_mode : t -> Gtk_enums.selectionmode = "ml_gtk_icon_view_get_selection_mode"

(** Returns the value of the ::row-spacing property. *)
external get_row_spacing : t -> int = "ml_gtk_icon_view_get_row_spacing"

(** Retrieves whether the user can reorder the list via drag-and-drop.
See gtk_icon_view_set_reorderable(). *)
external get_reorderable : t -> bool = "ml_gtk_icon_view_get_reorderable"

(** Returns the column with pixbufs for @icon_view. *)
external get_pixbuf_column : t -> int = "ml_gtk_icon_view_get_pixbuf_column"

(** Gets the path for the icon at the given position. *)
external get_path_at_pos : t -> int -> int -> Obj.t option = "ml_gtk_icon_view_get_path_at_pos"

(** Returns the model the `GtkIconView` is based on.  Returns %NULL if the
model is unset. *)
external get_model : t -> Gtk.widget option = "ml_gtk_icon_view_get_model"

(** Returns the column with markup text for @icon_view. *)
external get_markup_column : t -> int = "ml_gtk_icon_view_get_markup_column"

(** Returns the value of the ::margin property. *)
external get_margin : t -> int = "ml_gtk_icon_view_get_margin"

(** Returns the value of the ::item-width property. *)
external get_item_width : t -> int = "ml_gtk_icon_view_get_item_width"

(** Gets the row in which the item @path is currently
displayed. Row numbers start at 0. *)
external get_item_row : t -> Obj.t -> int = "ml_gtk_icon_view_get_item_row"

(** Returns the value of the ::item-padding property. *)
external get_item_padding : t -> int = "ml_gtk_icon_view_get_item_padding"

(** Returns the value of the ::item-orientation property which determines
whether the labels are drawn beside the icons instead of below. *)
external get_item_orientation : t -> Gtk_enums.orientation = "ml_gtk_icon_view_get_item_orientation"

(** Gets the column in which the item @path is currently
displayed. Column numbers start at 0. *)
external get_item_column : t -> Obj.t -> int = "ml_gtk_icon_view_get_item_column"

(** Gets the path and cell for the icon at the given position. *)
external get_item_at_pos : t -> int -> int -> bool * Obj.t * Gtk.widget = "ml_gtk_icon_view_get_item_at_pos"

(** Gets information about the item that is highlighted for feedback. *)
external get_drag_dest_item : t -> Obj.t option * Gtk_enums.iconviewdropposition = "ml_gtk_icon_view_get_drag_dest_item"

(** Determines the destination item for a given position. *)
external get_dest_item_at_pos : t -> int -> int -> bool * Obj.t * Gtk_enums.iconviewdropposition = "ml_gtk_icon_view_get_dest_item_at_pos"

(** Fills in @path and @cell with the current cursor path and cell.
If the cursor isn’t currently set, then *@path will be %NULL.
If no cell currently has focus, then *@cell will be %NULL.

The returned `GtkTreePath` must be freed with gtk_tree_path_free(). *)
external get_cursor : t -> bool * Obj.t * Gtk.widget = "ml_gtk_icon_view_get_cursor"

(** Returns the value of the ::columns property. *)
external get_columns : t -> int = "ml_gtk_icon_view_get_columns"

(** Returns the value of the ::column-spacing property. *)
external get_column_spacing : t -> int = "ml_gtk_icon_view_get_column_spacing"

(** Gets the setting set by gtk_icon_view_set_activate_on_single_click(). *)
external get_activate_on_single_click : t -> bool = "ml_gtk_icon_view_get_activate_on_single_click"

