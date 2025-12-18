class tree_view_column : Tree_view_column.t ->
  object
    inherit Gtree_view_column_signals.tree_view_column_signals
    method alignment : float
    method set_alignment : float -> unit
    method clickable : bool
    method set_clickable : bool -> unit
    method expand : bool
    method set_expand : bool -> unit
    method fixed_width : int
    method set_fixed_width : int -> unit
    method max_width : int
    method set_max_width : int -> unit
    method min_width : int
    method set_min_width : int -> unit
    method reorderable : bool
    method set_reorderable : bool -> unit
    method resizable : bool
    method set_resizable : bool -> unit
    method sort_column_id : int
    method set_sort_column_id : int -> unit
    method sort_indicator : bool
    method set_sort_indicator : bool -> unit
    method spacing : int
    method set_spacing : int -> unit
    method title : string
    method set_title : string -> unit
    method visible : bool
    method set_visible : bool -> unit
    method width : int
    method x_offset : int
    method add_attribute : #GCell_renderer.cell_renderer -> string -> int -> unit
    method cell_is_visible : unit -> bool
    method cell_set_cell_data : GTree_model.tree_model -> Tree_iter.t -> bool -> bool -> unit
    method clear : unit -> unit
    method clear_attributes : #GCell_renderer.cell_renderer -> unit
    method clicked : unit -> unit
    method focus_cell : #GCell_renderer.cell_renderer -> unit
    method get_button : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_sizing : unit -> Gtk_enums.treeviewcolumnsizing
    method get_sort_order : unit -> Gtk_enums.sorttype
    method get_tree_view : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method pack_end : #GCell_renderer.cell_renderer -> bool -> unit
    method pack_start : #GCell_renderer.cell_renderer -> bool -> unit
    method queue_resize : unit -> unit
    method set_sizing : Gtk_enums.treeviewcolumnsizing -> unit
    method set_sort_order : Gtk_enums.sorttype -> unit
    method set_widget : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method as_tree_view_column : Tree_view_column.t
  end

