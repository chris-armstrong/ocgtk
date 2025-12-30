class simple_io_stream : Simple_io_stream.t ->
  object
    method input_stream : GInput_stream.input_stream
    method output_stream : GOutput_stream.output_stream
    method as_simple_io_stream : Simple_io_stream.t
  end

