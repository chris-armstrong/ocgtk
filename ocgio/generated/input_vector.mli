(** Structure used for scatter/gather data input. You generally pass in an array
    of [GInputVectors] and the operation will store the read data starting in
    the first buffer, switching to the next as needed.

    Its methods, signals and properties are on {!class-type-input_vector_t}. The
    functions it is built on are in {!Ocgio.Raw.Input_vector}. *)

(** The methods, signals and properties of a [GInputVector]. *)
class type input_vector_t = object
  method as_input_vector : Raw.Input_vector.t
end

class input_vector : Raw.Input_vector.t -> input_vector_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Input_vector.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GInputVector], give one already wrapped. *)
