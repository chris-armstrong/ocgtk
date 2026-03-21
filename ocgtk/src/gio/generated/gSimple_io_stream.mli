class type simple_io_stream_t = object
    method input_stream : GInput_stream.input_stream_t
    method output_stream : GOutput_stream.output_stream_t
    method as_simple_io_stream : Simple_io_stream.t
end

class simple_io_stream : Simple_io_stream.t -> simple_io_stream_t

