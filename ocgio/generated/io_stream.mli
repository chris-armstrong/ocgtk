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
    stream in (though they are guaranteed not to crash).

    Its methods, signals and properties are on {!class-type-io_stream_t}. The
    functions it is built on are in {!Ocgio.Raw.Io_stream}. *)

(** The methods, signals and properties of a [GIOStream]. *)
class type io_stream_t = object
  method clear_pending : unit -> unit
  method close : Cancellable.cancellable_t option -> (bool, GError.t) result
  method close_finish : Async_result.async_result_t -> (bool, GError.t) result
  method get_input_stream : unit -> Input_stream.input_stream_t
  method get_output_stream : unit -> Output_stream.output_stream_t
  method has_pending : unit -> bool
  method is_closed : unit -> bool
  method set_pending : unit -> (bool, GError.t) result
  method as_io_stream : Raw.Io_stream.t
end

class io_stream : Raw.Io_stream.t -> io_stream_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Io_stream.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GIOStream], give one already wrapped. *)
