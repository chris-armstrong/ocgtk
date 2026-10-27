class type simple_io_stream_t = object
  inherit Io_stream.io_stream_t
  method as_simple_io_stream : Raw.Simple_io_stream.t
end

class simple_io_stream : Raw.Simple_io_stream.t -> simple_io_stream_t

val new_ :
  Input_stream.input_stream_t ->
  Output_stream.output_stream_t ->
  simple_io_stream_t
