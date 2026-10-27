(** A [PangoMatrix] specifies a transformation between user-space and device
    coordinates.

    The transformation is given by

    {[
    x_device = x_user * matrix->xx + y_user * matrix->xy + matrix->x0;
    y_device = x_user * matrix->yx + y_user * matrix->yy + matrix->y0;
    ]}

    Its methods, signals and properties are on {!class-type-matrix_t}. The
    functions it is built on are in {!Ocpango.Raw.Matrix}. *)

(** The methods, signals and properties of a [PangoMatrix]. *)
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
(** Wraps a layer 1 handle, {!Ocpango.Raw.Matrix.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [PangoMatrix], give one already wrapped. *)
