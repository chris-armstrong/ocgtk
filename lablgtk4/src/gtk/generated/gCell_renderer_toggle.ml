(* Signal class defined in gcell_renderer_toggle_signals.ml *)

(* High-level class for CellRendererToggle *)
class cell_renderer_toggle (obj : Cell_renderer_toggle.t) = object (self)
  inherit GCell_renderer.cell_renderer (Cell_renderer_toggle.as_cell_renderer obj)
  inherit Gcell_renderer_toggle_signals.cell_renderer_toggle_signals obj

  method activatable = Cell_renderer_toggle.get_activatable obj
  method set_activatable v = Cell_renderer_toggle.set_activatable obj v

  method active = Cell_renderer_toggle.get_active obj
  method set_active v = Cell_renderer_toggle.set_active obj v

  method inconsistent = Cell_renderer_toggle.get_inconsistent obj
  method set_inconsistent v = Cell_renderer_toggle.set_inconsistent obj v

  method radio = Cell_renderer_toggle.get_radio obj
  method set_radio v = Cell_renderer_toggle.set_radio obj v

  method as_cell_renderer = (Cell_renderer_toggle.as_cell_renderer obj)
    method as_cell_renderer_toggle = obj
end

