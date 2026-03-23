class type simple_io_stream_t = object
    inherit GIo_stream.io_stream_t
    method as_simple_io_stream : Simple_io_stream.t
end

(* High-level class for SimpleIOStream *)
class simple_io_stream (obj : Simple_io_stream.t) : simple_io_stream_t = object (self)
  inherit GIo_stream.io_stream (Obj.magic obj : Io_stream.t)

    method as_simple_io_stream = obj
end

let new_ (input_stream : GInput_stream.input_stream_t) (output_stream : GOutput_stream.output_stream_t) : simple_io_stream_t =
  let input_stream = input_stream#as_input_stream in
  let output_stream = output_stream#as_output_stream in
  new simple_io_stream (Simple_io_stream.new_ input_stream output_stream)

