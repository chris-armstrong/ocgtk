(* High-level class for SimpleIOStream *)
class simple_io_stream (obj : Simple_io_stream.t) = object (self)

  method input_stream = new GInput_stream.input_stream (Simple_io_stream.get_input_stream obj)

  method output_stream = new GOutput_stream.output_stream (Simple_io_stream.get_output_stream obj)

    method as_simple_io_stream = obj
end

