(* High-level class for CellRendererSpinner *)
class cell_renderer_spinner (obj : Cell_renderer_spinner.t) = object (self)
  inherit GCell_renderer.cell_renderer (Cell_renderer_spinner.as_cell_renderer obj)

  method active = Cell_renderer_spinner.get_active obj
  method set_active v = Cell_renderer_spinner.set_active obj v

  method as_cell_renderer = (Cell_renderer_spinner.as_cell_renderer obj)
    method as_cell_renderer_spinner = obj
end

