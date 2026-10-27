(** [GSeekable] is implemented by streams (implementations of [Gio.InputStream]
    or [Gio.OutputStream]) that support seeking.

    Seekable streams largely fall into two categories: resizable and fixed-size.

    [GSeekable] on fixed-sized streams is approximately the same as POSIX
    [lseek()]) on a block device (for example: attempting to seek past the end
    of the device is an error). Fixed streams typically cannot be truncated.

    [GSeekable] on resizable streams is approximately the same as POSIX
    [lseek()]) on a normal file. Seeking past the end and writing data will
    usually cause the stream to resize by introducing zero bytes.

    Its methods, signals and properties are on {!class-type-seekable_t}. The
    functions it is built on are in {!Ocgio.Raw.Seekable}. *)

(** The methods, signals and properties of a [GSeekable]. *)
class type seekable_t = object
  method can_seek : unit -> bool
  (** Tests if the stream supports the [GSeekableIface]. *)

  method can_truncate : unit -> bool
  (** Tests if the length of the stream can be adjusted with
      g_seekable_truncate(). *)

  method tell : unit -> int64
  (** Tells the current position within the stream. *)

  method truncate :
    int64 -> Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Sets the length of the stream to [offset]. If the stream was previously
      larger than [offset], the extra data is discarded. If the stream was
      previously shorter than [offset], it is extended with NUL ('\0') bytes.

      If [cancellable] is not [NULL], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. If an
      operation was partially finished when the operation was cancelled the
      partial result will be returned, without an error. *)

  method as_seekable : Raw.Seekable.t
end

class seekable : Raw.Seekable.t -> seekable_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Seekable.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GSeekable], give one already wrapped. *)
