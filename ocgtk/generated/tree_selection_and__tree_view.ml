(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type tree_selection_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted whenever the selection has (possibly) changed. Please note that
      this signal is mostly a hint. It may only be emitted once when a range of
      rows are selected, and it may occasionally be emitted when nothing has
      happened. *)

  method count_selected_rows : unit -> int
  (** Returns the number of rows that have been selected in [tree]. *)

  method get_mode : unit -> Enums.selectionmode
  (** Gets the selection mode for [selection]. See
      gtk_tree_selection_set_mode(). *)

  method get_tree_view : unit -> tree_view_t
  (** Returns the tree view associated with [selection]. *)

  method iter_is_selected : Raw.Tree_iter.t -> bool
  (** Returns [TRUE] if the row at [iter] is currently selected. *)

  method path_is_selected : Raw.Tree_path.t -> bool
  (** Returns [TRUE] if the row pointed to by [path] is currently selected. If
      [path] does not point to a valid location, [FALSE] is returned *)

  method select_all : unit -> unit
  (** Selects all the nodes. [selection] must be set to [GTK_SELECTION_MULTIPLE]
      mode. *)

  method select_iter : Raw.Tree_iter.t -> unit
  (** Selects the specified iterator. *)

  method select_path : Raw.Tree_path.t -> unit
  (** Select the row at [path]. *)

  method select_range : Raw.Tree_path.t -> Raw.Tree_path.t -> unit
  (** Selects a range of nodes, determined by [start_path] and [end_path]
      inclusive. [selection] must be set to [GTK_SELECTION_MULTIPLE] mode. *)

  method set_mode : Enums.selectionmode -> unit
  (** Sets the selection mode of the [selection]. If the previous type was
      [GTK_SELECTION_MULTIPLE], then the anchor is kept selected, if it was
      previously selected. *)

  method unselect_all : unit -> unit
  (** Unselects all the nodes. *)

  method unselect_iter : Raw.Tree_iter.t -> unit
  (** Unselects the specified iterator. *)

  method unselect_path : Raw.Tree_path.t -> unit
  (** Unselects the row at [path]. *)

  method unselect_range : Raw.Tree_path.t -> Raw.Tree_path.t -> unit
  (** Unselects a range of nodes, determined by [start_path] and [end_path]
      inclusive. *)

  method as_tree_selection : Raw.Tree_selection.t
end

and tree_view_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Scrollable.scrollable_t

  method on_columns_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** The number of columns of the treeview has changed. *)

  method on_cursor_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** The position of the cursor (focused cell) has changed. *)

  method on_expand_collapse_cursor_row :
    ?after:bool ->
    callback:(object_:bool -> p0:bool -> p1:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_move_cursor :
    ?after:bool ->
    callback:
      (step:Enums.movementstep ->
      direction:int ->
      extend:bool ->
      modify:bool ->
      bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** The [GtkTreeView]::move-cursor signal is a \[keybinding
      signal\][Gtk.SignalAction] which gets emitted when the user presses one of
      the cursor keys.

      Applications should not connect to it, but may emit it with
      g_signal_emit_by_name() if they need to control the cursor
      programmatically. In contrast to gtk_tree_view_set_cursor() and
      gtk_tree_view_set_cursor_on_cell() when moving horizontally
      [GtkTreeView]::move-cursor does not reset the current selection. *)

  method on_select_all :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method on_select_cursor_parent :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method on_select_cursor_row :
    ?after:bool ->
    callback:(object_:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_start_interactive_search :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method on_toggle_cursor_row :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method on_unselect_all :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method append_column : Tree_view_column.tree_view_column_t -> int
  (** Appends [column] to the list of columns. If [tree_view] has “fixed_height”
      mode enabled, then [column] must have its “sizing” property set to be
      GTK_TREE_VIEW_COLUMN_FIXED. *)

  method collapse_all : unit -> unit
  (** Recursively collapses all visible, expanded nodes in [tree_view]. *)

  method collapse_row : Raw.Tree_path.t -> bool
  (** Collapses a row (hides its child rows, if they exist). *)

  method columns_autosize : unit -> unit
  (** Resizes all columns to their optimal width. Only works after the treeview
      has been realized. *)

  method create_row_drag_icon :
    Raw.Tree_path.t -> Ocgdk.Paintable.paintable_t option
  (** Creates a [cairo_surface_t] representation of the row at [path]. This
      image is used for a drag icon. *)

  method enable_model_drag_dest :
    Ocgdk.Content_formats.content_formats_t -> Ocgdk.Enums.dragaction -> unit
  (** Turns [tree_view] into a drop destination for automatic DND. Calling this
      method sets [GtkTreeView]:reorderable to [FALSE]. *)

  method enable_model_drag_source :
    Ocgdk.Enums.modifiertype ->
    Ocgdk.Content_formats.content_formats_t ->
    Ocgdk.Enums.dragaction ->
    unit
  (** Turns [tree_view] into a drag source for automatic DND. Calling this
      method sets [GtkTreeView]:reorderable to [FALSE]. *)

  method expand_all : unit -> unit
  (** Recursively expands all nodes in the [tree_view]. *)

  method expand_row : Raw.Tree_path.t -> bool -> bool
  (** Opens the row so its children are visible. *)

  method expand_to_path : Raw.Tree_path.t -> unit
  (** Expands the row at [path]. This will also expand all parent rows of [path]
      as necessary. *)

  method get_activate_on_single_click : unit -> bool
  (** Gets the setting set by gtk_tree_view_set_activate_on_single_click(). *)

  method get_column : int -> Tree_view_column.tree_view_column_t option
  (** Gets the [GtkTreeViewColumn] at the given position in the #tree_view. *)

  method get_columns : unit -> Tree_view_column.tree_view_column_t list
  (** Returns a [GList] of all the [GtkTreeViewColumn]s currently in
      [tree_view]. The returned list must be freed with g_list_free (). *)

  method get_enable_search : unit -> bool
  (** Returns whether or not the tree allows to start interactive searching by
      typing in text. *)

  method get_enable_tree_lines : unit -> bool
  (** Returns whether or not tree lines are drawn in [tree_view]. *)

  method get_expander_column :
    unit -> Tree_view_column.tree_view_column_t option
  (** Returns the column that is the current expander column, or [NULL] if none
      has been set. This column has the expander arrow drawn next to it. *)

  method get_fixed_height_mode : unit -> bool
  (** Returns whether fixed height mode is turned on for [tree_view]. *)

  method get_grid_lines : unit -> Enums.treeviewgridlines
  (** Returns which grid lines are enabled in [tree_view]. *)

  method get_headers_clickable : unit -> bool
  (** Returns whether all header columns are clickable. *)

  method get_headers_visible : unit -> bool
  (** Returns [TRUE] if the headers on the [tree_view] are visible. *)

  method get_hover_expand : unit -> bool
  (** Returns whether hover expansion mode is turned on for [tree_view]. *)

  method get_hover_selection : unit -> bool
  (** Returns whether hover selection mode is turned on for [tree_view]. *)

  method get_level_indentation : unit -> int
  (** Returns the amount, in pixels, of extra indentation for child levels in
      [tree_view]. *)

  method get_model : unit -> Tree_model.tree_model_t option
  (** Returns the model the [GtkTreeView] is based on. Returns [NULL] if the
      model is unset. *)

  method get_n_columns : unit -> int
  (** Queries the number of columns in the given [tree_view]. *)

  method get_reorderable : unit -> bool
  (** Retrieves whether the user can reorder the tree via drag-and-drop. See
      gtk_tree_view_set_reorderable(). *)

  method get_rubber_banding : unit -> bool
  (** Returns whether rubber banding is turned on for [tree_view]. If the
      selection mode is [GTK_SELECTION_MULTIPLE], rubber banding will allow the
      user to select multiple rows by dragging the mouse. *)

  method get_search_column : unit -> int
  (** Gets the column searched on by the interactive search code. *)

  method get_search_entry : unit -> Editable.editable_t option
  (** Returns the [GtkEntry] which is currently in use as interactive search
      entry for [tree_view]. In case the built-in entry is being used, [NULL]
      will be returned. *)

  method get_selection : unit -> tree_selection_t
  (** Gets the [GtkTreeSelection] associated with [tree_view]. *)

  method get_show_expanders : unit -> bool
  (** Returns whether or not expanders are drawn in [tree_view]. *)

  method get_tooltip_column : unit -> int
  (** Returns the column of [tree_view]’s model which is being used for
      displaying tooltips on [tree_view]’s rows. *)

  method insert_column : Tree_view_column.tree_view_column_t -> int -> int
  (** This inserts the [column] into the [tree_view] at [position]. If
      [position] is -1, then the column is inserted at the end. If [tree_view]
      has “fixed_height” mode enabled, then [column] must have its “sizing”
      property set to be GTK_TREE_VIEW_COLUMN_FIXED. *)

  method is_rubber_banding_active : unit -> bool
  (** Returns whether a rubber banding operation is currently being done in
      [tree_view]. *)

  method move_column_after :
    Tree_view_column.tree_view_column_t ->
    Tree_view_column.tree_view_column_t option ->
    unit
  (** Moves [column] to be after to [base_column]. If [base_column] is [NULL],
      then [column] is placed in the first position. *)

  method remove_column : Tree_view_column.tree_view_column_t -> int
  (** Removes [column] from [tree_view]. *)

  method row_activated :
    Raw.Tree_path.t -> Tree_view_column.tree_view_column_t option -> unit
  (** Activates the cell determined by [path] and [column]. *)

  method row_expanded : Raw.Tree_path.t -> bool
  (** Returns [TRUE] if the node pointed to by [path] is expanded in
      [tree_view]. *)

  method scroll_to_cell :
    Raw.Tree_path.t option ->
    Tree_view_column.tree_view_column_t option ->
    bool ->
    float ->
    float ->
    unit
  (** Moves the alignments of [tree_view] to the position specified by [column]
      and [path]. If [column] is [NULL], then no horizontal scrolling occurs.
      Likewise, if [path] is [NULL] no vertical scrolling occurs. At a minimum,
      one of [column] or [path] need to be non-[NULL]. [row_align] determines
      where the row is placed, and [col_align] determines where [column] is
      placed. Both are expected to be between 0.0 and 1.0. 0.0 means left/top
      alignment, 1.0 means right/bottom alignment, 0.5 means center.

      If [use_align] is [FALSE], then the alignment arguments are ignored, and
      the tree does the minimum amount of work to scroll the cell onto the
      screen. This means that the cell will be scrolled to the edge closest to
      its current position. If the cell is currently visible on the screen,
      nothing is done.

      This function only works if the model is set, and [path] is a valid row on
      the model. If the model changes before the [tree_view] is realized, the
      centered path will be modified to reflect this change. *)

  method scroll_to_point : int -> int -> unit
  (** Scrolls the tree view such that the top-left corner of the visible area is
      [tree_x], [tree_y], where [tree_x] and [tree_y] are specified in tree
      coordinates. The [tree_view] must be realized before this function is
      called. If it isn't, you probably want to be using
      gtk_tree_view_scroll_to_cell().

      If either [tree_x] or [tree_y] are -1, then that direction isn’t scrolled.
  *)

  method set_activate_on_single_click : bool -> unit
  (** Cause the [GtkTreeView]::row-activated signal to be emitted on a single
      click instead of a double click. *)

  method set_cursor_on_cell :
    Raw.Tree_path.t ->
    Tree_view_column.tree_view_column_t option ->
    Cell_renderer.cell_renderer_t option ->
    bool ->
    unit
  (** Sets the current keyboard focus to be at [path], and selects it. This is
      useful when you want to focus the user’s attention on a particular row. If
      [focus_column] is not [NULL], then focus is given to the column specified
      by it. If [focus_column] and [focus_cell] are not [NULL], and
      [focus_column] contains 2 or more editable or activatable cells, then
      focus is given to the cell specified by [focus_cell]. Additionally, if
      [focus_column] is specified, and [start_editing] is [TRUE], then editing
      should be started in the specified cell. This function is often followed
      by [gtk_widget_grab_focus] ([tree_view]) in order to give keyboard focus
      to the widget. Please note that editing can only happen when the widget is
      realized.

      If [path] is invalid for [model], the current cursor (if any) will be
      unset and the function will return without failing. *)

  method set_drag_dest_row :
    Raw.Tree_path.t option -> Enums.treeviewdropposition -> unit
  (** Sets the row that is highlighted for feedback. If [path] is [NULL], an
      existing highlight is removed. *)

  method set_enable_search : bool -> unit
  [@@ocaml.doc
    "If [enable_search] is set, then the user can type in text to search through\n\
     the tree interactively (this is sometimes called \"typeahead find\").\n\n\
     Note that even if this is [FALSE], the user can still initiate a search\n\
     using the “start-interactive-search” key binding."]

  method set_enable_tree_lines : bool -> unit
  (** Sets whether to draw lines interconnecting the expanders in [tree_view].
      This does not have any visible effects for lists. *)

  method set_expander_column :
    Tree_view_column.tree_view_column_t option -> unit
  (** Sets the column to draw the expander arrow at. It must be in [tree_view].
      If [column] is [NULL], then the expander arrow is always at the first
      visible column.

      If you do not want expander arrow to appear in your tree, set the expander
      column to a hidden column. *)

  method set_fixed_height_mode : bool -> unit
  (** Enables or disables the fixed height mode of [tree_view]. Fixed height
      mode speeds up [GtkTreeView] by assuming that all rows have the same
      height. Only enable this option if all rows are the same height and all
      columns are of type [GTK_TREE_VIEW_COLUMN_FIXED]. *)

  method set_grid_lines : Enums.treeviewgridlines -> unit
  (** Sets which grid lines to draw in [tree_view]. *)

  method set_headers_clickable : bool -> unit
  (** Allow the column title buttons to be clicked. *)

  method set_headers_visible : bool -> unit
  (** Sets the visibility state of the headers. *)

  method set_hover_expand : bool -> unit
  (** Enables or disables the hover expansion mode of [tree_view]. Hover
      expansion makes rows expand or collapse if the pointer moves over them. *)

  method set_hover_selection : bool -> unit
  (** Enables or disables the hover selection mode of [tree_view]. Hover
      selection makes the selected row follow the pointer. Currently, this works
      only for the selection modes [GTK_SELECTION_SINGLE] and
      [GTK_SELECTION_BROWSE]. *)

  method set_level_indentation : int -> unit
  (** Sets the amount of extra indentation for child levels to use in
      [tree_view] in addition to the default indentation. The value should be
      specified in pixels, a value of 0 disables this feature and in this case
      only the default indentation will be used. This does not have any visible
      effects for lists. *)

  method set_model : Tree_model.tree_model_t option -> unit
  (** Sets the model for a [GtkTreeView]. If the [tree_view] already has a model
      set, it will remove it before setting the new model. If [model] is [NULL],
      then it will unset the old model. *)

  method set_reorderable : bool -> unit
  (** This function is a convenience function to allow you to reorder models
      that support the [GtkTreeDragSourceIface] and the [GtkTreeDragDestIface].
      Both [GtkTreeStore] and [GtkListStore] support these. If [reorderable] is
      [TRUE], then the user can reorder the model by dragging and dropping rows.
      The developer can listen to these changes by connecting to the model’s
      [GtkTreeModel::row-inserted] and [GtkTreeModel::row-deleted] signals. The
      reordering is implemented by setting up the tree view as a drag source and
      destination. Therefore, drag and drop can not be used in a reorderable
      view for any other purpose.

      This function does not give you any degree of control over the order --
      any reordering is allowed. If more control is needed, you should probably
      handle drag and drop manually. *)

  method set_rubber_banding : bool -> unit
  (** Enables or disables rubber banding in [tree_view]. If the selection mode
      is [GTK_SELECTION_MULTIPLE], rubber banding will allow the user to select
      multiple rows by dragging the mouse. *)

  method set_search_column : int -> unit
  (** Sets [column] as the column where the interactive search code should
      search in for the current model.

      If the search column is set, users can use the “start-interactive-search”
      key binding to bring up search popup. The enable-search property controls
      whether simply typing text will also start an interactive search.

      Note that [column] refers to a column of the current model. The search
      column is reset to -1 when the model is changed. *)

  method set_search_entry : Editable.editable_t option -> unit
  (** Sets the entry which the interactive search code will use for this
      [tree_view]. This is useful when you want to provide a search entry in our
      interface at all time at a fixed position. Passing [NULL] for [entry] will
      make the interactive search code use the built-in popup entry again. *)

  method set_show_expanders : bool -> unit
  (** Sets whether to draw and enable expanders and indent child rows in
      [tree_view]. When disabled there will be no expanders visible in trees and
      there will be no way to expand and collapse rows by default. Also note
      that hiding the expanders will disable the default indentation. You can
      set a custom indentation in this case using
      gtk_tree_view_set_level_indentation(). This does not have any visible
      effects for lists. *)

  method set_tooltip_cell :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .tooltip_t ->
    Raw.Tree_path.t option ->
    Tree_view_column.tree_view_column_t option ->
    Cell_renderer.cell_renderer_t option ->
    unit
  (** Sets the tip area of [tooltip] to the area [path], [column] and [cell]
      have in common. For example if [path] is [NULL] and [column] is set, the
      tip area will be set to the full area covered by [column]. See also
      gtk_tooltip_set_tip_area().

      Note that if [path] is not specified and [cell] is set and part of a
      column containing the expander, the tooltip might not show and hide at the
      correct position. In such cases [path] must be set to the current node
      under the mouse cursor for this function to operate correctly.

      See also gtk_tree_view_set_tooltip_column() for a simpler alternative. *)

  method set_tooltip_column : int -> unit
  (** If you only plan to have simple (text-only) tooltips on full rows, you can
      use this function to have [GtkTreeView] handle these automatically for
      you. [column] should be set to the column in [tree_view]’s model
      containing the tooltip texts, or -1 to disable this feature.

      When enabled, [GtkWidget:has-tooltip] will be set to [TRUE] and
      [tree_view] will connect a [GtkWidget::query-tooltip] signal handler.

      Note that the signal handler sets the text with gtk_tooltip_set_markup(),
      so &, <, etc have to be escaped in the text. *)

  method set_tooltip_row :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .tooltip_t ->
    Raw.Tree_path.t ->
    unit
  (** Sets the tip area of [tooltip] to be the area covered by the row at
      [path]. See also gtk_tree_view_set_tooltip_column() for a simpler
      alternative. See also gtk_tooltip_set_tip_area(). *)

  method unset_rows_drag_dest : unit -> unit
  (** Undoes the effect of gtk_tree_view_enable_model_drag_dest(). Calling this
      method sets [GtkTreeView]:reorderable to [FALSE]. *)

  method unset_rows_drag_source : unit -> unit
  (** Undoes the effect of gtk_tree_view_enable_model_drag_source(). Calling
      this method sets [GtkTreeView]:reorderable to [FALSE]. *)

  method enable_grid_lines : Enums.treeviewgridlines
  (** Get property: enable-grid-lines *)

  method set_enable_grid_lines : Enums.treeviewgridlines -> unit
  (** Set property: enable-grid-lines *)

  method as_tree_view : Raw.Tree_view.t
end

class tree_selection (obj : Raw.Tree_selection.t) : tree_selection_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.Tree_selection.on_changed ~after self#as_tree_selection ~callback

    method count_selected_rows : unit -> int =
      fun () -> Raw.Tree_selection.count_selected_rows obj

    method get_mode : unit -> Enums.selectionmode =
      fun () -> Raw.Tree_selection.get_mode obj

    method get_tree_view : unit -> tree_view_t =
      fun () -> new tree_view (Raw.Tree_selection.get_tree_view obj)

    method iter_is_selected : Raw.Tree_iter.t -> bool =
      fun iter -> Raw.Tree_selection.iter_is_selected obj iter

    method path_is_selected : Raw.Tree_path.t -> bool =
      fun path -> Raw.Tree_selection.path_is_selected obj path

    method select_all : unit -> unit =
      fun () -> Raw.Tree_selection.select_all obj

    method select_iter : Raw.Tree_iter.t -> unit =
      fun iter -> Raw.Tree_selection.select_iter obj iter

    method select_path : Raw.Tree_path.t -> unit =
      fun path -> Raw.Tree_selection.select_path obj path

    method select_range : Raw.Tree_path.t -> Raw.Tree_path.t -> unit =
      fun start_path end_path ->
        Raw.Tree_selection.select_range obj start_path end_path

    method set_mode : Enums.selectionmode -> unit =
      fun type_ -> Raw.Tree_selection.set_mode obj type_

    method unselect_all : unit -> unit =
      fun () -> Raw.Tree_selection.unselect_all obj

    method unselect_iter : Raw.Tree_iter.t -> unit =
      fun iter -> Raw.Tree_selection.unselect_iter obj iter

    method unselect_path : Raw.Tree_path.t -> unit =
      fun path -> Raw.Tree_selection.unselect_path obj path

    method unselect_range : Raw.Tree_path.t -> Raw.Tree_path.t -> unit =
      fun start_path end_path ->
        Raw.Tree_selection.unselect_range obj start_path end_path

    method as_tree_selection = obj
  end

and tree_view (obj : Raw.Tree_view.t) : tree_view_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Scrollable.scrollable (Raw.Scrollable.from_gobject obj)

    method on_columns_changed ?(after = false) ~callback () =
      Raw.Tree_view.on_columns_changed ~after self#as_tree_view ~callback

    method on_cursor_changed ?(after = false) ~callback () =
      Raw.Tree_view.on_cursor_changed ~after self#as_tree_view ~callback

    method on_expand_collapse_cursor_row ?(after = false) ~callback () =
      Raw.Tree_view.on_expand_collapse_cursor_row ~after self#as_tree_view
        ~callback

    method on_move_cursor ?(after = false) ~callback () =
      Raw.Tree_view.on_move_cursor ~after self#as_tree_view ~callback

    method on_select_all ?(after = false) ~callback () =
      Raw.Tree_view.on_select_all ~after self#as_tree_view ~callback

    method on_select_cursor_parent ?(after = false) ~callback () =
      Raw.Tree_view.on_select_cursor_parent ~after self#as_tree_view ~callback

    method on_select_cursor_row ?(after = false) ~callback () =
      Raw.Tree_view.on_select_cursor_row ~after self#as_tree_view ~callback

    method on_start_interactive_search ?(after = false) ~callback () =
      Raw.Tree_view.on_start_interactive_search ~after self#as_tree_view
        ~callback

    method on_toggle_cursor_row ?(after = false) ~callback () =
      Raw.Tree_view.on_toggle_cursor_row ~after self#as_tree_view ~callback

    method on_unselect_all ?(after = false) ~callback () =
      Raw.Tree_view.on_unselect_all ~after self#as_tree_view ~callback

    method append_column : Tree_view_column.tree_view_column_t -> int =
      fun column ->
        let column = column#as_tree_view_column in
        Raw.Tree_view.append_column obj column

    method collapse_all : unit -> unit =
      fun () -> Raw.Tree_view.collapse_all obj

    method collapse_row : Raw.Tree_path.t -> bool =
      fun path -> Raw.Tree_view.collapse_row obj path

    method columns_autosize : unit -> unit =
      fun () -> Raw.Tree_view.columns_autosize obj

    method create_row_drag_icon :
        Raw.Tree_path.t -> Ocgdk.Paintable.paintable_t option =
      fun path ->
        Option.map
          (fun ret -> new Ocgdk.Paintable.paintable ret)
          (Raw.Tree_view.create_row_drag_icon obj path)

    method enable_model_drag_dest :
        Ocgdk.Content_formats.content_formats_t ->
        Ocgdk.Enums.dragaction ->
        unit =
      fun formats actions ->
        let formats = formats#as_content_formats in
        Raw.Tree_view.enable_model_drag_dest obj formats actions

    method enable_model_drag_source :
        Ocgdk.Enums.modifiertype ->
        Ocgdk.Content_formats.content_formats_t ->
        Ocgdk.Enums.dragaction ->
        unit =
      fun start_button_mask formats actions ->
        let formats = formats#as_content_formats in
        Raw.Tree_view.enable_model_drag_source obj start_button_mask formats
          actions

    method expand_all : unit -> unit = fun () -> Raw.Tree_view.expand_all obj

    method expand_row : Raw.Tree_path.t -> bool -> bool =
      fun path open_all -> Raw.Tree_view.expand_row obj path open_all

    method expand_to_path : Raw.Tree_path.t -> unit =
      fun path -> Raw.Tree_view.expand_to_path obj path

    method get_activate_on_single_click : unit -> bool =
      fun () -> Raw.Tree_view.get_activate_on_single_click obj

    method get_column : int -> Tree_view_column.tree_view_column_t option =
      fun n ->
        Option.map
          (fun ret -> new Tree_view_column.tree_view_column ret)
          (Raw.Tree_view.get_column obj n)

    method get_columns : unit -> Tree_view_column.tree_view_column_t list =
      fun () ->
        (List.map (fun ret -> new Tree_view_column.tree_view_column ret))
          (Raw.Tree_view.get_columns obj)

    method get_enable_search : unit -> bool =
      fun () -> Raw.Tree_view.get_enable_search obj

    method get_enable_tree_lines : unit -> bool =
      fun () -> Raw.Tree_view.get_enable_tree_lines obj

    method get_expander_column :
        unit -> Tree_view_column.tree_view_column_t option =
      fun () ->
        Option.map
          (fun ret -> new Tree_view_column.tree_view_column ret)
          (Raw.Tree_view.get_expander_column obj)

    method get_fixed_height_mode : unit -> bool =
      fun () -> Raw.Tree_view.get_fixed_height_mode obj

    method get_grid_lines : unit -> Enums.treeviewgridlines =
      fun () -> Raw.Tree_view.get_grid_lines obj

    method get_headers_clickable : unit -> bool =
      fun () -> Raw.Tree_view.get_headers_clickable obj

    method get_headers_visible : unit -> bool =
      fun () -> Raw.Tree_view.get_headers_visible obj

    method get_hover_expand : unit -> bool =
      fun () -> Raw.Tree_view.get_hover_expand obj

    method get_hover_selection : unit -> bool =
      fun () -> Raw.Tree_view.get_hover_selection obj

    method get_level_indentation : unit -> int =
      fun () -> Raw.Tree_view.get_level_indentation obj

    method get_model : unit -> Tree_model.tree_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Tree_model.tree_model ret)
          (Raw.Tree_view.get_model obj)

    method get_n_columns : unit -> int =
      fun () -> Raw.Tree_view.get_n_columns obj

    method get_reorderable : unit -> bool =
      fun () -> Raw.Tree_view.get_reorderable obj

    method get_rubber_banding : unit -> bool =
      fun () -> Raw.Tree_view.get_rubber_banding obj

    method get_search_column : unit -> int =
      fun () -> Raw.Tree_view.get_search_column obj

    method get_search_entry : unit -> Editable.editable_t option =
      fun () ->
        Option.map
          (fun ret -> new Editable.editable ret)
          (Raw.Tree_view.get_search_entry obj)

    method get_selection : unit -> tree_selection_t =
      fun () -> new tree_selection (Raw.Tree_view.get_selection obj)

    method get_show_expanders : unit -> bool =
      fun () -> Raw.Tree_view.get_show_expanders obj

    method get_tooltip_column : unit -> int =
      fun () -> Raw.Tree_view.get_tooltip_column obj

    method insert_column : Tree_view_column.tree_view_column_t -> int -> int =
      fun column position ->
        let column = column#as_tree_view_column in
        Raw.Tree_view.insert_column obj column position

    method is_rubber_banding_active : unit -> bool =
      fun () -> Raw.Tree_view.is_rubber_banding_active obj

    method move_column_after :
        Tree_view_column.tree_view_column_t ->
        Tree_view_column.tree_view_column_t option ->
        unit =
      fun column base_column ->
        let column = column#as_tree_view_column in
        let base_column =
          Option.map (fun c -> c#as_tree_view_column) base_column
        in
        Raw.Tree_view.move_column_after obj column base_column

    method remove_column : Tree_view_column.tree_view_column_t -> int =
      fun column ->
        let column = column#as_tree_view_column in
        Raw.Tree_view.remove_column obj column

    method row_activated :
        Raw.Tree_path.t -> Tree_view_column.tree_view_column_t option -> unit =
      fun path column ->
        let column = Option.map (fun c -> c#as_tree_view_column) column in
        Raw.Tree_view.row_activated obj path column

    method row_expanded : Raw.Tree_path.t -> bool =
      fun path -> Raw.Tree_view.row_expanded obj path

    method scroll_to_cell :
        Raw.Tree_path.t option ->
        Tree_view_column.tree_view_column_t option ->
        bool ->
        float ->
        float ->
        unit =
      fun path column use_align row_align col_align ->
        let column = Option.map (fun c -> c#as_tree_view_column) column in
        Raw.Tree_view.scroll_to_cell obj path column use_align row_align
          col_align

    method scroll_to_point : int -> int -> unit =
      fun tree_x tree_y -> Raw.Tree_view.scroll_to_point obj tree_x tree_y

    method set_activate_on_single_click : bool -> unit =
      fun single -> Raw.Tree_view.set_activate_on_single_click obj single

    method set_cursor_on_cell :
        Raw.Tree_path.t ->
        Tree_view_column.tree_view_column_t option ->
        Cell_renderer.cell_renderer_t option ->
        bool ->
        unit =
      fun path focus_column focus_cell start_editing ->
        let focus_column =
          Option.map (fun c -> c#as_tree_view_column) focus_column
        in
        let focus_cell = Option.map (fun c -> c#as_cell_renderer) focus_cell in
        Raw.Tree_view.set_cursor_on_cell obj path focus_column focus_cell
          start_editing

    method set_drag_dest_row :
        Raw.Tree_path.t option -> Enums.treeviewdropposition -> unit =
      fun path pos -> Raw.Tree_view.set_drag_dest_row obj path pos

    method set_enable_search : bool -> unit =
      fun enable_search -> Raw.Tree_view.set_enable_search obj enable_search

    method set_enable_tree_lines : bool -> unit =
      fun enabled -> Raw.Tree_view.set_enable_tree_lines obj enabled

    method set_expander_column :
        Tree_view_column.tree_view_column_t option -> unit =
      fun column ->
        let column = Option.map (fun c -> c#as_tree_view_column) column in
        Raw.Tree_view.set_expander_column obj column

    method set_fixed_height_mode : bool -> unit =
      fun enable -> Raw.Tree_view.set_fixed_height_mode obj enable

    method set_grid_lines : Enums.treeviewgridlines -> unit =
      fun grid_lines -> Raw.Tree_view.set_grid_lines obj grid_lines

    method set_headers_clickable : bool -> unit =
      fun setting -> Raw.Tree_view.set_headers_clickable obj setting

    method set_headers_visible : bool -> unit =
      fun headers_visible ->
        Raw.Tree_view.set_headers_visible obj headers_visible

    method set_hover_expand : bool -> unit =
      fun expand -> Raw.Tree_view.set_hover_expand obj expand

    method set_hover_selection : bool -> unit =
      fun hover -> Raw.Tree_view.set_hover_selection obj hover

    method set_level_indentation : int -> unit =
      fun indentation -> Raw.Tree_view.set_level_indentation obj indentation

    method set_model : Tree_model.tree_model_t option -> unit =
      fun model ->
        let model = Option.map (fun c -> c#as_tree_model) model in
        Raw.Tree_view.set_model obj model

    method set_reorderable : bool -> unit =
      fun reorderable -> Raw.Tree_view.set_reorderable obj reorderable

    method set_rubber_banding : bool -> unit =
      fun enable -> Raw.Tree_view.set_rubber_banding obj enable

    method set_search_column : int -> unit =
      fun column -> Raw.Tree_view.set_search_column obj column

    method set_search_entry : Editable.editable_t option -> unit =
      fun entry ->
        let entry = Option.map (fun c -> c#as_editable) entry in
        Raw.Tree_view.set_search_entry obj entry

    method set_show_expanders : bool -> unit =
      fun enabled -> Raw.Tree_view.set_show_expanders obj enabled

    method set_tooltip_cell :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .tooltip_t ->
        Raw.Tree_path.t option ->
        Tree_view_column.tree_view_column_t option ->
        Cell_renderer.cell_renderer_t option ->
        unit =
      fun tooltip path column cell ->
        let tooltip = tooltip#as_tooltip in
        let column = Option.map (fun c -> c#as_tree_view_column) column in
        let cell = Option.map (fun c -> c#as_cell_renderer) cell in
        Raw.Tree_view.set_tooltip_cell obj tooltip path column cell

    method set_tooltip_column : int -> unit =
      fun column -> Raw.Tree_view.set_tooltip_column obj column

    method set_tooltip_row :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .tooltip_t ->
        Raw.Tree_path.t ->
        unit =
      fun tooltip path ->
        let tooltip = tooltip#as_tooltip in
        Raw.Tree_view.set_tooltip_row obj tooltip path

    method unset_rows_drag_dest : unit -> unit =
      fun () -> Raw.Tree_view.unset_rows_drag_dest obj

    method unset_rows_drag_source : unit -> unit =
      fun () -> Raw.Tree_view.unset_rows_drag_source obj

    method enable_grid_lines = Raw.Tree_view.get_enable_grid_lines obj
    method set_enable_grid_lines v = Raw.Tree_view.set_enable_grid_lines obj v
    method as_tree_view = obj
  end

let new_ () : tree_view_t = new tree_view (Raw.Tree_view.new_ ())

let new_with_model (model : Tree_model.tree_model_t) : tree_view_t =
  let model = model#as_tree_model in
  let obj_ = Raw.Tree_view.new_with_model model in
  new tree_view obj_
