class type buffered_input_stream_t = object
    inherit GFilter_input_stream.filter_input_stream_t
    method read_byte : GCancellable.cancellable_t option -> (int, GError.t) result
    method as_buffered_input_stream : Buffered_input_stream.t
end

(* High-level class for BufferedInputStream *)
class buffered_input_stream (obj : Buffered_input_stream.t) : buffered_input_stream_t = object (self)
  inherit GFilter_input_stream.filter_input_stream (obj :> Filter_input_stream.t)

  method read_byte : GCancellable.cancellable_t option -> (int, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Buffered_input_stream.read_byte obj cancellable)

    method as_buffered_input_stream = obj
end

let new_ (base_stream : GInput_stream.input_stream_t) : buffered_input_stream_t =
  let base_stream = base_stream#as_input_stream in
  new buffered_input_stream (Buffered_input_stream.new_ base_stream)

