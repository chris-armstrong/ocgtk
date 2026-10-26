class type tree_selection_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method count_selected_rows : unit -> int
  method get_mode : unit -> Enums.selectionmode
  method get_tree_view : unit -> tree_view_t
  method iter_is_selected : Raw.Tree_iter.t -> bool
  method path_is_selected : Raw.Tree_path.t -> bool
  method select_all : unit -> unit
  method select_iter : Raw.Tree_iter.t -> unit
  method select_path : Raw.Tree_path.t -> unit
  method select_range : Raw.Tree_path.t -> Raw.Tree_path.t -> unit
  method set_mode : Enums.selectionmode -> unit
  method unselect_all : unit -> unit
  method unselect_iter : Raw.Tree_iter.t -> unit
  method unselect_path : Raw.Tree_path.t -> unit
  method unselect_range : Raw.Tree_path.t -> Raw.Tree_path.t -> unit
  method as_tree_selection : Raw.Tree_selection.t
end

and tree_view_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Scrollable.scrollable_t

  method on_columns_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_cursor_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

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
  method collapse_all : unit -> unit
  method collapse_row : Raw.Tree_path.t -> bool
  method columns_autosize : unit -> unit

  method create_row_drag_icon :
    Raw.Tree_path.t -> Ocgdk.Paintable.paintable_t option

  method enable_model_drag_dest :
    Ocgdk.Content_formats.content_formats_t -> Ocgdk.Enums.dragaction -> unit

  method enable_model_drag_source :
    Ocgdk.Enums.modifiertype ->
    Ocgdk.Content_formats.content_formats_t ->
    Ocgdk.Enums.dragaction ->
    unit

  method expand_all : unit -> unit
  method expand_row : Raw.Tree_path.t -> bool -> bool
  method expand_to_path : Raw.Tree_path.t -> unit
  method get_activate_on_single_click : unit -> bool
  method get_column : int -> Tree_view_column.tree_view_column_t option
  method get_columns : unit -> Tree_view_column.tree_view_column_t list
  method get_enable_search : unit -> bool
  method get_enable_tree_lines : unit -> bool

  method get_expander_column :
    unit -> Tree_view_column.tree_view_column_t option

  method get_fixed_height_mode : unit -> bool
  method get_grid_lines : unit -> Enums.treeviewgridlines
  method get_headers_clickable : unit -> bool
  method get_headers_visible : unit -> bool
  method get_hover_expand : unit -> bool
  method get_hover_selection : unit -> bool
  method get_level_indentation : unit -> int
  method get_model : unit -> Tree_model.tree_model_t option
  method get_n_columns : unit -> int
  method get_reorderable : unit -> bool
  method get_rubber_banding : unit -> bool
  method get_search_column : unit -> int
  method get_search_entry : unit -> Editable.editable_t option
  method get_selection : unit -> tree_selection_t
  method get_show_expanders : unit -> bool
  method get_tooltip_column : unit -> int
  method insert_column : Tree_view_column.tree_view_column_t -> int -> int
  method is_rubber_banding_active : unit -> bool

  method move_column_after :
    Tree_view_column.tree_view_column_t ->
    Tree_view_column.tree_view_column_t option ->
    unit

  method remove_column : Tree_view_column.tree_view_column_t -> int

  method row_activated :
    Raw.Tree_path.t -> Tree_view_column.tree_view_column_t option -> unit

  method row_expanded : Raw.Tree_path.t -> bool

  method scroll_to_cell :
    Raw.Tree_path.t option ->
    Tree_view_column.tree_view_column_t option ->
    bool ->
    float ->
    float ->
    unit

  method scroll_to_point : int -> int -> unit
  method set_activate_on_single_click : bool -> unit

  method set_cursor_on_cell :
    Raw.Tree_path.t ->
    Tree_view_column.tree_view_column_t option ->
    Cell_renderer.cell_renderer_t option ->
    bool ->
    unit

  method set_drag_dest_row :
    Raw.Tree_path.t option -> Enums.treeviewdropposition -> unit

  method set_enable_search : bool -> unit
  method set_enable_tree_lines : bool -> unit

  method set_expander_column :
    Tree_view_column.tree_view_column_t option -> unit

  method set_fixed_height_mode : bool -> unit
  method set_grid_lines : Enums.treeviewgridlines -> unit
  method set_headers_clickable : bool -> unit
  method set_headers_visible : bool -> unit
  method set_hover_expand : bool -> unit
  method set_hover_selection : bool -> unit
  method set_level_indentation : int -> unit
  method set_model : Tree_model.tree_model_t option -> unit
  method set_reorderable : bool -> unit
  method set_rubber_banding : bool -> unit
  method set_search_column : int -> unit
  method set_search_entry : Editable.editable_t option -> unit
  method set_show_expanders : bool -> unit

  method set_tooltip_cell :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .tooltip_t ->
    Raw.Tree_path.t option ->
    Tree_view_column.tree_view_column_t option ->
    Cell_renderer.cell_renderer_t option ->
    unit

  method set_tooltip_column : int -> unit

  method set_tooltip_row :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .tooltip_t ->
    Raw.Tree_path.t ->
    unit

  method unset_rows_drag_dest : unit -> unit
  method unset_rows_drag_source : unit -> unit
  method enable_grid_lines : Enums.treeviewgridlines
  method set_enable_grid_lines : Enums.treeviewgridlines -> unit
  method as_tree_view : Raw.Tree_view.t
end

class tree_selection : Raw.Tree_selection.t -> tree_selection_t

and tree_view : Raw.Tree_view.t -> tree_view_t

val new_ : unit -> tree_view_t
val new_with_model : Tree_model.tree_model_t -> tree_view_t
