class type buffered_input_stream_t = object
    inherit GFilter_input_stream.filter_input_stream_t
    method read_byte : GCancellable.cancellable_t option -> (int, GError.t) result
    method as_buffered_input_stream : Buffered_input_stream.t
end

class buffered_input_stream : Buffered_input_stream.t -> buffered_input_stream_t

