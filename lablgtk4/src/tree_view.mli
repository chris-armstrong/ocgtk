(* GENERATED CODE - DO NOT EDIT *)
(* Widget: TreeView *)

type t = [`tree_view | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new TreeView *)
external new_ : unit -> t = "ml_gtk_tree_view_new"

(** Create a new TreeView *)
external new_with_model : Gtk.widget -> t = "ml_gtk_tree_view_new_with_model"

(* Properties *)

(** Undoes the effect of
gtk_tree_view_enable_model_drag_source(). Calling this method sets
`GtkTreeView`:reorderable to %FALSE. *)
external unset_rows_drag_source : t -> unit = "ml_gtk_tree_view_unset_rows_drag_source"

(** Undoes the effect of
gtk_tree_view_enable_model_drag_dest(). Calling this method sets
`GtkTreeView`:reorderable to %FALSE. *)
external unset_rows_drag_dest : t -> unit = "ml_gtk_tree_view_unset_rows_drag_dest"

(** Sets the tip area of @tooltip to be the area covered by the row at @path.
See also gtk_tree_view_set_tooltip_column() for a simpler alternative.
See also gtk_tooltip_set_tip_area(). *)
external set_tooltip_row : t -> Gtk.widget -> Obj.t -> unit = "ml_gtk_tree_view_set_tooltip_row"

(** If you only plan to have simple (text-only) tooltips on full rows, you
can use this function to have `GtkTreeView` handle these automatically
for you. @column should be set to the column in @tree_view’s model
containing the tooltip texts, or -1 to disable this feature.

When enabled, `GtkWidget:has-tooltip` will be set to %TRUE and
@tree_view will connect a `GtkWidget::query-tooltip` signal handler.

Note that the signal handler sets the text with gtk_tooltip_set_markup(),
so &, <, etc have to be escaped in the text. *)
external set_tooltip_column : t -> int -> unit = "ml_gtk_tree_view_set_tooltip_column"

(** Sets the tip area of @tooltip to the area @path, @column and @cell have
in common.  For example if @path is %NULL and @column is set, the tip
area will be set to the full area covered by @column.  See also
gtk_tooltip_set_tip_area().

Note that if @path is not specified and @cell is set and part of a column
containing the expander, the tooltip might not show and hide at the correct
position.  In such cases @path must be set to the current node under the
mouse cursor for this function to operate correctly.

See also gtk_tree_view_set_tooltip_column() for a simpler alternative. *)
external set_tooltip_cell : t -> Gtk.widget -> Obj.t option -> Gtk.widget option -> Gtk.widget option -> unit = "ml_gtk_tree_view_set_tooltip_cell"

(** Sets whether to draw and enable expanders and indent child rows in
@tree_view.  When disabled there will be no expanders visible in trees
and there will be no way to expand and collapse rows by default.  Also
note that hiding the expanders will disable the default indentation.  You
can set a custom indentation in this case using
gtk_tree_view_set_level_indentation().
This does not have any visible effects for lists. *)
external set_show_expanders : t -> bool -> unit = "ml_gtk_tree_view_set_show_expanders"

(** Sets the entry which the interactive search code will use for this
@tree_view.  This is useful when you want to provide a search entry
in our interface at all time at a fixed position.  Passing %NULL for
@entry will make the interactive search code use the built-in popup
entry again. *)
external set_search_entry : t -> Gtk.widget option -> unit = "ml_gtk_tree_view_set_search_entry"

(** Sets @column as the column where the interactive search code should
search in for the current model.

If the search column is set, users can use the “start-interactive-search”
key binding to bring up search popup. The enable-search property controls
whether simply typing text will also start an interactive search.

Note that @column refers to a column of the current model. The search
column is reset to -1 when the model is changed. *)
external set_search_column : t -> int -> unit = "ml_gtk_tree_view_set_search_column"

(** Enables or disables rubber banding in @tree_view.  If the selection mode
is %GTK_SELECTION_MULTIPLE, rubber banding will allow the user to select
multiple rows by dragging the mouse. *)
external set_rubber_banding : t -> bool -> unit = "ml_gtk_tree_view_set_rubber_banding"

(** This function is a convenience function to allow you to reorder
models that support the `GtkTreeDragSourceIface` and the
`GtkTreeDragDestIface`.  Both `GtkTreeStore` and `GtkListStore` support
these.  If @reorderable is %TRUE, then the user can reorder the
model by dragging and dropping rows. The developer can listen to
these changes by connecting to the model’s `GtkTreeModel::row-inserted`
and `GtkTreeModel::row-deleted` signals. The reordering is implemented
by setting up the tree view as a drag source and destination.
Therefore, drag and drop can not be used in a reorderable view for any
other purpose.

This function does not give you any degree of control over the order -- any
reordering is allowed.  If more control is needed, you should probably
handle drag and drop manually. *)
external set_reorderable : t -> bool -> unit = "ml_gtk_tree_view_set_reorderable"

(** Sets the model for a `GtkTreeView`.  If the @tree_view already has a model
set, it will remove it before setting the new model.  If @model is %NULL,
then it will unset the old model. *)
external set_model : t -> Gtk.widget option -> unit = "ml_gtk_tree_view_set_model"

(** Sets the amount of extra indentation for child levels to use in @tree_view
in addition to the default indentation.  The value should be specified in
pixels, a value of 0 disables this feature and in this case only the default
indentation will be used.
This does not have any visible effects for lists. *)
external set_level_indentation : t -> int -> unit = "ml_gtk_tree_view_set_level_indentation"

(** Enables or disables the hover selection mode of @tree_view.
Hover selection makes the selected row follow the pointer.
Currently, this works only for the selection modes
%GTK_SELECTION_SINGLE and %GTK_SELECTION_BROWSE. *)
external set_hover_selection : t -> bool -> unit = "ml_gtk_tree_view_set_hover_selection"

(** Enables or disables the hover expansion mode of @tree_view.
Hover expansion makes rows expand or collapse if the pointer
moves over them. *)
external set_hover_expand : t -> bool -> unit = "ml_gtk_tree_view_set_hover_expand"

(** Sets the visibility state of the headers. *)
external set_headers_visible : t -> bool -> unit = "ml_gtk_tree_view_set_headers_visible"

(** Allow the column title buttons to be clicked. *)
external set_headers_clickable : t -> bool -> unit = "ml_gtk_tree_view_set_headers_clickable"

(** Sets which grid lines to draw in @tree_view. *)
external set_grid_lines : t -> Gtk_enums.treeviewgridlines -> unit = "ml_gtk_tree_view_set_grid_lines"

(** Enables or disables the fixed height mode of @tree_view.
Fixed height mode speeds up `GtkTreeView` by assuming that all
rows have the same height.
Only enable this option if all rows are the same height and all
columns are of type %GTK_TREE_VIEW_COLUMN_FIXED. *)
external set_fixed_height_mode : t -> bool -> unit = "ml_gtk_tree_view_set_fixed_height_mode"

(** Sets the column to draw the expander arrow at. It must be in @tree_view.
If @column is %NULL, then the expander arrow is always at the first
visible column.

If you do not want expander arrow to appear in your tree, set the
expander column to a hidden column. *)
external set_expander_column : t -> Gtk.widget option -> unit = "ml_gtk_tree_view_set_expander_column"

(** Sets whether to draw lines interconnecting the expanders in @tree_view.
This does not have any visible effects for lists. *)
external set_enable_tree_lines : t -> bool -> unit = "ml_gtk_tree_view_set_enable_tree_lines"

(** If @enable_search is set, then the user can type in text to search through
the tree interactively (this is sometimes called "typeahead find").

Note that even if this is %FALSE, the user can still initiate a search
using the “start-interactive-search” key binding. *)
external set_enable_search : t -> bool -> unit = "ml_gtk_tree_view_set_enable_search"

(** Sets the row that is highlighted for feedback.
If @path is %NULL, an existing highlight is removed. *)
external set_drag_dest_row : t -> Obj.t option -> Gtk_enums.treeviewdropposition -> unit = "ml_gtk_tree_view_set_drag_dest_row"

(** Sets the current keyboard focus to be at @path, and selects it.  This is
useful when you want to focus the user’s attention on a particular row.  If
@focus_column is not %NULL, then focus is given to the column specified by
it. If @focus_column and @focus_cell are not %NULL, and @focus_column
contains 2 or more editable or activatable cells, then focus is given to
the cell specified by @focus_cell. Additionally, if @focus_column is
specified, and @start_editing is %TRUE, then editing should be started in
the specified cell.  This function is often followed by
@gtk_widget_grab_focus (@tree_view) in order to give keyboard focus to the
widget.  Please note that editing can only happen when the widget is
realized.

If @path is invalid for @model, the current cursor (if any) will be unset
and the function will return without failing. *)
external set_cursor_on_cell : t -> Obj.t -> Gtk.widget option -> Gtk.widget option -> bool -> unit = "ml_gtk_tree_view_set_cursor_on_cell"

(** Sets the current keyboard focus to be at @path, and selects it.  This is
useful when you want to focus the user’s attention on a particular row.  If
@focus_column is not %NULL, then focus is given to the column specified by
it. Additionally, if @focus_column is specified, and @start_editing is
%TRUE, then editing should be started in the specified cell.
This function is often followed by @gtk_widget_grab_focus (@tree_view)
in order to give keyboard focus to the widget.  Please note that editing
can only happen when the widget is realized.

If @path is invalid for @model, the current cursor (if any) will be unset
and the function will return without failing. *)
external set_cursor : t -> Obj.t -> Gtk.widget option -> bool -> unit = "ml_gtk_tree_view_set_cursor"

(** Cause the `GtkTreeView`::row-activated signal to be emitted
on a single click instead of a double click. *)
external set_activate_on_single_click : t -> bool -> unit = "ml_gtk_tree_view_set_activate_on_single_click"

(** Scrolls the tree view such that the top-left corner of the visible
area is @tree_x, @tree_y, where @tree_x and @tree_y are specified
in tree coordinates.  The @tree_view must be realized before
this function is called.  If it isn't, you probably want to be
using gtk_tree_view_scroll_to_cell().

If either @tree_x or @tree_y are -1, then that direction isn’t scrolled. *)
external scroll_to_point : t -> int -> int -> unit = "ml_gtk_tree_view_scroll_to_point"

(** Moves the alignments of @tree_view to the position specified by @column and
@path.  If @column is %NULL, then no horizontal scrolling occurs.  Likewise,
if @path is %NULL no vertical scrolling occurs.  At a minimum, one of @column
or @path need to be non-%NULL.  @row_align determines where the row is
placed, and @col_align determines where @column is placed.  Both are expected
to be between 0.0 and 1.0. 0.0 means left/top alignment, 1.0 means
right/bottom alignment, 0.5 means center.

If @use_align is %FALSE, then the alignment arguments are ignored, and the
tree does the minimum amount of work to scroll the cell onto the screen.
This means that the cell will be scrolled to the edge closest to its current
position.  If the cell is currently visible on the screen, nothing is done.

This function only works if the model is set, and @path is a valid row on the
model.  If the model changes before the @tree_view is realized, the centered
path will be modified to reflect this change. *)
external scroll_to_cell : t -> Obj.t option -> Gtk.widget option -> bool -> float -> float -> unit = "ml_gtk_tree_view_scroll_to_cell_bytecode" "ml_gtk_tree_view_scroll_to_cell_native"

(** Returns %TRUE if the node pointed to by @path is expanded in @tree_view. *)
external row_expanded : t -> Obj.t -> bool = "ml_gtk_tree_view_row_expanded"

(** Activates the cell determined by @path and @column. *)
external row_activated : t -> Obj.t -> Gtk.widget option -> unit = "ml_gtk_tree_view_row_activated"

(** Removes @column from @tree_view. *)
external remove_column : t -> Gtk.widget -> int = "ml_gtk_tree_view_remove_column"

(** Moves @column to be after to @base_column.  If @base_column is %NULL, then
@column is placed in the first position. *)
external move_column_after : t -> Gtk.widget -> Gtk.widget option -> unit = "ml_gtk_tree_view_move_column_after"

(** Returns whether a rubber banding operation is currently being done
in @tree_view. *)
external is_rubber_banding_active : t -> bool = "ml_gtk_tree_view_is_rubber_banding_active"

(** This inserts the @column into the @tree_view at @position.  If @position is
-1, then the column is inserted at the end. If @tree_view has
“fixed_height” mode enabled, then @column must have its “sizing” property
set to be GTK_TREE_VIEW_COLUMN_FIXED. *)
external insert_column : t -> Gtk.widget -> int -> int = "ml_gtk_tree_view_insert_column"

(** Sets @start_path and @end_path to be the first and last visible path.
Note that there may be invisible paths in between.

The paths should be freed with gtk_tree_path_free() after use. *)
external get_visible_range : t -> bool * Obj.t * Obj.t = "ml_gtk_tree_view_get_visible_range"

(** This function is supposed to be used in a ::query-tooltip
signal handler for `GtkTreeView`. The @x, @y and @keyboard_tip values
which are received in the signal handler, should be passed to this
function without modification.

The return value indicates whether there is a tree view row at the given
coordinates (%TRUE) or not (%FALSE) for mouse tooltips. For keyboard
tooltips the row returned will be the cursor row. When %TRUE, then any of
@model, @path and @iter which have been provided will be set to point to
that row and the corresponding model. @x and @y will always be converted
to be relative to @tree_view’s bin_window if @keyboard_tooltip is %FALSE. *)
external get_tooltip_context : t -> int -> int -> bool -> bool * Gtk.widget option * Obj.t * Obj.t = "ml_gtk_tree_view_get_tooltip_context_bytecode" "ml_gtk_tree_view_get_tooltip_context_native"

(** Returns the column of @tree_view’s model which is being used for
displaying tooltips on @tree_view’s rows. *)
external get_tooltip_column : t -> int = "ml_gtk_tree_view_get_tooltip_column"

(** Returns whether or not expanders are drawn in @tree_view. *)
external get_show_expanders : t -> bool = "ml_gtk_tree_view_get_show_expanders"

(** Gets the `GtkTreeSelection` associated with @tree_view. *)
external get_selection : t -> Gtk.widget = "ml_gtk_tree_view_get_selection"

(** Returns the `GtkEntry` which is currently in use as interactive search
entry for @tree_view.  In case the built-in entry is being used, %NULL
will be returned. *)
external get_search_entry : t -> Gtk.widget option = "ml_gtk_tree_view_get_search_entry"

(** Gets the column searched on by the interactive search code. *)
external get_search_column : t -> int = "ml_gtk_tree_view_get_search_column"

(** Returns whether rubber banding is turned on for @tree_view.  If the
selection mode is %GTK_SELECTION_MULTIPLE, rubber banding will allow the
user to select multiple rows by dragging the mouse. *)
external get_rubber_banding : t -> bool = "ml_gtk_tree_view_get_rubber_banding"

(** Retrieves whether the user can reorder the tree via drag-and-drop. See
gtk_tree_view_set_reorderable(). *)
external get_reorderable : t -> bool = "ml_gtk_tree_view_get_reorderable"

(** Queries the number of columns in the given @tree_view. *)
external get_n_columns : t -> int = "ml_gtk_tree_view_get_n_columns"

(** Returns the model the `GtkTreeView` is based on.  Returns %NULL if the
model is unset. *)
external get_model : t -> Gtk.widget option = "ml_gtk_tree_view_get_model"

(** Returns the amount, in pixels, of extra indentation for child levels
in @tree_view. *)
external get_level_indentation : t -> int = "ml_gtk_tree_view_get_level_indentation"

(** Returns whether hover selection mode is turned on for @tree_view. *)
external get_hover_selection : t -> bool = "ml_gtk_tree_view_get_hover_selection"

(** Returns whether hover expansion mode is turned on for @tree_view. *)
external get_hover_expand : t -> bool = "ml_gtk_tree_view_get_hover_expand"

(** Returns %TRUE if the headers on the @tree_view are visible. *)
external get_headers_visible : t -> bool = "ml_gtk_tree_view_get_headers_visible"

(** Returns whether all header columns are clickable. *)
external get_headers_clickable : t -> bool = "ml_gtk_tree_view_get_headers_clickable"

(** Returns which grid lines are enabled in @tree_view. *)
external get_grid_lines : t -> Gtk_enums.treeviewgridlines = "ml_gtk_tree_view_get_grid_lines"

(** Returns whether fixed height mode is turned on for @tree_view. *)
external get_fixed_height_mode : t -> bool = "ml_gtk_tree_view_get_fixed_height_mode"

(** Returns the column that is the current expander column,
or %NULL if none has been set.
This column has the expander arrow drawn next to it. *)
external get_expander_column : t -> Gtk.widget option = "ml_gtk_tree_view_get_expander_column"

(** Returns whether or not tree lines are drawn in @tree_view. *)
external get_enable_tree_lines : t -> bool = "ml_gtk_tree_view_get_enable_tree_lines"

(** Returns whether or not the tree allows to start interactive searching
by typing in text. *)
external get_enable_search : t -> bool = "ml_gtk_tree_view_get_enable_search"

(** Gets information about the row that is highlighted for feedback. *)
external get_drag_dest_row : t -> Obj.t option * Gtk_enums.treeviewdropposition = "ml_gtk_tree_view_get_drag_dest_row"

(** Determines the destination row for a given position.  @drag_x and
@drag_y are expected to be in widget coordinates.  This function is only
meaningful if @tree_view is realized.  Therefore this function will always
return %FALSE if @tree_view is not realized or does not have a model. *)
external get_dest_row_at_pos : t -> int -> int -> bool * Obj.t option * Gtk_enums.treeviewdropposition = "ml_gtk_tree_view_get_dest_row_at_pos"

(** Fills in @path and @focus_column with the current path and focus column.  If
the cursor isn’t currently set, then *@path will be %NULL.  If no column
currently has focus, then *@focus_column will be %NULL.

The returned `GtkTreePath` must be freed with gtk_tree_path_free() when
you are done with it. *)
external get_cursor : t -> Obj.t option * Gtk.widget option = "ml_gtk_tree_view_get_cursor"

(** Gets the `GtkTreeViewColumn` at the given position in the #tree_view. *)
external get_column : t -> int -> Gtk.widget option = "ml_gtk_tree_view_get_column"

(** Gets the setting set by gtk_tree_view_set_activate_on_single_click(). *)
external get_activate_on_single_click : t -> bool = "ml_gtk_tree_view_get_activate_on_single_click"

(** Expands the row at @path. This will also expand all parent rows of
@path as necessary. *)
external expand_to_path : t -> Obj.t -> unit = "ml_gtk_tree_view_expand_to_path"

(** Opens the row so its children are visible. *)
external expand_row : t -> Obj.t -> bool -> bool = "ml_gtk_tree_view_expand_row"

(** Recursively expands all nodes in the @tree_view. *)
external expand_all : t -> unit = "ml_gtk_tree_view_expand_all"

(** Resizes all columns to their optimal width. Only works after the
treeview has been realized. *)
external columns_autosize : t -> unit = "ml_gtk_tree_view_columns_autosize"

(** Collapses a row (hides its child rows, if they exist). *)
external collapse_row : t -> Obj.t -> bool = "ml_gtk_tree_view_collapse_row"

(** Recursively collapses all visible, expanded nodes in @tree_view. *)
external collapse_all : t -> unit = "ml_gtk_tree_view_collapse_all"

(** Appends @column to the list of columns. If @tree_view has “fixed_height”
mode enabled, then @column must have its “sizing” property set to be
GTK_TREE_VIEW_COLUMN_FIXED. *)
external append_column : t -> Gtk.widget -> int = "ml_gtk_tree_view_append_column"

