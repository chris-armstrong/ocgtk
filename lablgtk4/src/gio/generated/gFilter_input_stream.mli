class filter_input_stream : Filter_input_stream.t ->
  object
    method get_base_stream : unit -> GInput_stream.input_stream
    method get_close_base_stream : unit -> bool
    method set_close_base_stream : bool -> unit
    method as_filter_input_stream : Filter_input_stream.t
  end

