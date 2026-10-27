(** Structure used for scatter/gather data output. You generally pass in an
    array of [GOutputVectors] and the operation will use all the buffers as if
    they were one buffer.

    Its methods, signals and properties are on {!class-type-output_vector_t}.
    The functions it is built on are in {!Ocgio.Raw.Output_vector}. *)

(** The methods, signals and properties of a [GOutputVector]. *)
class type output_vector_t = object
  method as_output_vector : Raw.Output_vector.t
end

class output_vector : Raw.Output_vector.t -> output_vector_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Output_vector.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GOutputVector], give one already wrapped. *)
