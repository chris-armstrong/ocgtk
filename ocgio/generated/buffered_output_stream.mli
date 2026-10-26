class type buffered_output_stream_t = object
  inherit Filter_output_stream.filter_output_stream_t
  inherit Seekable.seekable_t
  method get_auto_grow : unit -> bool
  method get_buffer_size : unit -> Gsize.t
  method set_auto_grow : bool -> unit
  method set_buffer_size : Gsize.t -> unit
  method as_buffered_output_stream : Raw.Buffered_output_stream.t
end

class buffered_output_stream :
  Raw.Buffered_output_stream.t ->
  buffered_output_stream_t

val new_ : Output_stream.output_stream_t -> buffered_output_stream_t

val new_sized :
  Output_stream.output_stream_t -> Gsize.t -> buffered_output_stream_t
