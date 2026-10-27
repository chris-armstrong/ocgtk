(** [GInputStream] is a base class for implementing streaming input.

    It has functions to read from a stream ([Gio.InputStream.read]), to close a
    stream ([Gio.InputStream.close]) and to skip some content
    ([Gio.InputStream.skip]).

    To copy the content of an input stream to an output stream without manually
    handling the reads and writes, use [Gio.OutputStream.splice].

    See the documentation for [Gio.IOStream] for details of thread safety of
    streaming APIs.

    All of these functions have async variants too.

    Its methods, signals and properties are on {!class-type-input_stream_t}. The
    functions it is built on are in {!Ocgio.Raw.Input_stream}. *)

(** The methods, signals and properties of a [GInputStream]. *)
class type input_stream_t = object
  method clear_pending : unit -> unit
  method close : Cancellable.cancellable_t option -> (bool, GError.t) result
  method close_finish : Async_result.async_result_t -> (bool, GError.t) result
  method has_pending : unit -> bool
  method is_closed : unit -> bool

  method read_bytes :
    Gsize.t ->
    Cancellable.cancellable_t option ->
    (Glib_bytes.t, GError.t) result

  method read_bytes_finish :
    Async_result.async_result_t -> (Glib_bytes.t, GError.t) result

  method read_finish : Async_result.async_result_t -> (int, GError.t) result
  method set_pending : unit -> (bool, GError.t) result

  method skip :
    Gsize.t -> Cancellable.cancellable_t option -> (int, GError.t) result

  method skip_finish : Async_result.async_result_t -> (int, GError.t) result
  method as_input_stream : Raw.Input_stream.t
end

class input_stream : Raw.Input_stream.t -> input_stream_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Input_stream.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GInputStream], give one already wrapped. *)
