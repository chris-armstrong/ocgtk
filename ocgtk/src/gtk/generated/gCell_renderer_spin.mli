class type cell_renderer_spin_t = object
    inherit GCell_renderer_text.cell_renderer_text_t
    method adjustment : GAdjustment.adjustment_t
    method set_adjustment : GAdjustment.adjustment_t -> unit
    method climb_rate : float
    method set_climb_rate : float -> unit
    method digits : int
    method set_digits : int -> unit
    method as_cell_renderer_spin : Cell_renderer_spin.t
end

class cell_renderer_spin : Cell_renderer_spin.t -> cell_renderer_spin_t

val new_ : unit -> cell_renderer_spin_t
