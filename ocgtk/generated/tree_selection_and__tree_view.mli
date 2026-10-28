(** The classes of {!Ocgtk.Tree_selection}, {!Ocgtk.Tree_view}, defined together
    because they refer to each other. Each has a module of its own that
    re-exports it; use that module rather than this one. *)

(** {b The methods, signals and properties of a [TreeSelection].}

    The selection object for GtkTreeView

    The [GtkTreeSelection] object is a helper object to manage the selection for
    a [GtkTreeView] widget. The [GtkTreeSelection] object is automatically
    created when a new [GtkTreeView] widget is created, and cannot exist
    independently of this widget. The primary reason the [GtkTreeSelection]
    objects exists is for cleanliness of code and API. That is, there is no
    conceptual reason all these functions could not be methods on the
    [GtkTreeView] widget instead of a separate function.

    The [GtkTreeSelection] object is gotten from a [GtkTreeView] by calling
    gtk_tree_view_get_selection(). It can be manipulated to check the selection
    status of the tree, as well as select and deselect individual rows.
    Selection is done completely view side. As a result, multiple views of the
    same model can have completely different selections. Additionally, you
    cannot change the selection of a row on the model that is not currently
    displayed by the view without expanding its parents first.

    One of the important things to remember when monitoring the selection of a
    view is that the [GtkTreeSelection]::changed signal is mostly a hint. That
    is, it may only emit one signal when a range of rows is selected.
    Additionally, it may on occasion emit a [GtkTreeSelection]::changed signal
    when nothing has happened (mostly as a result of programmers calling
    select_row on an already selected row). *)
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
  [@@ocaml.doc
    "{b The methods, signals and properties of a [TreeView].}\n\n\
     A widget for displaying both trees and lists\n\n\
     An example GtkTreeView\n\n\
     Widget that displays any object that implements the [Gtk.TreeModel] \
     interface.\n\n\
     Please refer to the tree widget conceptual overview\n\
     for an overview of all the objects and data types related to the tree\n\
     widget and how they work together.\n\n\
     {b Coordinate systems in GtkTreeView API}\n\n\
     Several different coordinate systems are exposed in the [GtkTreeView] API.\n\
     These are:\n\n\
     - Widget coordinates: Coordinates relative to the widget (usually \
     [widget->window]).\n\n\
     - Bin window coordinates: Coordinates relative to the window that \
     GtkTreeView renders to.\n\n\
     - Tree coordinates: Coordinates relative to the entire scrollable area of \
     GtkTreeView. These\n\
     coordinates start at (0, 0) for row 0 of the tree.\n\n\
     Several functions are available for converting between the different\n\
     coordinate systems.  The most common translations are between widget and \
     bin\n\
     window coordinates and between bin window and tree coordinates. For the\n\
     former you can use [Gtk.TreeView.convert_widget_to_bin_window_coords]\n\
     (and vice versa), for the latter \
     [Gtk.TreeView.convert_bin_window_to_tree_coords]\n\
     (and vice versa).\n\n\
     {b [GtkTreeView] as [GtkBuildable]}\n\n\
     The [GtkTreeView] implementation of the [GtkBuildable] interface accepts\n\
     [Gtk.TreeViewColumn] objects as [<child>] elements and exposes the\n\
     internal [Gtk.TreeSelection] in UI definitions.\n\n\
     An example of a UI definition fragment with [GtkTreeView]:\n\n\
     {[\n\
     <object class=\"GtkTreeView\" id=\"treeview\">\n\
    \  <property name=\"model\">liststore1</property>\n\
    \  <child>\n\
    \    <object class=\"GtkTreeViewColumn\" id=\"test-column\">\n\
    \      <property name=\"title\">Test</property>\n\
    \      <child>\n\
    \        <object class=\"GtkCellRendererText\" id=\"test-renderer\"/>\n\
    \        <attributes>\n\
    \          <attribute name=\"text\">1</attribute>\n\
    \        </attributes>\n\
    \      </child>\n\
    \    </object>\n\
    \  </child>\n\
    \  <child internal-child=\"selection\">\n\
    \    <object class=\"GtkTreeSelection\" id=\"selection\">\n\
    \      <signal name=\"changed\" handler=\"on_treeview_selection_changed\"/>\n\
    \    </object>\n\
    \  </child>\n\
     </object>\n\
     ]}\n\n\
     {b CSS nodes}\n\n\
     {[\n\
     treeview.view\n\
     ├── header\n\
     │   ├── button\n\
     │   │   ╰── [sort-indicator]\n\
     ┊   ┊\n\
     │   ╰── button\n\
     │       ╰── [sort-indicator]\n\
     │\n\
     ├── [rubberband]\n\
     ╰── [dndtarget]\n\
     ]}\n\n\
     [GtkTreeView] has a main CSS node with name [treeview] and style class \
     [.view].\n\
     It has a subnode with name [header], which is the parent for all the column\n\
     header widgets' CSS nodes.\n\n\
     Each column header consists of a [button], which among other content, has a\n\
     child with name [sort-indicator], which carries the [.ascending] or \
     [.descending]\n\
     style classes when the column header should show a sort indicator. The CSS\n\
     is expected to provide a suitable image using the [-gtk-icon-source] \
     property.\n\n\
     For rubberband selection, a subnode with name [rubberband] is used.\n\n\
     For the drop target location during DND, a subnode with name [dndtarget] \
     is used."]

(** Wraps a raw handle of {!Ocgtk.Raw.Tree_selection.t}. *)
class tree_selection : Raw.Tree_selection.t -> tree_selection_t
(** Wraps a raw handle of {!Ocgtk.Raw.Tree_view.t}. *)

and tree_view : Raw.Tree_view.t -> tree_view_t

val new_ : unit -> tree_view_t
(** Creates a new [GtkTreeView] widget. *)

val new_with_model : Tree_model.tree_model_t -> tree_view_t
(** Creates a new [GtkTreeView] widget with the model initialized to [model]. *)
