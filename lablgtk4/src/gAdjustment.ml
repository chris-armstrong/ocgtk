(* Signal class defined in gadjustment_signals.ml *)

(* High-level class for Adjustment *)
class adjustment (obj : Adjustment.t) = object (self)
  inherit Gadjustment_signals.adjustment_signals obj

  method clamp_page : float -> float -> unit = fun lower upper -> (Adjustment.clamp_page obj lower upper)

  method configure : float -> float -> float -> float -> float -> float -> unit = fun value lower upper step_increment page_increment page_size -> (Adjustment.configure obj value lower upper step_increment page_increment page_size)

  method get_lower : unit -> float = fun () -> (Adjustment.get_lower obj )

  method get_minimum_increment : unit -> float = fun () -> (Adjustment.get_minimum_increment obj )

  method get_page_increment : unit -> float = fun () -> (Adjustment.get_page_increment obj )

  method get_page_size : unit -> float = fun () -> (Adjustment.get_page_size obj )

  method get_step_increment : unit -> float = fun () -> (Adjustment.get_step_increment obj )

  method get_upper : unit -> float = fun () -> (Adjustment.get_upper obj )

  method get_value : unit -> float = fun () -> (Adjustment.get_value obj )

  method set_lower : float -> unit = fun lower -> (Adjustment.set_lower obj lower)

  method set_page_increment : float -> unit = fun page_increment -> (Adjustment.set_page_increment obj page_increment)

  method set_page_size : float -> unit = fun page_size -> (Adjustment.set_page_size obj page_size)

  method set_step_increment : float -> unit = fun step_increment -> (Adjustment.set_step_increment obj step_increment)

  method set_upper : float -> unit = fun upper -> (Adjustment.set_upper obj upper)

  method set_value : float -> unit = fun value -> (Adjustment.set_value obj value)

    method as_adjustment = obj
end

