(* High-level class for CellRendererProgress *)
class cell_renderer_progress (obj : Cell_renderer_progress.t) = object (self)
  inherit GCell_renderer.cell_renderer (Cell_renderer_progress.as_cell_renderer obj)

  method inverted = Cell_renderer_progress.get_inverted obj
  method set_inverted v = Cell_renderer_progress.set_inverted obj v

  method pulse = Cell_renderer_progress.get_pulse obj
  method set_pulse v = Cell_renderer_progress.set_pulse obj v

  method text = Cell_renderer_progress.get_text obj
  method set_text v = Cell_renderer_progress.set_text obj v

  method text_xalign = Cell_renderer_progress.get_text_xalign obj
  method set_text_xalign v = Cell_renderer_progress.set_text_xalign obj v

  method text_yalign = Cell_renderer_progress.get_text_yalign obj
  method set_text_yalign v = Cell_renderer_progress.set_text_yalign obj v

  method value = Cell_renderer_progress.get_value obj
  method set_value v = Cell_renderer_progress.set_value obj v

  method as_cell_renderer = (Cell_renderer_progress.as_cell_renderer obj)
    method as_cell_renderer_progress = obj
end

