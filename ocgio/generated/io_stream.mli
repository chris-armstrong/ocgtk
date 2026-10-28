(** [GIOStream] represents an object that has both read and write streams.
    Generally the two streams act as separate input and output streams, but they
    share some common resources and state. For instance, for seekable streams,
    both streams may use the same position.

    Its methods, signals and properties are on {!class-type-io_stream_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Io_stream}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [IOStream].}

    [GIOStream] represents an object that has both read and write streams.
    Generally the two streams act as separate input and output streams, but they
    share some common resources and state. For instance, for seekable streams,
    both streams may use the same position.

    Examples of [GIOStream] objects are [Gio.SocketConnection], which represents
    a two-way network connection; and [Gio.FileIOStream], which represents a
    file handle opened in read-write mode.

    To do the actual reading and writing you need to get the substreams with
    [Gio.IOStream.get_input_stream] and [Gio.IOStream.get_output_stream].

    The [GIOStream] object owns the input and the output streams, not the other
    way around, so keeping the substreams alive will not keep the [GIOStream]
    object alive. If the [GIOStream] object is freed it will be closed, thus
    closing the substreams, so even if the substreams stay alive they will
    always return [G_IO_ERROR_CLOSED] for all operations.

    To close a stream use [Gio.IOStream.close] which will close the common
    stream object and also the individual substreams. You can also close the
    substreams themselves. In most cases this only marks the substream as
    closed, so further I/O on it fails but common state in the [GIOStream] may
    still be open. However, some streams may support ‘half-closed’ states where
    one direction of the stream is actually shut down.

    Operations on [GIOStream]s cannot be started while another operation on the
    [GIOStream] or its substreams is in progress. Specifically, an application
    can read from the [Gio.InputStream] and write to the [Gio.OutputStream]
    simultaneously (either in separate threads, or as asynchronous operations in
    the same thread), but an application cannot start any [GIOStream] operation
    while there is a [GIOStream], [GInputStream] or [GOutputStream] operation in
    progress, and an application can’t start any [GInputStream] or
    [GOutputStream] operation while there is a [GIOStream] operation in
    progress.

    This is a product of individual stream operations being associated with a
    given [GLib.MainContext] (the thread-default context at the time the
    operation was started), rather than entire streams being associated with a
    single [GMainContext].

    GIO may run operations on [GIOStream]s from other (worker) threads, and this
    may be exposed to application code in the behaviour of wrapper streams, such
    as [Gio.BufferedInputStream] or [Gio.TlsConnection]. With such wrapper APIs,
    application code may only run operations on the base (wrapped) stream when
    the wrapper stream is idle. Note that the semantics of such operations may
    not be well-defined due to the state the wrapper stream leaves the base
    stream in (though they are guaranteed not to crash). *)
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

class io_stream : Raw.Io_stream.t -> io_stream_t
(** Wraps a raw handle of {!Ocgio.Raw.Io_stream.t}. *)

(** {1:description Description}

    [GIOStream] represents an object that has both read and write streams.
    Generally the two streams act as separate input and output streams, but they
    share some common resources and state. For instance, for seekable streams,
    both streams may use the same position.

    Examples of [GIOStream] objects are [Gio.SocketConnection], which represents
    a two-way network connection; and [Gio.FileIOStream], which represents a
    file handle opened in read-write mode.

    To do the actual reading and writing you need to get the substreams with
    [Gio.IOStream.get_input_stream] and [Gio.IOStream.get_output_stream].

    The [GIOStream] object owns the input and the output streams, not the other
    way around, so keeping the substreams alive will not keep the [GIOStream]
    object alive. If the [GIOStream] object is freed it will be closed, thus
    closing the substreams, so even if the substreams stay alive they will
    always return [G_IO_ERROR_CLOSED] for all operations.

    To close a stream use [Gio.IOStream.close] which will close the common
    stream object and also the individual substreams. You can also close the
    substreams themselves. In most cases this only marks the substream as
    closed, so further I/O on it fails but common state in the [GIOStream] may
    still be open. However, some streams may support ‘half-closed’ states where
    one direction of the stream is actually shut down.

    Operations on [GIOStream]s cannot be started while another operation on the
    [GIOStream] or its substreams is in progress. Specifically, an application
    can read from the [Gio.InputStream] and write to the [Gio.OutputStream]
    simultaneously (either in separate threads, or as asynchronous operations in
    the same thread), but an application cannot start any [GIOStream] operation
    while there is a [GIOStream], [GInputStream] or [GOutputStream] operation in
    progress, and an application can’t start any [GInputStream] or
    [GOutputStream] operation while there is a [GIOStream] operation in
    progress.

    This is a product of individual stream operations being associated with a
    given [GLib.MainContext] (the thread-default context at the time the
    operation was started), rather than entire streams being associated with a
    single [GMainContext].

    GIO may run operations on [GIOStream]s from other (worker) threads, and this
    may be exposed to application code in the behaviour of wrapper streams, such
    as [Gio.BufferedInputStream] or [Gio.TlsConnection]. With such wrapper APIs,
    application code may only run operations on the base (wrapped) stream when
    the wrapper stream is idle. Note that the semantics of such operations may
    not be well-defined due to the state the wrapper stream leaves the base
    stream in (though they are guaranteed not to crash). *)

(** {1:constructors Constructors} *)

(** This is an abstract class that can't be instantiated directly. Refer to its
    subclasses for a concrete implementation. *)
