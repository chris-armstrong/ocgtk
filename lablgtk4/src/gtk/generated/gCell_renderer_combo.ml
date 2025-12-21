(* Signal class defined in gcell_renderer_combo_signals.ml *)

(* High-level class for CellRendererCombo *)
class cell_renderer_combo (obj : Cell_renderer_combo.t) = object (self)
  inherit GCell_renderer.cell_renderer (Cell_renderer_combo.as_cell_renderer obj)
  inherit Gcell_renderer_combo_signals.cell_renderer_combo_signals obj

  method has_entry = Cell_renderer_combo.get_has_entry obj
  method set_has_entry v =  Cell_renderer_combo.set_has_entry obj v

  method text_column = Cell_renderer_combo.get_text_column obj
  method set_text_column v =  Cell_renderer_combo.set_text_column obj v

  method as_cell_renderer = (Cell_renderer_combo.as_cell_renderer obj)
    method as_cell_renderer_combo = obj
end

