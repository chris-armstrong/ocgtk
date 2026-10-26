class type matrix_t = object
  method concat : Raw.Matrix.t -> unit
  method get_font_scale_factor : unit -> float
  method get_slant_ratio : unit -> float
  method rotate : float -> unit
  method scale : float -> float -> unit
  method translate : float -> float -> unit
  method as_matrix : Raw.Matrix.t
end

class matrix : Raw.Matrix.t -> matrix_t
