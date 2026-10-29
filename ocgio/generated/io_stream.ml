class type io_stream_t = object
  (** {2:methods Methods} *)

  method clear_pending : unit -> unit
  (** Clears the pending flag on [stream]. *)

  method close : Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Closes the stream, releasing resources related to it. This will also close
      the individual input and output streams, if they are not already closed.

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

      If [cancellable] is not NULL, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned.
      Cancelling a close will still leave the stream closed, but some streams
      can use a faster close that doesn't block to e.g. check errors.

      The default implementation of this method just calls close on the
      individual input/output streams. *)

  method close_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Closes a stream. *)

  method get_input_stream : unit -> Input_stream.input_stream_t
  (** Gets the input stream for this object. This is used for reading. *)

  method get_output_stream : unit -> Output_stream.output_stream_t
  (** Gets the output stream for this object. This is used for writing. *)

  method has_pending : unit -> bool
  (** Checks if a stream has pending actions. *)

  method is_closed : unit -> bool
  (** Checks if a stream is closed. *)

  method set_pending : unit -> (bool, GError.t) result
  (** Sets [stream] to have actions pending. If the pending flag is already set
      or [stream] is closed, it will return [FALSE] and set [error]. *)

  (** {2:conversions Conversions} *)

  method as_io_stream : Raw.Io_stream.t
end

(* High-level class for IOStream *)
class io_stream (obj : Raw.Io_stream.t) : io_stream_t =
  object (self)
    method clear_pending : unit -> unit =
      fun () -> Raw.Io_stream.clear_pending obj

    method close : Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Io_stream.close obj cancellable

    method close_finish : Async_result.async_result_t -> (bool, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.Io_stream.close_finish obj result

    method get_input_stream : unit -> Input_stream.input_stream_t =
      fun () ->
        new Input_stream.input_stream (Raw.Io_stream.get_input_stream obj)

    method get_output_stream : unit -> Output_stream.output_stream_t =
      fun () ->
        new Output_stream.output_stream (Raw.Io_stream.get_output_stream obj)

    method has_pending : unit -> bool = fun () -> Raw.Io_stream.has_pending obj
    method is_closed : unit -> bool = fun () -> Raw.Io_stream.is_closed obj

    method set_pending : unit -> (bool, GError.t) result =
      fun () -> Raw.Io_stream.set_pending obj

    method as_io_stream = obj
  end
