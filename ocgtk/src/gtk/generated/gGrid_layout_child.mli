class type grid_layout_child_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .layout_child_t

  method get_column : unit -> int
  method get_column_span : unit -> int
  method get_row : unit -> int
  method get_row_span : unit -> int
  method set_column : int -> unit
  method set_column_span : int -> unit
  method set_row : int -> unit
  method set_row_span : int -> unit
  method as_grid_layout_child : Grid_layout_child.t
end

class grid_layout_child : Grid_layout_child.t -> grid_layout_child_t
