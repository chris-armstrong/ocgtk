class type input_message_t = object
  method as_input_message : Input_message.t
end

(* High-level class for InputMessage *)
class input_message (obj : Input_message.t) : input_message_t =
  object (self)
    method as_input_message = obj
  end
