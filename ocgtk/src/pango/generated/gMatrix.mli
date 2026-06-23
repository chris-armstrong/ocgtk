class type matrix_t = object
  method concat : Matrix.t -> unit
  method get_font_scale_factor : unit -> float
  method get_slant_ratio : unit -> float
  method rotate : float -> unit
  method scale : float -> float -> unit
  method translate : float -> float -> unit
  method get_xx : float
  method set_xx : float -> unit
  method get_xy : float
  method set_xy : float -> unit
  method get_yx : float
  method set_yx : float -> unit
  method get_yy : float
  method set_yy : float -> unit
  method get_x0 : float
  method set_x0 : float -> unit
  method get_y0 : float
  method set_y0 : float -> unit
  method as_matrix : Matrix.t
end

class matrix : Matrix.t -> matrix_t

val make : float -> float -> float -> float -> float -> float -> matrix_t
