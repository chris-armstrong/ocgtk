class type matrix_t = object
  method concat : Matrix.t -> unit
  method get_font_scale_factor : unit -> float
  method get_slant_ratio : unit -> float
  method rotate : float -> unit
  method scale : float -> float -> unit
  method translate : float -> float -> unit
  method as_matrix : Matrix.t
end

(* High-level class for Matrix *)
class matrix (obj : Matrix.t) : matrix_t =
  object (self)
    method concat : Matrix.t -> unit =
      fun new_matrix -> Matrix.concat obj new_matrix

    method get_font_scale_factor : unit -> float =
      fun () -> Matrix.get_font_scale_factor obj

    method get_slant_ratio : unit -> float =
      fun () -> Matrix.get_slant_ratio obj

    method rotate : float -> unit = fun degrees -> Matrix.rotate obj degrees

    method scale : float -> float -> unit =
      fun scale_x scale_y -> Matrix.scale obj scale_x scale_y

    method translate : float -> float -> unit =
      fun tx ty -> Matrix.translate obj tx ty

    method as_matrix = obj
  end
