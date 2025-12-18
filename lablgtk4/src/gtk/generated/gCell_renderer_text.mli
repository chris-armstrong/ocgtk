class cell_renderer_text : Cell_renderer_text.t ->
  object
    inherit GCell_renderer.cell_renderer
    inherit Gcell_renderer_text_signals.cell_renderer_text_signals
    method align_set : bool
    method set_align_set : bool -> unit
    method set_fixed_height_from_font : int -> unit
  method as_cell_renderer : Cell_renderer.t
    method as_cell_renderer_text : Cell_renderer_text.t
  end

