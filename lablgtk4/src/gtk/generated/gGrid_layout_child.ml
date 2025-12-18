(* High-level class for GridLayoutChild *)
class grid_layout_child (obj : Grid_layout_child.t) = object (self)

  method column = Grid_layout_child.get_column obj
  method set_column v = Grid_layout_child.set_column obj v

  method column_span = Grid_layout_child.get_column_span obj
  method set_column_span v = Grid_layout_child.set_column_span obj v

  method row = Grid_layout_child.get_row obj
  method set_row v = Grid_layout_child.set_row obj v

  method row_span = Grid_layout_child.get_row_span obj
  method set_row_span v = Grid_layout_child.set_row_span obj v

    method as_grid_layout_child = obj
end

