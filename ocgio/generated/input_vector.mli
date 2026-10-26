class type input_vector_t = object
  method as_input_vector : Raw.Input_vector.t
end

class input_vector : Raw.Input_vector.t -> input_vector_t
