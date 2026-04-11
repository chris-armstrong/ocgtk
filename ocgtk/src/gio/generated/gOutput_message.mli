class type output_message_t = object
    method as_output_message : Output_message.t
end

class output_message : Output_message.t -> output_message_t

