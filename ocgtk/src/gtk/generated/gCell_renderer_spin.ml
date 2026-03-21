class type cell_renderer_spin_t = object
    method adjustment : GAdjustment.adjustment_t
    method set_adjustment : GAdjustment.adjustment_t -> unit
    method climb_rate : float
    method set_climb_rate : float -> unit
    method digits : int
    method set_digits : int -> unit
    method as_cell_renderer_spin : Cell_renderer_spin.t
end

(* High-level class for CellRendererSpin *)
class cell_renderer_spin (obj : Cell_renderer_spin.t) : cell_renderer_spin_t = object (self)

  method adjustment = new GAdjustment.adjustment (Cell_renderer_spin.get_adjustment obj)
  method set_adjustment : GAdjustment.adjustment_t -> unit  = fun v ->  Cell_renderer_spin.set_adjustment obj v#as_adjustment

  method climb_rate = Cell_renderer_spin.get_climb_rate obj
  method set_climb_rate v =  Cell_renderer_spin.set_climb_rate obj v

  method digits = Cell_renderer_spin.get_digits obj
  method set_digits v =  Cell_renderer_spin.set_digits obj v

    method as_cell_renderer_spin = obj
end

