class tree_selection : Tree_selection_and__tree_view.Tree_selection.t ->
  object
    inherit Gtree_selection_signals.tree_selection_signals
    method count_selected_rows : unit -> int
    method get_mode : unit -> Gtk_enums.selectionmode
    method get_tree_view : unit -> tree_view
    method iter_is_selected : Tree_iter.t -> bool
    method path_is_selected : Tree_path.t -> bool
    method select_all : unit -> unit
    method select_iter : Tree_iter.t -> unit
    method select_path : Tree_path.t -> unit
    method select_range : Tree_path.t -> Tree_path.t -> unit
    method set_mode : Gtk_enums.selectionmode -> unit
    method unselect_all : unit -> unit
    method unselect_iter : Tree_iter.t -> unit
    method unselect_path : Tree_path.t -> unit
    method unselect_range : Tree_path.t -> Tree_path.t -> unit
    method as_tree_selection : Tree_selection_and__tree_view.Tree_selection.t
  end

and tree_view : Tree_selection_and__tree_view.Tree_view.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gtree_view_signals.tree_view_signals
    method activate_on_single_click : bool
    method set_activate_on_single_click : bool -> unit
    method enable_search : bool
    method set_enable_search : bool -> unit
    method enable_tree_lines : bool
    method set_enable_tree_lines : bool -> unit
    method fixed_height_mode : bool
    method set_fixed_height_mode : bool -> unit
    method headers_clickable : bool
    method set_headers_clickable : bool -> unit
    method headers_visible : bool
    method set_headers_visible : bool -> unit
    method hover_expand : bool
    method set_hover_expand : bool -> unit
    method hover_selection : bool
    method set_hover_selection : bool -> unit
    method level_indentation : int
    method set_level_indentation : int -> unit
    method reorderable : bool
    method set_reorderable : bool -> unit
    method rubber_banding : bool
    method set_rubber_banding : bool -> unit
    method search_column : int
    method set_search_column : int -> unit
    method show_expanders : bool
    method set_show_expanders : bool -> unit
    method tooltip_column : int
    method set_tooltip_column : int -> unit
    method append_column : #GTree_view_column.tree_view_column -> int
    method collapse_all : unit -> unit
    method collapse_row : Tree_path.t -> bool
    method columns_autosize : unit -> unit
    method expand_all : unit -> unit
    method expand_row : Tree_path.t -> bool -> bool
    method expand_to_path : Tree_path.t -> unit
    method get_column : int -> GTree_view_column.tree_view_column option
    method get_expander_column : unit -> GTree_view_column.tree_view_column option
    method get_grid_lines : unit -> Gtk_enums.treeviewgridlines
    method get_model : unit -> GTree_model.tree_model option
    method get_n_columns : unit -> int
    method get_search_entry : unit -> GEditable.editable option
    method get_selection : unit -> tree_selection
    method insert_column : #GTree_view_column.tree_view_column -> int -> int
    method is_rubber_banding_active : unit -> bool
    method move_column_after : #GTree_view_column.tree_view_column -> #GTree_view_column.tree_view_column option -> unit
    method remove_column : #GTree_view_column.tree_view_column -> int
    method row_activated : Tree_path.t -> #GTree_view_column.tree_view_column option -> unit
    method row_expanded : Tree_path.t -> bool
    method scroll_to_cell : Tree_path.t option -> #GTree_view_column.tree_view_column option -> bool -> float -> float -> unit
    method scroll_to_point : int -> int -> unit
    (* method set_cursor : ... *) (* CONFLICT: incompatible signature with parent method *)
    method set_cursor_on_cell : Tree_path.t -> #GTree_view_column.tree_view_column option -> #GCell_renderer.cell_renderer option -> bool -> unit
    method set_drag_dest_row : Tree_path.t option -> Gtk_enums.treeviewdropposition -> unit
    method set_expander_column : #GTree_view_column.tree_view_column option -> unit
    method set_grid_lines : Gtk_enums.treeviewgridlines -> unit
    method set_model : GTree_model.tree_model option -> unit
    method set_search_entry : GEditable.editable option -> unit
    method set_tooltip_cell : #GTooltip.tooltip -> Tree_path.t option -> #GTree_view_column.tree_view_column option -> #GCell_renderer.cell_renderer option -> unit
    method set_tooltip_row : #GTooltip.tooltip -> Tree_path.t -> unit
    method unset_rows_drag_dest : unit -> unit
    method unset_rows_drag_source : unit -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_tree_view : Tree_selection_and__tree_view.Tree_view.t
  end
