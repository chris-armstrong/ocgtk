(* Signal class defined in gadjustment_signals.ml *)

(* High-level class for Adjustment *)
class adjustment (obj : Adjustment.t) = object (self)
  inherit Gadjustment_signals.adjustment_signals obj

  method lower = Adjustment.get_lower obj
  method set_lower v = Adjustment.set_lower obj v

  method page_increment = Adjustment.get_page_increment obj
  method set_page_increment v = Adjustment.set_page_increment obj v

  method page_size = Adjustment.get_page_size obj
  method set_page_size v = Adjustment.set_page_size obj v

  method step_increment = Adjustment.get_step_increment obj
  method set_step_increment v = Adjustment.set_step_increment obj v

  method upper = Adjustment.get_upper obj
  method set_upper v = Adjustment.set_upper obj v

  method value = Adjustment.get_value obj
  method set_value v = Adjustment.set_value obj v

  method clamp_page : float -> float -> unit = fun lower upper -> (Adjustment.clamp_page obj lower upper)

  method configure : float -> float -> float -> float -> float -> float -> unit = fun value lower upper step_increment page_increment page_size -> (Adjustment.configure obj value lower upper step_increment page_increment page_size)

  method get_minimum_increment : unit -> float = fun () -> (Adjustment.get_minimum_increment obj )

    method as_adjustment = obj
end

