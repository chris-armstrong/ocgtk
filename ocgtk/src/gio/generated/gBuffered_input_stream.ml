class type buffered_input_stream_t = object
    inherit GFilter_input_stream.filter_input_stream_t
    inherit GSeekable.seekable_t
    method fill : int -> GCancellable.cancellable_t option -> (int, GError.t) result
    method fill_finish : GAsync_result.async_result_t -> (int, GError.t) result
    method get_available : unit -> Gsize.t
    method get_buffer_size : unit -> Gsize.t
    method read_byte : GCancellable.cancellable_t option -> (int, GError.t) result
    method set_buffer_size : Gsize.t -> unit
    method as_buffered_input_stream : Buffered_input_stream.t
end

(* High-level class for BufferedInputStream *)
class buffered_input_stream (obj : Buffered_input_stream.t) : buffered_input_stream_t = object (self)
  inherit GFilter_input_stream.filter_input_stream (obj :> Filter_input_stream.t)
  inherit GSeekable.seekable (Seekable.from_gobject obj)

  method fill : int -> GCancellable.cancellable_t option -> (int, GError.t) result =
    fun count cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Buffered_input_stream.fill obj count cancellable)

  method fill_finish : GAsync_result.async_result_t -> (int, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      (Buffered_input_stream.fill_finish obj result)

  method get_available : unit -> Gsize.t =
    fun () ->
      (Buffered_input_stream.get_available obj)

  method get_buffer_size : unit -> Gsize.t =
    fun () ->
      (Buffered_input_stream.get_buffer_size obj)

  method read_byte : GCancellable.cancellable_t option -> (int, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Buffered_input_stream.read_byte obj cancellable)

  method set_buffer_size : Gsize.t -> unit =
    fun size ->
      (Buffered_input_stream.set_buffer_size obj size)

    method as_buffered_input_stream = obj
end

let new_ (base_stream : GInput_stream.input_stream_t) : buffered_input_stream_t =
  let base_stream = base_stream#as_input_stream in
  let obj_ = Buffered_input_stream.new_ base_stream in
  new buffered_input_stream obj_

let new_sized (base_stream : GInput_stream.input_stream_t) (size : Gsize.t) : buffered_input_stream_t =
  let base_stream = base_stream#as_input_stream in
  let obj_ = Buffered_input_stream.new_sized base_stream size in
  new buffered_input_stream obj_

