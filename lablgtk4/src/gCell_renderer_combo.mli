class cell_renderer_combo : Cell_renderer_combo.t ->
  object
    inherit GCell_renderer.cell_renderer
    inherit Gcell_renderer_combo_signals.cell_renderer_combo_signals
  method as_cell_renderer : Cell_renderer.t
    method as_cell_renderer_combo : Cell_renderer_combo.t
  end

