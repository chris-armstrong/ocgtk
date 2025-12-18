class cell_renderer_accel : Cell_renderer_accel.t ->
  object
    inherit GCell_renderer.cell_renderer
    inherit Gcell_renderer_accel_signals.cell_renderer_accel_signals
  method as_cell_renderer : Cell_renderer.t
    method as_cell_renderer_accel : Cell_renderer_accel.t
  end

