class type buffered_input_stream_t = object
    method read_byte : GCancellable.cancellable_t option -> (int, GError.t) result
    method as_buffered_input_stream : Buffered_input_stream.t
end

class buffered_input_stream : Buffered_input_stream.t -> buffered_input_stream_t

