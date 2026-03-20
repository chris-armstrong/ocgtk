class type buffered_input_stream_t = object
    method read_byte : GCancellable.cancellable_t option -> (int, GError.t) result
    method as_buffered_input_stream : Buffered_input_stream.t
end

(* High-level class for BufferedInputStream *)
class buffered_input_stream (obj : Buffered_input_stream.t) : buffered_input_stream_t = object (self)

  method read_byte : GCancellable.cancellable_t option -> (int, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Buffered_input_stream.read_byte obj cancellable)

    method as_buffered_input_stream = obj
end

