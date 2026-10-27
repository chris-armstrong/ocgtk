class type buffered_input_stream_t = object
  inherit Filter_input_stream.filter_input_stream_t
  inherit Seekable.seekable_t

  method fill :
    int -> Cancellable.cancellable_t option -> (int, GError.t) result

  method fill_finish : Async_result.async_result_t -> (int, GError.t) result
  method get_available : unit -> Gsize.t
  method get_buffer_size : unit -> Gsize.t
  method read_byte : Cancellable.cancellable_t option -> (int, GError.t) result
  method set_buffer_size : Gsize.t -> unit
  method as_buffered_input_stream : Raw.Buffered_input_stream.t
end

class buffered_input_stream :
  Raw.Buffered_input_stream.t ->
  buffered_input_stream_t

val new_ : Input_stream.input_stream_t -> buffered_input_stream_t

val new_sized :
  Input_stream.input_stream_t -> Gsize.t -> buffered_input_stream_t
