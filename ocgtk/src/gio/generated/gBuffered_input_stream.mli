class type buffered_input_stream_t = object
    inherit GFilter_input_stream.filter_input_stream_t
    inherit GSeekable.seekable_t
    method fill : int -> GCancellable.cancellable_t option -> (int, GError.t) result
    method fill_finish : GAsync_result.async_result_t -> (int, GError.t) result
    method get_available : unit -> Gsize.t
    method get_buffer_size : unit -> Gsize.t
    method read_byte : GCancellable.cancellable_t option -> (int, GError.t) result
    method set_buffer_size : Gsize.t -> unit
    method as_buffered_input_stream : Buffered_input_stream.t
end

class buffered_input_stream : Buffered_input_stream.t -> buffered_input_stream_t

val new_ : GInput_stream.input_stream_t -> buffered_input_stream_t
val new_sized : GInput_stream.input_stream_t -> Gsize.t -> buffered_input_stream_t
