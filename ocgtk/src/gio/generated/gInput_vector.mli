class type input_vector_t = object
  method get_size : Gsize.t
  method set_size : Gsize.t -> unit
  method as_input_vector : Input_vector.t
end

class input_vector : Input_vector.t -> input_vector_t

val make : Gsize.t -> input_vector_t
