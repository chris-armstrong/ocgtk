class type matrix_t = object
  method as_matrix : Raw.Matrix.t
end

class matrix : Raw.Matrix.t -> matrix_t
