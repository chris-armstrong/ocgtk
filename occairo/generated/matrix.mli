(** Bindings for [cairo_matrix_t].

    Its methods, signals and properties are on {!class-type-matrix_t}. The
    functions it is built on are in {!Occairo.Raw.Matrix}. *)

(** The methods, signals and properties of a [cairo_matrix_t]. *)
class type matrix_t = object
  method as_matrix : Raw.Matrix.t
end

class matrix : Raw.Matrix.t -> matrix_t
(** Wraps a layer 1 handle, {!Occairo.Raw.Matrix.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [cairo_matrix_t], give one already wrapped. *)
