(** [GOutputStream] is a base class for implementing streaming output.

    It has functions to write to a stream ([Gio.OutputStream.write]), to close a
    stream ([Gio.OutputStream.close]) and to flush pending writes
    ([Gio.OutputStream.flush]).

    To copy the content of an input stream to an output stream without manually
    handling the reads and writes, use [Gio.OutputStream.splice].

    See the documentation for [Gio.IOStream] for details of thread safety of
    streaming APIs.

    All of these functions have async variants too.

    All classes derived from [GOutputStream] {i should} implement synchronous
    writing, splicing, flushing and closing streams, but {i may} implement
    asynchronous versions.

    Its methods, signals and properties are on {!class-type-output_stream_t}.
    The functions it is built on are in {!Ocgio.Raw.Output_stream}. *)

(** The methods, signals and properties of a [GOutputStream]. *)
class type output_stream_t = object
  method clear_pending : unit -> unit
  method close : Cancellable.cancellable_t option -> (bool, GError.t) result
  method close_finish : Async_result.async_result_t -> (bool, GError.t) result
  method flush : Cancellable.cancellable_t option -> (bool, GError.t) result
  method flush_finish : Async_result.async_result_t -> (bool, GError.t) result
  method has_pending : unit -> bool
  method is_closed : unit -> bool
  method is_closing : unit -> bool
  method set_pending : unit -> (bool, GError.t) result

  method splice :
    Input_stream.input_stream_t ->
    Enums.outputstreamspliceflags ->
    Cancellable.cancellable_t option ->
    (int, GError.t) result

  method splice_finish : Async_result.async_result_t -> (int, GError.t) result

  method write_bytes :
    Glib_bytes.t -> Cancellable.cancellable_t option -> (int, GError.t) result

  method write_bytes_finish :
    Async_result.async_result_t -> (int, GError.t) result

  method write_finish : Async_result.async_result_t -> (int, GError.t) result
  method as_output_stream : Raw.Output_stream.t
end

class output_stream : Raw.Output_stream.t -> output_stream_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Output_stream.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GOutputStream], give one already wrapped. *)
