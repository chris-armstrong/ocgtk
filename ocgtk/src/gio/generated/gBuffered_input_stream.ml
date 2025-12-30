(* High-level class for BufferedInputStream *)
class buffered_input_stream (obj : Buffered_input_stream.t) = object (self)

  method read_byte : 'p1. (#GCancellable.cancellable as 'p1) option -> (int, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Buffered_input_stream.read_byte obj cancellable)

    method as_buffered_input_stream = obj
end

