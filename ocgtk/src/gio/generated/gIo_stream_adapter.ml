class type io_stream_adapter_t = object
    method as_io_stream_adapter : Io_stream_adapter.t
end

(* High-level class for IOStreamAdapter *)
class io_stream_adapter (obj : Io_stream_adapter.t) : io_stream_adapter_t = object (self)

    method as_io_stream_adapter = obj
end

