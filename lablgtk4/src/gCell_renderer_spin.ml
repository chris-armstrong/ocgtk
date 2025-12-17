(* High-level class for CellRendererSpin *)
class cell_renderer_spin (obj : Cell_renderer_spin.t) = object (self)
  inherit GCell_renderer.cell_renderer (Cell_renderer_spin.as_cell_renderer obj)

  method as_cell_renderer = (Cell_renderer_spin.as_cell_renderer obj)
    method as_cell_renderer_spin = obj
end

