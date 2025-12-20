class grid_layout_child : Grid_layout_child.t ->
  object
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

