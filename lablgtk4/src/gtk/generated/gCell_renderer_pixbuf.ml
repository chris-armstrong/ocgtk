(* High-level class for CellRendererPixbuf *)
class cell_renderer_pixbuf (obj : Cell_renderer_pixbuf.t) = object (self)
  inherit GCell_renderer.cell_renderer (Cell_renderer_pixbuf.as_cell_renderer obj)

  method as_cell_renderer = (Cell_renderer_pixbuf.as_cell_renderer obj)
    method as_cell_renderer_pixbuf = obj
end

