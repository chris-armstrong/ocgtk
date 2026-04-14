class type buffered_output_stream_t = object
    inherit GFilter_output_stream.filter_output_stream_t
    inherit GSeekable.seekable_t
    method get_auto_grow : unit -> bool
    method get_buffer_size : unit -> Gsize.t
    method set_auto_grow : bool -> unit
    method set_buffer_size : Gsize.t -> unit
    method as_buffered_output_stream : Buffered_output_stream.t
end

class buffered_output_stream : Buffered_output_stream.t -> buffered_output_stream_t

val new_ : GOutput_stream.output_stream_t -> buffered_output_stream_t
val new_sized : GOutput_stream.output_stream_t -> Gsize.t -> buffered_output_stream_t
