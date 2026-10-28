class type buffered_input_stream_t = object
  inherit Filter_input_stream.filter_input_stream_t
  inherit Seekable.seekable_t

  method fill :
    int -> Cancellable.cancellable_t option -> (int, GError.t) result
  (** Tries to read [count] bytes from the stream into the buffer. Will block
      during this read.

      If [count] is zero, returns zero and does nothing. A value of [count]
      larger than [G_MAXSSIZE] will cause a [Gio.IOErrorEnum.INVALID_ARGUMENT]
      error.

      On success, the number of bytes read into the buffer is returned. It is
      not an error if this is not the same as the requested size, as it can
      happen e.g. near the end of a file. Zero is returned on end of file (or if
      [count] is zero), but never otherwise.

      If [count] is -1 then the attempted read size is equal to the number of
      bytes that are required to fill the buffer.

      If [cancellable] is not [NULL], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [Gio.IOErrorEnum.CANCELLED] will be returned. If
      an operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.

      On error [-1] is returned and [error] is set accordingly.

      For the asynchronous, non-blocking, version of this function, see
      [Gio.BufferedInputStream.fill_async]. *)

  method fill_finish : Async_result.async_result_t -> (int, GError.t) result
  (** Finishes an asynchronous read. *)

  method get_available : unit -> Gsize.t
  (** Gets the size of the available data within the stream. *)

  method get_buffer_size : unit -> Gsize.t
  (** Gets the size of the input buffer. *)

  method read_byte : Cancellable.cancellable_t option -> (int, GError.t) result
  (** Tries to read a single byte from the stream or the buffer. Will block
      during this read.

      On success, the byte read from the stream is returned. On end of stream
      [-1] is returned but it's not an exceptional error and [error] is not set.

      If [cancellable] is not [NULL], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [Gio.IOErrorEnum.CANCELLED] will be returned. If
      an operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.

      On error [-1] is returned and [error] is set accordingly. *)

  method set_buffer_size : Gsize.t -> unit
  (** Sets the size of the internal buffer of [stream] to [size], or to the size
      of the contents of the buffer. The buffer can never be resized smaller
      than its current contents. *)

  method as_buffered_input_stream : Raw.Buffered_input_stream.t
end

(* High-level class for BufferedInputStream *)
class buffered_input_stream (obj : Raw.Buffered_input_stream.t) :
  buffered_input_stream_t =
  object (self)
    inherit
      Filter_input_stream.filter_input_stream (obj :> Raw.Filter_input_stream.t)

    inherit Seekable.seekable (Raw.Seekable.from_gobject obj)

    method fill :
        int -> Cancellable.cancellable_t option -> (int, GError.t) result =
      fun count cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Buffered_input_stream.fill obj count cancellable

    method fill_finish : Async_result.async_result_t -> (int, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Buffered_input_stream.fill_finish obj result

    method get_available : unit -> Gsize.t =
      fun () -> Raw.Buffered_input_stream.get_available obj

    method get_buffer_size : unit -> Gsize.t =
      fun () -> Raw.Buffered_input_stream.get_buffer_size obj

    method read_byte :
        Cancellable.cancellable_t option -> (int, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Buffered_input_stream.read_byte obj cancellable

    method set_buffer_size : Gsize.t -> unit =
      fun size -> Raw.Buffered_input_stream.set_buffer_size obj size

    method as_buffered_input_stream = obj
  end

let new_ (base_stream : Input_stream.input_stream_t) : buffered_input_stream_t =
  let base_stream = base_stream#as_input_stream in
  let obj_ = Raw.Buffered_input_stream.new_ base_stream in
  new buffered_input_stream obj_

let new_sized (base_stream : Input_stream.input_stream_t) (size : Gsize.t) :
    buffered_input_stream_t =
  let base_stream = base_stream#as_input_stream in
  let obj_ = Raw.Buffered_input_stream.new_sized base_stream size in
  new buffered_input_stream obj_
