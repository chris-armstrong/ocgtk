(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

module rec Tree_selection : sig
  type t = [`tree_selection | `object_] Gobject.obj

  (* Properties *)

  (** Unselects a range of nodes, determined by @start_path and @end_path
  inclusive. *)
  external unselect_range : t -> Tree_path.t -> Tree_path.t -> unit = "ml_gtk_tree_selection_unselect_range"

  (** Unselects the row at @path. *)
  external unselect_path : t -> Tree_path.t -> unit = "ml_gtk_tree_selection_unselect_path"

  (** Unselects the specified iterator. *)
  external unselect_iter : t -> Tree_iter.t -> unit = "ml_gtk_tree_selection_unselect_iter"

  (** Unselects all the nodes. *)
  external unselect_all : t -> unit = "ml_gtk_tree_selection_unselect_all"

  (** Sets the selection mode of the @selection.  If the previous type was
  %GTK_SELECTION_MULTIPLE, then the anchor is kept selected, if it was
  previously selected. *)
  external set_mode : t -> Gtk_enums.selectionmode -> unit = "ml_gtk_tree_selection_set_mode"

  (** Selects a range of nodes, determined by @start_path and @end_path inclusive.
  @selection must be set to %GTK_SELECTION_MULTIPLE mode. *)
  external select_range : t -> Tree_path.t -> Tree_path.t -> unit = "ml_gtk_tree_selection_select_range"

  (** Select the row at @path. *)
  external select_path : t -> Tree_path.t -> unit = "ml_gtk_tree_selection_select_path"

  (** Selects the specified iterator. *)
  external select_iter : t -> Tree_iter.t -> unit = "ml_gtk_tree_selection_select_iter"

  (** Selects all the nodes. @selection must be set to %GTK_SELECTION_MULTIPLE
  mode. *)
  external select_all : t -> unit = "ml_gtk_tree_selection_select_all"

  (** Returns %TRUE if the row pointed to by @path is currently selected.  If @path
  does not point to a valid location, %FALSE is returned *)
  external path_is_selected : t -> Tree_path.t -> bool = "ml_gtk_tree_selection_path_is_selected"

  (** Returns %TRUE if the row at @iter is currently selected. *)
  external iter_is_selected : t -> Tree_iter.t -> bool = "ml_gtk_tree_selection_iter_is_selected"

  (** Returns the tree view associated with @selection. *)
  external get_tree_view : t -> Tree_view.t = "ml_gtk_tree_selection_get_tree_view"

  (** Sets @iter to the currently selected node if @selection is set to
  %GTK_SELECTION_SINGLE or %GTK_SELECTION_BROWSE.  @iter may be NULL if you
  just want to test if @selection has any selected nodes.  @model is filled
  with the current model as a convenience.  This function will not work if you
  use @selection is %GTK_SELECTION_MULTIPLE. *)
  external get_selected : t -> bool * Tree_model.t * Tree_iter.t = "ml_gtk_tree_selection_get_selected"

  (** Gets the selection mode for @selection. See
  gtk_tree_selection_set_mode(). *)
  external get_mode : t -> Gtk_enums.selectionmode = "ml_gtk_tree_selection_get_mode"

  (** Returns the number of rows that have been selected in @tree. *)
  external count_selected_rows : t -> int = "ml_gtk_tree_selection_count_selected_rows"


end

and Tree_view
 : sig
  type t = [`tree_view | `widget | `initially_unowned] Gobject.obj

  val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

  (** Create a new TreeView *)
  external new_ : unit -> t = "ml_gtk_tree_view_new"

  (** Create a new TreeView *)
  external new_with_model : Tree_model.t -> t = "ml_gtk_tree_view_new_with_model"

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
  external set_tooltip_row : t -> Tooltip.t -> Tree_path.t -> unit = "ml_gtk_tree_view_set_tooltip_row"

  (** Sets the tip area of @tooltip to the area @path, @column and @cell have
  in common.  For example if @path is %NULL and @column is set, the tip
  area will be set to the full area covered by @column.  See also
  gtk_tooltip_set_tip_area().

  Note that if @path is not specified and @cell is set and part of a column
  containing the expander, the tooltip might not show and hide at the correct
  position.  In such cases @path must be set to the current node under the
  mouse cursor for this function to operate correctly.

  See also gtk_tree_view_set_tooltip_column() for a simpler alternative. *)
  external set_tooltip_cell : t -> Tooltip.t -> Tree_path.t option -> Tree_view_column.t option -> Cell_renderer.t option -> unit = "ml_gtk_tree_view_set_tooltip_cell"

  (** Sets the entry which the interactive search code will use for this
  @tree_view.  This is useful when you want to provide a search entry
  in our interface at all time at a fixed position.  Passing %NULL for
  @entry will make the interactive search code use the built-in popup
  entry again. *)
  external set_search_entry : t -> Editable.t option -> unit = "ml_gtk_tree_view_set_search_entry"

  (** Sets the model for a `GtkTreeView`.  If the @tree_view already has a model
  set, it will remove it before setting the new model.  If @model is %NULL,
  then it will unset the old model. *)
  external set_model : t -> Tree_model.t option -> unit = "ml_gtk_tree_view_set_model"

  (** Sets which grid lines to draw in @tree_view. *)
  external set_grid_lines : t -> Gtk_enums.treeviewgridlines -> unit = "ml_gtk_tree_view_set_grid_lines"

  (** Sets the column to draw the expander arrow at. It must be in @tree_view.
  If @column is %NULL, then the expander arrow is always at the first
  visible column.

  If you do not want expander arrow to appear in your tree, set the
  expander column to a hidden column. *)
  external set_expander_column : t -> Tree_view_column.t option -> unit = "ml_gtk_tree_view_set_expander_column"

  (** Sets the row that is highlighted for feedback.
  If @path is %NULL, an existing highlight is removed. *)
  external set_drag_dest_row : t -> Tree_path.t option -> Gtk_enums.treeviewdropposition -> unit = "ml_gtk_tree_view_set_drag_dest_row"

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
  external set_cursor_on_cell : t -> Tree_path.t -> Tree_view_column.t option -> Cell_renderer.t option -> bool -> unit = "ml_gtk_tree_view_set_cursor_on_cell"

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
  external set_cursor : t -> Tree_path.t -> Tree_view_column.t option -> bool -> unit = "ml_gtk_tree_view_set_cursor"

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
  external scroll_to_cell : t -> Tree_path.t option -> Tree_view_column.t option -> bool -> float -> float -> unit = "ml_gtk_tree_view_scroll_to_cell_bytecode" "ml_gtk_tree_view_scroll_to_cell_native"

  (** Returns %TRUE if the node pointed to by @path is expanded in @tree_view. *)
  external row_expanded : t -> Tree_path.t -> bool = "ml_gtk_tree_view_row_expanded"

  (** Activates the cell determined by @path and @column. *)
  external row_activated : t -> Tree_path.t -> Tree_view_column.t option -> unit = "ml_gtk_tree_view_row_activated"

  (** Removes @column from @tree_view. *)
  external remove_column : t -> Tree_view_column.t -> int = "ml_gtk_tree_view_remove_column"

  (** Moves @column to be after to @base_column.  If @base_column is %NULL, then
  @column is placed in the first position. *)
  external move_column_after : t -> Tree_view_column.t -> Tree_view_column.t option -> unit = "ml_gtk_tree_view_move_column_after"

  (** Returns whether a rubber banding operation is currently being done
  in @tree_view. *)
  external is_rubber_banding_active : t -> bool = "ml_gtk_tree_view_is_rubber_banding_active"

  (** This inserts the @column into the @tree_view at @position.  If @position is
  -1, then the column is inserted at the end. If @tree_view has
  “fixed_height” mode enabled, then @column must have its “sizing” property
  set to be GTK_TREE_VIEW_COLUMN_FIXED. *)
  external insert_column : t -> Tree_view_column.t -> int -> int = "ml_gtk_tree_view_insert_column"

  (** Sets @start_path and @end_path to be the first and last visible path.
  Note that there may be invisible paths in between.

  The paths should be freed with gtk_tree_path_free() after use. *)
  external get_visible_range : t -> bool * Tree_path.t * Tree_path.t = "ml_gtk_tree_view_get_visible_range"

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
  external get_tooltip_context : t -> int -> int -> bool -> bool * Tree_model.t option * Tree_path.t * Tree_iter.t = "ml_gtk_tree_view_get_tooltip_context_bytecode" "ml_gtk_tree_view_get_tooltip_context_native"

  (** Gets the `GtkTreeSelection` associated with @tree_view. *)
  external get_selection : t -> Tree_selection.t = "ml_gtk_tree_view_get_selection"

  (** Returns the `GtkEntry` which is currently in use as interactive search
  entry for @tree_view.  In case the built-in entry is being used, %NULL
  will be returned. *)
  external get_search_entry : t -> Editable.t option = "ml_gtk_tree_view_get_search_entry"

  (** Queries the number of columns in the given @tree_view. *)
  external get_n_columns : t -> int = "ml_gtk_tree_view_get_n_columns"

  (** Returns the model the `GtkTreeView` is based on.  Returns %NULL if the
  model is unset. *)
  external get_model : t -> Tree_model.t option = "ml_gtk_tree_view_get_model"

  (** Returns which grid lines are enabled in @tree_view. *)
  external get_grid_lines : t -> Gtk_enums.treeviewgridlines = "ml_gtk_tree_view_get_grid_lines"

  (** Returns the column that is the current expander column,
  or %NULL if none has been set.
  This column has the expander arrow drawn next to it. *)
  external get_expander_column : t -> Tree_view_column.t option = "ml_gtk_tree_view_get_expander_column"

  (** Gets information about the row that is highlighted for feedback. *)
  external get_drag_dest_row : t -> Tree_path.t option * Gtk_enums.treeviewdropposition = "ml_gtk_tree_view_get_drag_dest_row"

  (** Determines the destination row for a given position.  @drag_x and
  @drag_y are expected to be in widget coordinates.  This function is only
  meaningful if @tree_view is realized.  Therefore this function will always
  return %FALSE if @tree_view is not realized or does not have a model. *)
  external get_dest_row_at_pos : t -> int -> int -> bool * Tree_path.t option * Gtk_enums.treeviewdropposition = "ml_gtk_tree_view_get_dest_row_at_pos"

  (** Fills in @path and @focus_column with the current path and focus column.  If
  the cursor isn’t currently set, then *@path will be %NULL.  If no column
  currently has focus, then *@focus_column will be %NULL.

  The returned `GtkTreePath` must be freed with gtk_tree_path_free() when
  you are done with it. *)
  external get_cursor : t -> Tree_path.t option * Tree_view_column.t option = "ml_gtk_tree_view_get_cursor"

  (** Gets the `GtkTreeViewColumn` at the given position in the #tree_view. *)
  external get_column : t -> int -> Tree_view_column.t option = "ml_gtk_tree_view_get_column"

  (** Expands the row at @path. This will also expand all parent rows of
  @path as necessary. *)
  external expand_to_path : t -> Tree_path.t -> unit = "ml_gtk_tree_view_expand_to_path"

  (** Opens the row so its children are visible. *)
  external expand_row : t -> Tree_path.t -> bool -> bool = "ml_gtk_tree_view_expand_row"

  (** Recursively expands all nodes in the @tree_view. *)
  external expand_all : t -> unit = "ml_gtk_tree_view_expand_all"

  (** Resizes all columns to their optimal width. Only works after the
  treeview has been realized. *)
  external columns_autosize : t -> unit = "ml_gtk_tree_view_columns_autosize"

  (** Collapses a row (hides its child rows, if they exist). *)
  external collapse_row : t -> Tree_path.t -> bool = "ml_gtk_tree_view_collapse_row"

  (** Recursively collapses all visible, expanded nodes in @tree_view. *)
  external collapse_all : t -> unit = "ml_gtk_tree_view_collapse_all"

  (** Appends @column to the list of columns. If @tree_view has “fixed_height”
  mode enabled, then @column must have its “sizing” property set to be
  GTK_TREE_VIEW_COLUMN_FIXED. *)
  external append_column : t -> Tree_view_column.t -> int = "ml_gtk_tree_view_append_column"


end
