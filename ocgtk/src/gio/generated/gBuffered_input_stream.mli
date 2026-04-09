class type buffered_input_stream_t = object
    inherit GFilter_input_stream.filter_input_stream_t
    method fill : int -> GCancellable.cancellable_t option -> (int, GError.t) result
    method get_available : unit -> int
    method get_buffer_size : unit -> int
    method read_byte : GCancellable.cancellable_t option -> (int, GError.t) result
    method set_buffer_size : int -> unit
    method as_buffered_input_stream : Buffered_input_stream.t
end

class buffered_input_stream : Buffered_input_stream.t -> buffered_input_stream_t

val new_ : GInput_stream.input_stream_t -> buffered_input_stream_t
val new_sized : GInput_stream.input_stream_t -> int -> buffered_input_stream_t
