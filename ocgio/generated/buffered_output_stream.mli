(** Buffered output stream implements [Gio.FilterOutputStream] and provides for
    buffered writes.

    By default, [GBufferedOutputStream]'s buffer size is set at 4 kilobytes.

    To create a buffered output stream, use [Gio.BufferedOutputStream.new], or
    [Gio.BufferedOutputStream.new_sized] to specify the buffer's size at
    construction.

    To get the size of a buffer within a buffered input stream, use
    [Gio.BufferedOutputStream.get_buffer_size]. To change the size of a buffered
    output stream's buffer, use [Gio.BufferedOutputStream.set_buffer_size]. Note
    that the buffer's size cannot be reduced below the size of the data within
    the buffer.

    Its methods, signals and properties are on
    {!class-type-buffered_output_stream_t}. The functions it is built on are in
    {!Ocgio.Raw.Buffered_output_stream}. *)

(** The methods, signals and properties of a [GBufferedOutputStream]. *)
class type buffered_output_stream_t = object
  inherit Filter_output_stream.filter_output_stream_t
  inherit Seekable.seekable_t
  method get_auto_grow : unit -> bool
  method get_buffer_size : unit -> Gsize.t
  method set_auto_grow : bool -> unit
  method set_buffer_size : Gsize.t -> unit
  method as_buffered_output_stream : Raw.Buffered_output_stream.t
end

class buffered_output_stream :
  Raw.Buffered_output_stream.t ->
  buffered_output_stream_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Buffered_output_stream.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GBufferedOutputStream], give one already wrapped. *)

val new_ : Output_stream.output_stream_t -> buffered_output_stream_t

val new_sized :
  Output_stream.output_stream_t -> Gsize.t -> buffered_output_stream_t
