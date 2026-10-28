(** Structure used for scatter/gather data input. You generally pass in an array
    of [GInputVectors] and the operation will store the read data starting in
    the first buffer, switching to the next as needed.

    Its methods, signals and properties are on {!class-type-input_vector_t}. The
    functions it is built on are in {!Ocgio.Raw.Input_vector}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [InputVector].}

    Structure used for scatter/gather data input. You generally pass in an array
    of [GInputVectors] and the operation will store the read data starting in
    the first buffer, switching to the next as needed. *)
class type input_vector_t = object
  (** {2:conversions Conversions} *)

  method as_input_vector : Raw.Input_vector.t
end

class input_vector : Raw.Input_vector.t -> input_vector_t
(** Wraps a raw handle of {!Ocgio.Raw.Input_vector.t}. *)
