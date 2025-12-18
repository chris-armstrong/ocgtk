class adjustment : Adjustment.t ->
  object
    inherit Gadjustment_signals.adjustment_signals
    method lower : float
    method set_lower : float -> unit
    method page_increment : float
    method set_page_increment : float -> unit
    method page_size : float
    method set_page_size : float -> unit
    method step_increment : float
    method set_step_increment : float -> unit
    method upper : float
    method set_upper : float -> unit
    method value : float
    method set_value : float -> unit
    method clamp_page : float -> float -> unit
    method configure : float -> float -> float -> float -> float -> float -> unit
    method get_minimum_increment : unit -> float
    method as_adjustment : Adjustment.t
  end

