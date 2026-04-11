class type tree_view_column_t = object
    inherit GBuildable.buildable_t
    inherit GCell_area_and__cell_area_context_and__cell_layout.cell_layout_t
    inherit Gtree_view_column_signals.tree_view_column_signals
    method cell_is_visible : unit -> bool
    method cell_set_cell_data : GTree_model.tree_model_t -> Tree_iter.t -> bool -> bool -> unit
    method clicked : unit -> unit
    method focus_cell : GCell_renderer.cell_renderer_t -> unit
    method get_alignment : unit -> float
    method get_button : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t
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
    method get_tree_view : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_visible : unit -> bool
    method get_widget : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option
    method get_width : unit -> int
    method get_x_offset : unit -> int
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
    method set_widget : GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget_t option -> unit
    method cell_area : GCell_area_and__cell_area_context_and__cell_layout.cell_area_t
    method as_tree_view_column : Tree_view_column.t
end

class tree_view_column : Tree_view_column.t -> tree_view_column_t

val new_ : unit -> tree_view_column_t
val new_with_area : GCell_area_and__cell_area_context_and__cell_layout.cell_area_t -> tree_view_column_t
