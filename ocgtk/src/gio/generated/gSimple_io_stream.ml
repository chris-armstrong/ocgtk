class type simple_io_stream_t = object
    inherit GIo_stream.io_stream_t
    method as_simple_io_stream : Simple_io_stream.t
end

(* High-level class for SimpleIOStream *)
class simple_io_stream (obj : Simple_io_stream.t) : simple_io_stream_t = object (self)
  inherit GIo_stream.io_stream (Obj.magic obj : Io_stream.t)

    method as_simple_io_stream = obj
end

