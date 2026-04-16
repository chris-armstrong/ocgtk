class type matrix_t = object
  method as_matrix : Matrix.t
end

(* High-level class for Matrix *)
class matrix (obj : Matrix.t) : matrix_t =
  object (self)
    method as_matrix = obj
  end
