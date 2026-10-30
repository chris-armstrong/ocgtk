class type simple_io_stream_t = object
  inherit Io_stream.io_stream_t

  (** {2:conversions Conversions} *)

  method as_simple_io_stream : Raw.Simple_io_stream.t
end

(* High-level class for SimpleIOStream *)
class simple_io_stream (obj : Raw.Simple_io_stream.t) : simple_io_stream_t =
  object (self)
    inherit Io_stream.io_stream (obj :> Raw.Io_stream.t)
    method as_simple_io_stream = obj
  end

let new_ (input_stream : Input_stream.input_stream_t)
    (output_stream : Output_stream.output_stream_t) : simple_io_stream_t =
  let input_stream = input_stream#as_input_stream in
  let output_stream = output_stream#as_output_stream in
  let obj_ = Raw.Simple_io_stream.new_ input_stream output_stream in
  new simple_io_stream obj_
