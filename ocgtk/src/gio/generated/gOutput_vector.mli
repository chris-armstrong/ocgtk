class type output_vector_t = object
    method as_output_vector : Output_vector.t
end

class output_vector : Output_vector.t -> output_vector_t

