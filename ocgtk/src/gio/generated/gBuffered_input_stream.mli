class buffered_input_stream : Buffered_input_stream.t ->
  object
    method read_byte : #GCancellable.cancellable option -> (int, GError.t) result
    method as_buffered_input_stream : Buffered_input_stream.t
  end

