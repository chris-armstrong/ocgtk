(* High-level class for PollableOutputStreamInterface *)
class pollable_output_stream_interface (obj : Pollable_output_stream_interface.t) = object (self)

    method as_pollable_output_stream_interface = obj
end

