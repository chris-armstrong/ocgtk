(* GENERATED CODE - DO NOT EDIT *)
(* IOStream: IOStream *)

(** [GIOStream] represents an object that has both read and write streams.
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

type t = [ `io_stream | `object_ ] Gobject.obj

(* Methods *)

external set_pending : t -> (bool, GError.t) result
  = "ml_g_io_stream_set_pending"
(** Sets [stream] to have actions pending. If the pending flag is already set or
    [stream] is closed, it will return [FALSE] and set [error]. *)

external is_closed : t -> bool = "ml_g_io_stream_is_closed"
(** Checks if a stream is closed. *)

external has_pending : t -> bool = "ml_g_io_stream_has_pending"
(** Checks if a stream has pending actions. *)

external get_output_stream : t -> Output_stream.t
  = "ml_g_io_stream_get_output_stream"
(** Gets the output stream for this object. This is used for writing. *)

external get_input_stream : t -> Input_stream.t
  = "ml_g_io_stream_get_input_stream"
(** Gets the input stream for this object. This is used for reading. *)

external close_finish : t -> Async_result.t -> (bool, GError.t) result
  = "ml_g_io_stream_close_finish"
(** Closes a stream. *)

external close : t -> Cancellable.t option -> (bool, GError.t) result
  = "ml_g_io_stream_close"
(** Closes the stream, releasing resources related to it. This will also close
    the individual input and output streams, if they are not already closed.

    Once the stream is closed, all other operations will return
    [G_IO_ERROR_CLOSED]. Closing a stream multiple times will not return an
    error.

    Closing a stream will automatically flush any outstanding buffers in the
    stream.

    Streams will be automatically closed when the last reference is dropped, but
    you might want to call this function to make sure resources are released as
    early as possible.

    Some streams might keep the backing store of the stream (e.g. a file
    descriptor) open after the stream is closed. See the documentation for the
    individual stream for details.

    On failure the first error that happened will be reported, but the close
    operation will finish as much as possible. A stream that failed to close
    will still return [G_IO_ERROR_CLOSED] for all operations. Still, it is
    important to check and report the error to the user, otherwise there might
    be a loss of data as all data might not be written.

    If [cancellable] is not NULL, then the operation can be cancelled by
    triggering the cancellable object from another thread. If the operation was
    cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. Cancelling a
    close will still leave the stream closed, but some streams can use a faster
    close that doesn't block to e.g. check errors.

    The default implementation of this method just calls close on the individual
    input/output streams. *)

external clear_pending : t -> unit = "ml_g_io_stream_clear_pending"
(** Clears the pending flag on [stream]. *)

(* Properties *)
