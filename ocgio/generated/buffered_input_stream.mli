(** Buffered input stream implements
    {{!Ocgio.Filter_input_stream.class-type-filter_input_stream_t}[Gio.FilterInputStream]}
    and provides for buffered reads.

    Its methods, signals and properties are on
    {!class-type-buffered_input_stream_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgio.Raw.Buffered_input_stream}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [BufferedInputStream].}

    Inherits from:
    {{!Ocgio.Filter_input_stream.class-type-filter_input_stream_t}Ocgio.Filter_input_stream}

    Implements:
    - {{!Ocgio.Seekable.class-type-seekable_t}Ocgio.Seekable}

    Buffered input stream implements
    {{!Ocgio.Filter_input_stream.class-type-filter_input_stream_t}[Gio.FilterInputStream]}
    and provides for buffered reads.

    By default, [GBufferedInputStream]'s buffer size is set at 4 kilobytes.

    To create a buffered input stream, use
    {{!Ocgio.Buffered_input_stream.val-new_}[Gio.BufferedInputStream.new]}, or
    {{!Ocgio.Buffered_input_stream.val-new_sized}[Gio.BufferedInputStream.new_sized]}
    to specify the buffer's size at construction.

    To get the size of a buffer within a buffered input stream, use
    {{!Ocgio.Buffered_input_stream.class-type-buffered_input_stream_t.method-get_buffer_size}
     [Gio.BufferedInputStream.get_buffer_size]}. To change the size of a
    buffered input stream's buffer, use
    {{!Ocgio.Buffered_input_stream.class-type-buffered_input_stream_t.method-set_buffer_size}
     [Gio.BufferedInputStream.set_buffer_size]}. Note that the buffer's size
    cannot be reduced below the size of the data within the buffer. *)
class type buffered_input_stream_t = object
  inherit Filter_input_stream.filter_input_stream_t
  inherit Seekable.seekable_t

  (** {2:methods Methods} *)

  method fill :
    int -> Cancellable.cancellable_t option -> (int, GError.t) result
  (** Tries to read [count] bytes from the stream into the buffer. Will block
      during this read.

      If [count] is zero, returns zero and does nothing. A value of [count]
      larger than [G_MAXSSIZE] will cause a [Gio.IOErrorEnum.INVALID_ARGUMENT]
      error.

      On success, the number of bytes read into the buffer is returned. It is
      not an error if this is not the same as the requested size, as it can
      happen e.g. near the end of a file. Zero is returned on end of file (or if
      [count] is zero), but never otherwise.

      If [count] is -1 then the attempted read size is equal to the number of
      bytes that are required to fill the buffer.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [Gio.IOErrorEnum.CANCELLED] will be returned. If
      an operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.

      On error [-1] is returned and [error] is set accordingly.

      For the asynchronous, non-blocking, version of this function, see
      [Gio.BufferedInputStream.fill_async]. *)

  method fill_finish : Async_result.async_result_t -> (int, GError.t) result
  (** Finishes an asynchronous read. *)

  method get_available : unit -> Gsize.t
  (** Gets the size of the available data within the stream. *)

  method get_buffer_size : unit -> Gsize.t
  (** Gets the size of the input buffer. *)

  method read_byte : Cancellable.cancellable_t option -> (int, GError.t) result
  (** Tries to read a single byte from the stream or the buffer. Will block
      during this read.

      On success, the byte read from the stream is returned. On end of stream
      [-1] is returned but it's not an exceptional error and [error] is not set.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [Gio.IOErrorEnum.CANCELLED] will be returned. If
      an operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error.

      On error [-1] is returned and [error] is set accordingly. *)

  method set_buffer_size : Gsize.t -> unit
  (** Sets the size of the internal buffer of [stream] to [size], or to the size
      of the contents of the buffer. The buffer can never be resized smaller
      than its current contents. *)

  (** {2:conversions Conversions} *)

  method as_buffered_input_stream : Raw.Buffered_input_stream.t
end

class buffered_input_stream :
  Raw.Buffered_input_stream.t ->
  buffered_input_stream_t
(** Wraps a raw handle of {!Ocgio.Raw.Buffered_input_stream.t}. *)

(** {1:description Description}

    Buffered input stream implements
    {{!Ocgio.Filter_input_stream.class-type-filter_input_stream_t}[Gio.FilterInputStream]}
    and provides for buffered reads.

    By default, [GBufferedInputStream]'s buffer size is set at 4 kilobytes.

    To create a buffered input stream, use
    {{!Ocgio.Buffered_input_stream.val-new_}[Gio.BufferedInputStream.new]}, or
    {{!Ocgio.Buffered_input_stream.val-new_sized}[Gio.BufferedInputStream.new_sized]}
    to specify the buffer's size at construction.

    To get the size of a buffer within a buffered input stream, use
    {{!Ocgio.Buffered_input_stream.class-type-buffered_input_stream_t.method-get_buffer_size}
     [Gio.BufferedInputStream.get_buffer_size]}. To change the size of a
    buffered input stream's buffer, use
    {{!Ocgio.Buffered_input_stream.class-type-buffered_input_stream_t.method-set_buffer_size}
     [Gio.BufferedInputStream.set_buffer_size]}. Note that the buffer's size
    cannot be reduced below the size of the data within the buffer. *)

(** {1:constructors Constructors} *)

val new_ : Input_stream.input_stream_t -> buffered_input_stream_t
(** Creates a new
    {{!Ocgio.Input_stream.class-type-input_stream_t}[Gio.InputStream]} from the
    given [base_stream], with a buffer set to the default size (4 kilobytes). *)

val new_sized :
  Input_stream.input_stream_t -> Gsize.t -> buffered_input_stream_t
(** Creates a new
    {{!Ocgio.Buffered_input_stream.class-type-buffered_input_stream_t}[Gio.BufferedInputStream]}
    from the given [base_stream], with a buffer set to [size]. *)
