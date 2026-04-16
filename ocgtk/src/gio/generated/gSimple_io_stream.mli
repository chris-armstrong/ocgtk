class type simple_io_stream_t = object
  inherit GIo_stream.io_stream_t
  method as_simple_io_stream : Simple_io_stream.t
end

class simple_io_stream : Simple_io_stream.t -> simple_io_stream_t

val new_ :
  GInput_stream.input_stream_t ->
  GOutput_stream.output_stream_t ->
  simple_io_stream_t
