(** Buffered input stream implements [Gio.FilterInputStream] and provides for
    buffered reads.

    By default, [GBufferedInputStream]'s buffer size is set at 4 kilobytes.

    To create a buffered input stream, use [Gio.BufferedInputStream.new], or
    [Gio.BufferedInputStream.new_sized] to specify the buffer's size at
    construction.

    To get the size of a buffer within a buffered input stream, use
    [Gio.BufferedInputStream.get_buffer_size]. To change the size of a buffered
    input stream's buffer, use [Gio.BufferedInputStream.set_buffer_size]. Note
    that the buffer's size cannot be reduced below the size of the data within
    the buffer.

    Its methods, signals and properties are on
    {!class-type-buffered_input_stream_t}. The functions it is built on are in
    {!Ocgio.Raw.Buffered_input_stream}. *)

(** The methods, signals and properties of a [GBufferedInputStream]. *)
class type buffered_input_stream_t = object
  inherit Filter_input_stream.filter_input_stream_t
  inherit Seekable.seekable_t

  method fill :
    int -> Cancellable.cancellable_t option -> (int, GError.t) result

  method fill_finish : Async_result.async_result_t -> (int, GError.t) result
  method get_available : unit -> Gsize.t
  method get_buffer_size : unit -> Gsize.t
  method read_byte : Cancellable.cancellable_t option -> (int, GError.t) result
  method set_buffer_size : Gsize.t -> unit
  method as_buffered_input_stream : Raw.Buffered_input_stream.t
end

class buffered_input_stream :
  Raw.Buffered_input_stream.t ->
  buffered_input_stream_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Buffered_input_stream.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GBufferedInputStream], give one already wrapped. *)

val new_ : Input_stream.input_stream_t -> buffered_input_stream_t

val new_sized :
  Input_stream.input_stream_t -> Gsize.t -> buffered_input_stream_t
