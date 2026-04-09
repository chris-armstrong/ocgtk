class type buffered_input_stream_t = object
    inherit GFilter_input_stream.filter_input_stream_t
    method fill : int -> GCancellable.cancellable_t option -> (int, GError.t) result
    method get_available : unit -> int
    method get_buffer_size : unit -> int
    method read_byte : GCancellable.cancellable_t option -> (int, GError.t) result
    method set_buffer_size : int -> unit
    method as_buffered_input_stream : Buffered_input_stream.t
end

(* High-level class for BufferedInputStream *)
class buffered_input_stream (obj : Buffered_input_stream.t) : buffered_input_stream_t = object (self)
  inherit GFilter_input_stream.filter_input_stream (obj :> Filter_input_stream.t)

  method fill : int -> GCancellable.cancellable_t option -> (int, GError.t) result =
    fun count cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Buffered_input_stream.fill obj count cancellable)

  method get_available : unit -> int =
    fun () ->
      (Buffered_input_stream.get_available obj)

  method get_buffer_size : unit -> int =
    fun () ->
      (Buffered_input_stream.get_buffer_size obj)

  method read_byte : GCancellable.cancellable_t option -> (int, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Buffered_input_stream.read_byte obj cancellable)

  method set_buffer_size : int -> unit =
    fun size ->
      (Buffered_input_stream.set_buffer_size obj size)

    method as_buffered_input_stream = obj
end

let new_ (base_stream : GInput_stream.input_stream_t) : buffered_input_stream_t =
  let base_stream = base_stream#as_input_stream in
  let obj_ = Buffered_input_stream.new_ base_stream in
  new buffered_input_stream obj_

let new_sized (base_stream : GInput_stream.input_stream_t) (size : int) : buffered_input_stream_t =
  let base_stream = base_stream#as_input_stream in
  let obj_ = Buffered_input_stream.new_sized base_stream size in
  new buffered_input_stream obj_

