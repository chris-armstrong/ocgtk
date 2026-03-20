class type output_message_t = object
    method as_output_message : Output_message.t
end

(* High-level class for OutputMessage *)
class output_message (obj : Output_message.t) : output_message_t = object (self)

    method as_output_message = obj
end

