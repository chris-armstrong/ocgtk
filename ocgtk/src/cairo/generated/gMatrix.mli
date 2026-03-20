class type matrix_t = object
    method as_matrix : Matrix.t
end

class matrix : Matrix.t -> matrix_t

