class grid_layout_child : Grid_layout_child.t ->
  object
    method column : int
    method set_column : int -> unit
    method column_span : int
    method set_column_span : int -> unit
    method row : int
    method set_row : int -> unit
    method row_span : int
    method set_row_span : int -> unit
    method as_grid_layout_child : Grid_layout_child.t
  end

