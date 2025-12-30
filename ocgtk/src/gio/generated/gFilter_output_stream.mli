class filter_output_stream : Filter_output_stream.t ->
  object
    method get_base_stream : unit -> GOutput_stream.output_stream
    method get_close_base_stream : unit -> bool
    method set_close_base_stream : bool -> unit
    method as_filter_output_stream : Filter_output_stream.t
  end

