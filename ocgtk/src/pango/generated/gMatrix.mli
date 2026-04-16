class type matrix_t = object
  method concat : Matrix.t -> unit
  method copy : unit -> Matrix.t option
  method free : unit -> unit
  method get_font_scale_factor : unit -> float
  method get_slant_ratio : unit -> float
  method rotate : float -> unit
  method scale : float -> float -> unit
  method translate : float -> float -> unit
  method as_matrix : Matrix.t
end

class matrix : Matrix.t -> matrix_t
