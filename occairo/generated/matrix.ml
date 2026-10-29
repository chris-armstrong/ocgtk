class type matrix_t = object
  (** {2:conversions Conversions} *)

  method as_matrix : Raw.Matrix.t
end

(* High-level class for Matrix *)
class matrix (obj : Raw.Matrix.t) : matrix_t =
  object (self)
    method as_matrix = obj
  end
