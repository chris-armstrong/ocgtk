class cell_renderer_combo : Cell_renderer_combo.t ->
  object
    inherit GCell_renderer.cell_renderer
    inherit Gcell_renderer_combo_signals.cell_renderer_combo_signals
    method has_entry : bool
    method set_has_entry : bool -> unit
    method text_column : int
    method set_text_column : int -> unit
  method as_cell_renderer : Cell_renderer.t
    method as_cell_renderer_combo : Cell_renderer_combo.t
  end

