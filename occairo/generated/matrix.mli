(** Bindings for [Matrix].

    Its methods, signals and properties are on {!class-type-matrix_t}. The
    functions it is built on are in {!Occairo.Raw.Matrix}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Matrix].} *)
class type matrix_t = object
  method as_matrix : Raw.Matrix.t
end

class matrix : Raw.Matrix.t -> matrix_t
(** Wraps a raw handle of {!Occairo.Raw.Matrix.t}. *)
