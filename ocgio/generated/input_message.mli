class type input_message_t = object
  method as_input_message : Raw.Input_message.t
end

class input_message : Raw.Input_message.t -> input_message_t
