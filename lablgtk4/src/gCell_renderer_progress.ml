(* High-level class for CellRendererProgress *)
class cell_renderer_progress (obj : Cell_renderer_progress.t) = object (self)
  inherit GCell_renderer.cell_renderer (Cell_renderer_progress.as_cell_renderer obj)

  method inverted = Cell_renderer_progress.get_inverted obj
  method set_inverted v = Cell_renderer_progress.set_inverted obj v

  method as_cell_renderer = (Cell_renderer_progress.as_cell_renderer obj)
    method as_cell_renderer_progress = obj
end

