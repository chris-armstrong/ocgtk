class column_view_cell : Column_view_cell.t ->
  object
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method get_focusable : unit -> bool
    method get_position : unit -> int
    method get_selected : unit -> bool
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method set_focusable : bool -> unit
    method as_column_view_cell : Column_view_cell.t
  end

