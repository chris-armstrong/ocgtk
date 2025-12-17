class cell_renderer_progress : Cell_renderer_progress.t ->
  object
    inherit GCell_renderer.cell_renderer
    method inverted : bool
    method set_inverted : bool -> unit
  method as_cell_renderer : Cell_renderer.t
    method as_cell_renderer_progress : Cell_renderer_progress.t
  end

