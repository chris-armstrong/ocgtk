class type matrix_t = object
  method concat : Raw.Matrix.t -> unit
  (** Changes the transformation represented by [matrix] to be the
      transformation given by first applying transformation given by
      [new_matrix] then applying the original transformation. *)

  method get_font_scale_factor : unit -> float
  (** Returns the scale factor of a matrix on the height of the font.

      That is, the scale factor in the direction perpendicular to the vector
      that the X coordinate is mapped to. If the scale in the X coordinate is
      needed as well, use [Pango.Matrix.get_font_scale_factors]. *)

  method get_slant_ratio : unit -> float
  (** Gets the slant ratio of a matrix.

      For a simple shear matrix in the form:

      1 λ 0 1

      this is simply λ. *)

  method rotate : float -> unit
  (** Changes the transformation represented by [matrix] to be the
      transformation given by first rotating by [degrees] degrees
      counter-clockwise then applying the original transformation. *)

  method scale : float -> float -> unit
  (** Changes the transformation represented by [matrix] to be the
      transformation given by first scaling by [sx] in the X direction and [sy]
      in the Y direction then applying the original transformation. *)

  method translate : float -> float -> unit
  (** Changes the transformation represented by [matrix] to be the
      transformation given by first translating by ([tx], [ty]) then applying
      the original transformation. *)

  method as_matrix : Raw.Matrix.t
end

(* High-level class for Matrix *)
class matrix (obj : Raw.Matrix.t) : matrix_t =
  object (self)
    method concat : Raw.Matrix.t -> unit =
      fun new_matrix -> Raw.Matrix.concat obj new_matrix

    method get_font_scale_factor : unit -> float =
      fun () -> Raw.Matrix.get_font_scale_factor obj

    method get_slant_ratio : unit -> float =
      fun () -> Raw.Matrix.get_slant_ratio obj

    method rotate : float -> unit = fun degrees -> Raw.Matrix.rotate obj degrees

    method scale : float -> float -> unit =
      fun scale_x scale_y -> Raw.Matrix.scale obj scale_x scale_y

    method translate : float -> float -> unit =
      fun tx ty -> Raw.Matrix.translate obj tx ty

    method as_matrix = obj
  end
