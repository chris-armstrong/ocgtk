class adjustment : Adjustment.t ->
  object
    inherit Gadjustment_signals.adjustment_signals
    method clamp_page : float -> float -> unit
    method configure : float -> float -> float -> float -> float -> float -> unit
    method get_lower : unit -> float
    method get_minimum_increment : unit -> float
    method get_page_increment : unit -> float
    method get_page_size : unit -> float
    method get_step_increment : unit -> float
    method get_upper : unit -> float
    method get_value : unit -> float
    method set_lower : float -> unit
    method set_page_increment : float -> unit
    method set_page_size : float -> unit
    method set_step_increment : float -> unit
    method set_upper : float -> unit
    method set_value : float -> unit
    method as_adjustment : Adjustment.t
  end

