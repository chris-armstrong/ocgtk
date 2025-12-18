class cell_renderer_spin : Cell_renderer_spin.t ->
  object
    inherit GCell_renderer.cell_renderer
  method as_cell_renderer : Cell_renderer.t
    method as_cell_renderer_spin : Cell_renderer_spin.t
  end

