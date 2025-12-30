class tree_view_column : Tree_view_column.t ->
  object
    inherit Gtree_view_column_signals.tree_view_column_signals
    method add_attribute : #GCell_renderer.cell_renderer -> string -> int -> unit
    method cell_is_visible : unit -> bool
    method clear : unit -> unit
    method clear_attributes : #GCell_renderer.cell_renderer -> unit
    method clicked : unit -> unit
    method focus_cell : #GCell_renderer.cell_renderer -> unit
    method get_alignment : unit -> float
    method get_button : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method get_clickable : unit -> bool
    method get_expand : unit -> bool
    method get_fixed_width : unit -> int
    method get_max_width : unit -> int
    method get_min_width : unit -> int
    method get_reorderable : unit -> bool
    method get_resizable : unit -> bool
    method get_sizing : unit -> Gtk_enums.treeviewcolumnsizing
    method get_sort_column_id : unit -> int
    method get_sort_indicator : unit -> bool
    method get_sort_order : unit -> Gtk_enums.sorttype
    method get_spacing : unit -> int
    method get_title : unit -> string
    method get_tree_view : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_visible : unit -> bool
    method get_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_width : unit -> int
    method get_x_offset : unit -> int
    method pack_end : #GCell_renderer.cell_renderer -> bool -> unit
    method pack_start : #GCell_renderer.cell_renderer -> bool -> unit
    method queue_resize : unit -> unit
    method set_alignment : float -> unit
    method set_clickable : bool -> unit
    method set_expand : bool -> unit
    method set_fixed_width : int -> unit
    method set_max_width : int -> unit
    method set_min_width : int -> unit
    method set_reorderable : bool -> unit
    method set_resizable : bool -> unit
    method set_sizing : Gtk_enums.treeviewcolumnsizing -> unit
    method set_sort_column_id : int -> unit
    method set_sort_indicator : bool -> unit
    method set_sort_order : Gtk_enums.sorttype -> unit
    method set_spacing : int -> unit
    method set_title : string -> unit
    method set_visible : bool -> unit
    method set_widget : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method cell_area : GCell_area_and__cell_area_context.cell_area
    method as_tree_view_column : Tree_view_column.t
  end

