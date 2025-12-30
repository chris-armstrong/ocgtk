(* High-level class for PollableInputStreamInterface *)
class pollable_input_stream_interface (obj : Pollable_input_stream_interface.t) = object (self)

    method as_pollable_input_stream_interface = obj
end

