(* High-level class for CellRendererSpinner *)
class cell_renderer_spinner (obj : Cell_renderer_spinner.t) = object (self)
  inherit GCell_renderer.cell_renderer (Cell_renderer_spinner.as_cell_renderer obj)

  method active = Cell_renderer_spinner.get_active obj
  method set_active v =  Cell_renderer_spinner.set_active obj v

  method pulse = Cell_renderer_spinner.get_pulse obj
  method set_pulse v =  Cell_renderer_spinner.set_pulse obj v

  method size = Cell_renderer_spinner.get_size obj
  method set_size v =  Cell_renderer_spinner.set_size obj v

  method as_cell_renderer = (Cell_renderer_spinner.as_cell_renderer obj)
    method as_cell_renderer_spinner = obj
end

