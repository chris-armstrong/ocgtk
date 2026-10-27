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
  method can_truncate : unit -> bool
  method tell : unit -> int64

  method truncate :
    int64 -> Cancellable.cancellable_t option -> (bool, GError.t) result

  method as_seekable : Raw.Seekable.t
end

class seekable : Raw.Seekable.t -> seekable_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Seekable.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GSeekable], give one already wrapped. *)
