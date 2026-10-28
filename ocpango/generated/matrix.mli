(** A [PangoMatrix] specifies a transformation between user-space and device
    coordinates.

    The transformation is given by

    {[
    x_device = x_user * matrix->xx + y_user * matrix->xy + matrix->x0;
    y_device = x_user * matrix->yx + y_user * matrix->yy + matrix->y0;
    ]}

    Its methods, signals and properties are on {!class-type-matrix_t}. The
    functions it is built on are in {!Ocpango.Raw.Matrix}. *)

(** The methods, signals and properties of a [Matrix]. *)
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

class matrix : Raw.Matrix.t -> matrix_t
(** Wraps a raw handle of {!Ocpango.Raw.Matrix.t}. *)
