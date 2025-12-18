class column_view_cell : Column_view_cell.t ->
  object
    method focusable : bool
    method set_focusable : bool -> unit
    method position : int
    method selected : bool
    method get_child : unit -> GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option
    method set_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget option -> unit
    method as_column_view_cell : Column_view_cell.t
  end

