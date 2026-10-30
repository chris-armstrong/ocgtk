(** Buffered output stream implements
    {{!Ocgio.Filter_output_stream.class-type-filter_output_stream_t}[Gio.FilterOutputStream]}
    and provides for buffered writes.

    Its methods, signals and properties are on
    {!class-type-buffered_output_stream_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgio.Raw.Buffered_output_stream}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [BufferedOutputStream].}

    Inherits from:
    {{!Ocgio.Filter_output_stream.class-type-filter_output_stream_t}Ocgio.Filter_output_stream}

    Implements:
    - {{!Ocgio.Seekable.class-type-seekable_t}Ocgio.Seekable}

    Buffered output stream implements
    {{!Ocgio.Filter_output_stream.class-type-filter_output_stream_t}[Gio.FilterOutputStream]}
    and provides for buffered writes.

    By default, [GBufferedOutputStream]'s buffer size is set at 4 kilobytes.

    To create a buffered output stream, use
    {{!Ocgio.Buffered_output_stream.val-new_}[Gio.BufferedOutputStream.new]}, or
    {{!Ocgio.Buffered_output_stream.val-new_sized}[Gio.BufferedOutputStream.new_sized]}
    to specify the buffer's size at construction.

    To get the size of a buffer within a buffered input stream, use
    {{!Ocgio.Buffered_output_stream.class-type-buffered_output_stream_t.method-get_buffer_size}
     [Gio.BufferedOutputStream.get_buffer_size]}. To change the size of a
    buffered output stream's buffer, use
    {{!Ocgio.Buffered_output_stream.class-type-buffered_output_stream_t.method-set_buffer_size}
     [Gio.BufferedOutputStream.set_buffer_size]}. Note that the buffer's size
    cannot be reduced below the size of the data within the buffer. *)
class type buffered_output_stream_t = object
  inherit Filter_output_stream.filter_output_stream_t
  inherit Seekable.seekable_t

  (** {2:methods Methods} *)

  method get_auto_grow : unit -> bool
  (** Checks if the buffer automatically grows as data is added. *)

  method get_buffer_size : unit -> Gsize.t
  (** Gets the size of the buffer in the [stream]. *)

  method set_auto_grow : bool -> unit
  (** Sets whether or not the [stream]'s buffer should automatically grow. If
      [auto_grow] is true, then each write will just make the buffer larger, and
      you must manually flush the buffer to actually write out the data to the
      underlying stream. *)

  method set_buffer_size : Gsize.t -> unit
  (** Sets the size of the internal buffer to [size]. *)

  (** {2:conversions Conversions} *)

  method as_buffered_output_stream : Raw.Buffered_output_stream.t
end

class buffered_output_stream :
  Raw.Buffered_output_stream.t ->
  buffered_output_stream_t
(** Wraps a raw handle of {!Ocgio.Raw.Buffered_output_stream.t}. *)

(** {1:description Description}

    Buffered output stream implements
    {{!Ocgio.Filter_output_stream.class-type-filter_output_stream_t}[Gio.FilterOutputStream]}
    and provides for buffered writes.

    By default, [GBufferedOutputStream]'s buffer size is set at 4 kilobytes.

    To create a buffered output stream, use
    {{!Ocgio.Buffered_output_stream.val-new_}[Gio.BufferedOutputStream.new]}, or
    {{!Ocgio.Buffered_output_stream.val-new_sized}[Gio.BufferedOutputStream.new_sized]}
    to specify the buffer's size at construction.

    To get the size of a buffer within a buffered input stream, use
    {{!Ocgio.Buffered_output_stream.class-type-buffered_output_stream_t.method-get_buffer_size}
     [Gio.BufferedOutputStream.get_buffer_size]}. To change the size of a
    buffered output stream's buffer, use
    {{!Ocgio.Buffered_output_stream.class-type-buffered_output_stream_t.method-set_buffer_size}
     [Gio.BufferedOutputStream.set_buffer_size]}. Note that the buffer's size
    cannot be reduced below the size of the data within the buffer. *)

(** {1:constructors Constructors} *)

val new_ : Output_stream.output_stream_t -> buffered_output_stream_t
(** Creates a new buffered output stream for a base stream. *)

val new_sized :
  Output_stream.output_stream_t -> Gsize.t -> buffered_output_stream_t
(** Creates a new buffered output stream with a given buffer size. *)
