class type cell_renderer_spin_t = object
  inherit Cell_renderer_text.cell_renderer_text_t
  method adjustment : Adjustment.adjustment_t
  method set_adjustment : Adjustment.adjustment_t -> unit
  method climb_rate : float
  method set_climb_rate : float -> unit
  method digits : int
  method set_digits : int -> unit
  method as_cell_renderer_spin : Raw.Cell_renderer_spin.t
end

(* High-level class for CellRendererSpin *)
class cell_renderer_spin (obj : Raw.Cell_renderer_spin.t) : cell_renderer_spin_t
  =
  object (self)
    inherit
      Cell_renderer_text.cell_renderer_text (obj :> Raw.Cell_renderer_text.t)

    method adjustment =
      new Adjustment.adjustment (Raw.Cell_renderer_spin.get_adjustment obj)

    method set_adjustment : Adjustment.adjustment_t -> unit =
      fun v -> Raw.Cell_renderer_spin.set_adjustment obj v#as_adjustment

    method climb_rate = Raw.Cell_renderer_spin.get_climb_rate obj
    method set_climb_rate v = Raw.Cell_renderer_spin.set_climb_rate obj v
    method digits = Raw.Cell_renderer_spin.get_digits obj
    method set_digits v = Raw.Cell_renderer_spin.set_digits obj v
    method as_cell_renderer_spin = obj
  end

let new_ () : cell_renderer_spin_t =
  new cell_renderer_spin (Raw.Cell_renderer_spin.new_ ())
