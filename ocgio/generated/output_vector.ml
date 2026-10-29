class type output_vector_t = object
  (** {2:conversions Conversions} *)

  method as_output_vector : Raw.Output_vector.t
end

(* High-level class for OutputVector *)
class output_vector (obj : Raw.Output_vector.t) : output_vector_t =
  object (self)
    method as_output_vector = obj
  end
