(* Signal class defined in gcell_renderer_text_signals.ml *)

(* High-level class for CellRendererText *)
class cell_renderer_text (obj : Cell_renderer_text.t) = object (self)
  inherit GCell_renderer.cell_renderer (Cell_renderer_text.as_cell_renderer obj)
  inherit Gcell_renderer_text_signals.cell_renderer_text_signals obj

  method align_set = Cell_renderer_text.get_align_set obj
  method set_align_set v = Cell_renderer_text.set_align_set obj v

  method set_fixed_height_from_font : int -> unit = fun number_of_rows -> (Cell_renderer_text.set_fixed_height_from_font obj number_of_rows)

  method as_cell_renderer = (Cell_renderer_text.as_cell_renderer obj)
    method as_cell_renderer_text = obj
end

