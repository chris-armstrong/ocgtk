class type io_stream_adapter_t = object
    method as_io_stream_adapter : Io_stream_adapter.t
end

class io_stream_adapter : Io_stream_adapter.t -> io_stream_adapter_t

