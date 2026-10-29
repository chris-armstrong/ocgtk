class type cell_renderer_spin_t = object
  inherit Cell_renderer_text.cell_renderer_text_t

  (** {2:properties Properties} *)

  method adjustment : Adjustment.adjustment_t
  (** The adjustment that holds the value of the spinbutton. This must be
      non-[NULL] for the cell renderer to be editable. *)

  method set_adjustment : Adjustment.adjustment_t -> unit
  (** The adjustment that holds the value of the spinbutton. This must be
      non-[NULL] for the cell renderer to be editable. *)

  method climb_rate : float
  (** The acceleration rate when you hold down a button. *)

  method set_climb_rate : float -> unit
  (** The acceleration rate when you hold down a button. *)

  method digits : int
  (** The number of decimal places to display. *)

  method set_digits : int -> unit
  (** The number of decimal places to display. *)

  (** {2:conversions Conversions} *)

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
