class type io_stream_adapter_t = object
  (** {2:conversions Conversions} *)

  method as_io_stream_adapter : Raw.Io_stream_adapter.t
end

(* High-level class for IOStreamAdapter *)
class io_stream_adapter (obj : Raw.Io_stream_adapter.t) : io_stream_adapter_t =
  object (self)
    method as_io_stream_adapter = obj
  end
