class type input_vector_t = object
  method as_input_vector : Input_vector.t
end

(* High-level class for InputVector *)
class input_vector (obj : Input_vector.t) : input_vector_t =
  object (self)
    method as_input_vector = obj
  end
