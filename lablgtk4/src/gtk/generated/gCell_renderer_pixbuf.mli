class cell_renderer_pixbuf : Cell_renderer_pixbuf.t ->
  object
    inherit GCell_renderer.cell_renderer
    method icon_name : string
    method set_icon_name : string -> unit
  method as_cell_renderer : Cell_renderer.t
    method as_cell_renderer_pixbuf : Cell_renderer_pixbuf.t
  end

