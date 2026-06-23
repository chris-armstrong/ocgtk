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

    method get_xx : float = Matrix.get_xx obj
    method set_xx : float -> unit = fun v -> Matrix.set_xx obj v
    method get_xy : float = Matrix.get_xy obj
    method set_xy : float -> unit = fun v -> Matrix.set_xy obj v
    method get_yx : float = Matrix.get_yx obj
    method set_yx : float -> unit = fun v -> Matrix.set_yx obj v
    method get_yy : float = Matrix.get_yy obj
    method set_yy : float -> unit = fun v -> Matrix.set_yy obj v
    method get_x0 : float = Matrix.get_x0 obj
    method set_x0 : float -> unit = fun v -> Matrix.set_x0 obj v
    method get_y0 : float = Matrix.get_y0 obj
    method set_y0 : float -> unit = fun v -> Matrix.set_y0 obj v
    method as_matrix = obj
  end

let make (xx : float) (xy : float) (yx : float) (yy : float) (x0 : float)
    (y0 : float) : matrix_t =
  new matrix (Matrix.make xx xy yx yy x0 y0)
