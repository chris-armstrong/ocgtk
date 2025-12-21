class cell_renderer_spin : Cell_renderer_spin.t ->
  object
    inherit GCell_renderer.cell_renderer
    method adjustment : GAdjustment.adjustment
    method set_adjustment : #GAdjustment.adjustment -> unit
    method climb_rate : float
    method set_climb_rate : float -> unit
    method digits : int
    method set_digits : int -> unit
  method as_cell_renderer : Cell_renderer.t
    method as_cell_renderer_spin : Cell_renderer_spin.t
  end

