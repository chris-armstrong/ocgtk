class cell_renderer_spinner : Cell_renderer_spinner.t ->
  object
    inherit GCell_renderer.cell_renderer
    method active : bool
    method set_active : bool -> unit
  method as_cell_renderer : Cell_renderer.t
    method as_cell_renderer_spinner : Cell_renderer_spinner.t
  end

