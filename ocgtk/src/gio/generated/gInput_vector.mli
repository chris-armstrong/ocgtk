class type input_vector_t = object
    method as_input_vector : Input_vector.t
end

class input_vector : Input_vector.t -> input_vector_t

