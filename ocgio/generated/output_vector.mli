(** Structure used for scatter/gather data output. You generally pass in an
    array of [GOutputVectors] and the operation will use all the buffers as if
    they were one buffer.

    Its methods, signals and properties are on {!class-type-output_vector_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgio.Raw.Output_vector}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [OutputVector].}

    Structure used for scatter/gather data output. You generally pass in an
    array of [GOutputVectors] and the operation will use all the buffers as if
    they were one buffer. *)
class type output_vector_t = object
  (** {2:conversions Conversions} *)

  method as_output_vector : Raw.Output_vector.t
end

class output_vector : Raw.Output_vector.t -> output_vector_t
(** Wraps a raw handle of {!Ocgio.Raw.Output_vector.t}. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
