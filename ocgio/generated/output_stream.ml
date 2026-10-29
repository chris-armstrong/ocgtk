class type output_stream_t = object
  (** {2:methods Methods} *)

  method clear_pending : unit -> unit
  (** Clears the pending flag on [stream]. *)

  method close : Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Closes the stream, releasing resources related to it.

      Once the stream is closed, all other operations will return
      [G_IO_ERROR_CLOSED]. Closing a stream multiple times will not return an
      error.

      Closing a stream will automatically flush any outstanding buffers in the
      stream.

      Streams will be automatically closed when the last reference is dropped,
      but you might want to call this function to make sure resources are
      released as early as possible.

      Some streams might keep the backing store of the stream (e.g. a file
      descriptor) open after the stream is closed. See the documentation for the
      individual stream for details.

      On failure the first error that happened will be reported, but the close
      operation will finish as much as possible. A stream that failed to close
      will still return [G_IO_ERROR_CLOSED] for all operations. Still, it is
      important to check and report the error to the user, otherwise there might
      be a loss of data as all data might not be written.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned.
      Cancelling a close will still leave the stream closed, but there some
      streams can use a faster close that doesn't block to e.g. check errors. On
      cancellation (as with any error) there is no guarantee that all written
      data will reach the target. *)

  method close_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Closes an output stream. *)

  method flush : Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Forces a write of all user-space buffered data for the given [stream].
      Will block during the operation. Closing the stream will implicitly cause
      a flush.

      This function is optional for inherited classes.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. *)

  method flush_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes flushing an output stream. *)

  method has_pending : unit -> bool
  (** Checks if an output stream has pending actions. *)

  method is_closed : unit -> bool
  (** Checks if an output stream has already been closed. *)

  method is_closing : unit -> bool
  (** Checks if an output stream is being closed. This can be used inside e.g. a
      flush implementation to see if the flush (or other i/o operation) is
      called from within the closing operation. *)

  method set_pending : unit -> (bool, GError.t) result
  (** Sets [stream] to have actions pending. If the pending flag is already set
      or [stream] is closed, it will return [false] and set [error]. *)

  method splice :
    Input_stream.input_stream_t ->
    Enums.outputstreamspliceflags ->
    Cancellable.cancellable_t option ->
    (int, GError.t) result
  (** Splices an input stream into an output stream. *)

  method splice_finish : Async_result.async_result_t -> (int, GError.t) result
  (** Finishes an asynchronous stream splice operation. *)

  method write_bytes :
    Glib_bytes.t -> Cancellable.cancellable_t option -> (int, GError.t) result
  (** A wrapper function for g_output_stream_write() which takes a [GBytes] as
      input. This can be more convenient for use by language bindings or in
      other cases where the refcounted nature of [GBytes] is helpful over a bare
      pointer interface.

      However, note that this function may still perform partial writes, just
      like g_output_stream_write(). If that occurs, to continue writing, you
      will need to create a new [GBytes] containing just the remaining bytes,
      using g_bytes_new_from_bytes(). Passing the same [GBytes] instance
      multiple times potentially can result in duplicated data in the output
      stream. *)

  method write_bytes_finish :
    Async_result.async_result_t -> (int, GError.t) result
  (** Finishes a stream write-from-[GBytes] operation. *)

  method write_finish : Async_result.async_result_t -> (int, GError.t) result
  (** Finishes a stream write operation. *)

  (** {2:conversions Conversions} *)

  method as_output_stream : Raw.Output_stream.t
end

(* High-level class for OutputStream *)
class output_stream (obj : Raw.Output_stream.t) : output_stream_t =
  object (self)
    method clear_pending : unit -> unit =
      fun () -> Raw.Output_stream.clear_pending obj

    method close : Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Output_stream.close obj cancellable

    method close_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.Output_stream.close_finish obj result

    method flush : Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Output_stream.flush obj cancellable

    method flush_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.Output_stream.flush_finish obj result

    method has_pending : unit -> bool =
      fun () -> Raw.Output_stream.has_pending obj

    method is_closed : unit -> bool = fun () -> Raw.Output_stream.is_closed obj

    method is_closing : unit -> bool =
      fun () -> Raw.Output_stream.is_closing obj

    method set_pending : unit -> (bool, GError.t) result =
      fun () -> Raw.Output_stream.set_pending obj

    method splice :
        Input_stream.input_stream_t ->
        Enums.outputstreamspliceflags ->
        Cancellable.cancellable_t option ->
        (int, GError.t) result =
      fun source flags cancellable ->
        let source = source#as_input_stream in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Output_stream.splice obj source flags cancellable

    method splice_finish : Async_result.async_result_t -> (int, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.Output_stream.splice_finish obj result

    method write_bytes :
        Glib_bytes.t ->
        Cancellable.cancellable_t option ->
        (int, GError.t) result =
      fun bytes cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Output_stream.write_bytes obj bytes cancellable

    method write_bytes_finish :
        Async_result.async_result_t -> (int, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Output_stream.write_bytes_finish obj result

    method write_finish : Async_result.async_result_t -> (int, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.Output_stream.write_finish obj result

    method as_output_stream = obj
  end
