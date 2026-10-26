class type input_vector_t = object
  method as_input_vector : Raw.Input_vector.t
end

(* High-level class for InputVector *)
class input_vector (obj : Raw.Input_vector.t) : input_vector_t =
  object (self)
    method as_input_vector = obj
  end
