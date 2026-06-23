class type output_vector_t = object
  method get_size : Gsize.t
  method set_size : Gsize.t -> unit
  method as_output_vector : Output_vector.t
end

class output_vector : Output_vector.t -> output_vector_t

val make : Gsize.t -> output_vector_t
