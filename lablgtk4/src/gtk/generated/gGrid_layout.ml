(* High-level class for GridLayout *)
class grid_layout (obj : Grid_layout.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.layout_manager (Grid_layout.as_layoutmanager obj)

  method baseline_row = Grid_layout.get_baseline_row obj
  method set_baseline_row v = Grid_layout.set_baseline_row obj v

  method column_homogeneous = Grid_layout.get_column_homogeneous obj
  method set_column_homogeneous v = Grid_layout.set_column_homogeneous obj v

  method column_spacing = Grid_layout.get_column_spacing obj
  method set_column_spacing v = Grid_layout.set_column_spacing obj v

  method row_homogeneous = Grid_layout.get_row_homogeneous obj
  method set_row_homogeneous v = Grid_layout.set_row_homogeneous obj v

  method row_spacing = Grid_layout.get_row_spacing obj
  method set_row_spacing v = Grid_layout.set_row_spacing obj v

  method get_row_baseline_position : int -> Gtk_enums.baselineposition = fun row -> (Grid_layout.get_row_baseline_position obj row)

  method set_row_baseline_position : int -> Gtk_enums.baselineposition -> unit = fun row pos -> (Grid_layout.set_row_baseline_position obj row pos)

  method as_layoutmanager = (Grid_layout.as_layoutmanager obj)
    method as_grid_layout = obj
end

