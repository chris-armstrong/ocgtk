(* High-level class for CellRendererSpin *)
class cell_renderer_spin (obj : Cell_renderer_spin.t) = object (self)
  inherit GCell_renderer.cell_renderer (Cell_renderer_spin.as_cell_renderer obj)

  method climb_rate = Cell_renderer_spin.get_climb_rate obj
  method set_climb_rate v = Cell_renderer_spin.set_climb_rate obj v

  method digits = Cell_renderer_spin.get_digits obj
  method set_digits v = Cell_renderer_spin.set_digits obj v

  method as_cell_renderer = (Cell_renderer_spin.as_cell_renderer obj)
    method as_cell_renderer_spin = obj
end

