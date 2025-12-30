class buffered_output_stream : Buffered_output_stream.t ->
  object
    method get_auto_grow : unit -> bool
    method set_auto_grow : bool -> unit
    method as_buffered_output_stream : Buffered_output_stream.t
  end

