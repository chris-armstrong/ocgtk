class type input_stream_t = object
  (** {2:methods Methods} *)

  method clear_pending : unit -> unit
  (** Clears the pending flag on [stream]. *)

  method close : Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Closes the stream, releasing resources related to it.

      Once the stream is closed, all other operations will return
      [G_IO_ERROR_CLOSED]. Closing a stream multiple times will not return an
      error.

      Streams will be automatically closed when the last reference is dropped,
      but you might want to call this function to make sure resources are
      released as early as possible.

      Some streams might keep the backing store of the stream (e.g. a file
      descriptor) open after the stream is closed. See the documentation for the
      individual stream for details.

      On failure the first error that happened will be reported, but the close
      operation will finish as much as possible. A stream that failed to close
      will still return [G_IO_ERROR_CLOSED] for all operations. Still, it is
      important to check and report the error to the user.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned.
      Cancelling a close will still leave the stream closed, but some streams
      can use a faster close that doesn't block to e.g. check errors. *)

  method close_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes closing a stream asynchronously, started from
      [g_input_stream_close_async ()]. *)

  method has_pending : unit -> bool
  (** Checks if an input stream has pending actions. *)

  method is_closed : unit -> bool
  (** Checks if an input stream is closed. *)

  method read_bytes :
    Gsize.t ->
    Cancellable.cancellable_t option ->
    (Glib_bytes.t, GError.t) result
  (** Like [g_input_stream_read ()], this tries to read [count] bytes from the
      stream in a blocking fashion. However, rather than reading into a
      user-supplied buffer, this will create a new [GBytes] containing the data
      that was read. This may be easier to use from language bindings.

      If count is zero, returns a zero-length [GBytes] and does nothing. A value
      of [count] larger than [G_MAXSSIZE] will cause a
      [G_IO_ERROR_INVALID_ARGUMENT] error.

      On success, a new [GBytes] is returned. It is not an error if the size of
      this object is not the same as the requested size, as it can happen e.g.
      near the end of a file. A zero-length [GBytes] is returned on end of file
      (or if [count] is zero), but never otherwise.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.

      On error [None] is returned and [error] is set accordingly. *)

  method read_bytes_finish :
    Async_result.async_result_t -> (Glib_bytes.t, GError.t) result
  (** Finishes an asynchronous stream read-into-[GBytes] operation. *)

  method read_finish : Async_result.async_result_t -> (int, GError.t) result
  (** Finishes an asynchronous stream read operation. *)

  method set_pending : unit -> (bool, GError.t) result
  (** Sets [stream] to have actions pending. If the pending flag is already set
      or [stream] is closed, it will return [false] and set [error]. *)

  method skip :
    Gsize.t -> Cancellable.cancellable_t option -> (int, GError.t) result
  (** Tries to skip [count] bytes from the stream. Will block during the
      operation.

      This is identical to [g_input_stream_read ()], from a behaviour
      standpoint, but the bytes that are skipped are not returned to the user.
      Some streams have an implementation that is more efficient than reading
      the data.

      This function is optional for inherited classes, as the default
      implementation emulates it using read.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error. *)

  method skip_finish : Async_result.async_result_t -> (int, GError.t) result
  (** Finishes a stream skip operation. *)

  (** {2:conversions Conversions} *)

  method as_input_stream : Raw.Input_stream.t
end

(* High-level class for InputStream *)
class input_stream (obj : Raw.Input_stream.t) : input_stream_t =
  object (self)
    method clear_pending : unit -> unit =
      fun () -> Raw.Input_stream.clear_pending obj

    method close : Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Input_stream.close obj cancellable

    method close_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.Input_stream.close_finish obj result

    method has_pending : unit -> bool =
      fun () -> Raw.Input_stream.has_pending obj

    method is_closed : unit -> bool = fun () -> Raw.Input_stream.is_closed obj

    method read_bytes :
        Gsize.t ->
        Cancellable.cancellable_t option ->
        (Glib_bytes.t, GError.t) result =
      fun count cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Input_stream.read_bytes obj count cancellable

    method read_bytes_finish :
        Async_result.async_result_t -> (Glib_bytes.t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Input_stream.read_bytes_finish obj result

    method read_finish : Async_result.async_result_t -> (int, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Input_stream.read_finish obj result

    method set_pending : unit -> (bool, GError.t) result =
      fun () -> Raw.Input_stream.set_pending obj

    method skip :
        Gsize.t -> Cancellable.cancellable_t option -> (int, GError.t) result =
      fun count cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Input_stream.skip obj count cancellable

    method skip_finish : Async_result.async_result_t -> (int, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Input_stream.skip_finish obj result

    method as_input_stream = obj
  end
