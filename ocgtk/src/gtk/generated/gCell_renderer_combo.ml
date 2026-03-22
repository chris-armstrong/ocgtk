(* Signal class defined in gcell_renderer_combo_signals.ml *)

class type cell_renderer_combo_t = object
    inherit GCell_renderer_text.cell_renderer_text_t
    inherit Gcell_renderer_combo_signals.cell_renderer_combo_signals
    method has_entry : bool
    method set_has_entry : bool -> unit
    method text_column : int
    method set_text_column : int -> unit
    method as_cell_renderer_combo : Cell_renderer_combo.t
end

(* High-level class for CellRendererCombo *)
class cell_renderer_combo (obj : Cell_renderer_combo.t) : cell_renderer_combo_t = object (self)
  inherit GCell_renderer_text.cell_renderer_text (Obj.magic obj : Cell_renderer_text.t)
  inherit Gcell_renderer_combo_signals.cell_renderer_combo_signals obj

  method has_entry = Cell_renderer_combo.get_has_entry obj
  method set_has_entry v =  Cell_renderer_combo.set_has_entry obj v

  method text_column = Cell_renderer_combo.get_text_column obj
  method set_text_column v =  Cell_renderer_combo.set_text_column obj v

    method as_cell_renderer_combo = obj
end

