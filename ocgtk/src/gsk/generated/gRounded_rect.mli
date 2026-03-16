class rounded_rect : Rounded_rect.t ->
  object
    method init_copy : Rounded_rect.t -> Rounded_rect.t
    method is_rectilinear : unit -> bool
    method normalize : unit -> Rounded_rect.t
    method offset : float -> float -> Rounded_rect.t
    method shrink : float -> float -> float -> float -> Rounded_rect.t
    method as_rounded_rect : Rounded_rect.t
  end

