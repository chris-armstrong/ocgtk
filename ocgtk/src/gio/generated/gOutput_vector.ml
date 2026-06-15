class type output_vector_t = object
  method get_size : Gsize.t
  method set_size : Gsize.t -> unit
  method as_output_vector : Output_vector.t
end

(* High-level class for OutputVector *)
class output_vector (obj : Output_vector.t) : output_vector_t =
  object (self)
    method get_size : Gsize.t = Output_vector.get_size obj
    method set_size : Gsize.t -> unit = fun v -> Output_vector.set_size obj v
    method as_output_vector = obj
  end

let make (size : Gsize.t) : output_vector_t =
  new output_vector (Output_vector.make size)
