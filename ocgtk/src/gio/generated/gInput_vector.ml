class type input_vector_t = object
  method get_size : Gsize.t
  method set_size : Gsize.t -> unit
  method as_input_vector : Input_vector.t
end

(* High-level class for InputVector *)
class input_vector (obj : Input_vector.t) : input_vector_t =
  object (self)
    method get_size : Gsize.t = Input_vector.get_size obj
    method set_size : Gsize.t -> unit = fun v -> Input_vector.set_size obj v
    method as_input_vector = obj
  end

let make (size : Gsize.t) : input_vector_t =
  new input_vector (Input_vector.make size)
