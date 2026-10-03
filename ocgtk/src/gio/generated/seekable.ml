(* GENERATED CODE - DO NOT EDIT *)
(* Seekable: Seekable *)

(** [GSeekable] is implemented by streams (implementations of [Gio.InputStream]
    or [Gio.OutputStream]) that support seeking.

    Seekable streams largely fall into two categories: resizable and fixed-size.

    [GSeekable] on fixed-sized streams is approximately the same as POSIX
    [lseek()]) on a block device (for example: attempting to seek past the end
    of the device is an error). Fixed streams typically cannot be truncated.

    [GSeekable] on resizable streams is approximately the same as POSIX
    [lseek()]) on a normal file. Seeking past the end and writing data will
    usually cause the stream to resize by introducing zero bytes. *)

type t = [ `seekable ] Gobject.obj

external from_gobject : 'a Gobject.obj -> t = "ml_gio_seekable_from_gobject"

(* Methods *)

external truncate :
  t -> int64 -> Cancellable.t option -> (bool, GError.t) result
  = "ml_g_seekable_truncate"
(** Sets the length of the stream to [offset]. If the stream was previously
    larger than [offset], the extra data is discarded. If the stream was
    previously shorter than [offset], it is extended with NUL ('\0') bytes.

    If [cancellable] is not [NULL], then the operation can be cancelled by
    triggering the cancellable object from another thread. If the operation was
    cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. If an
    operation was partially finished when the operation was cancelled the
    partial result will be returned, without an error. *)

external tell : t -> int64 = "ml_g_seekable_tell"
(** Tells the current position within the stream. *)

external can_truncate : t -> bool = "ml_g_seekable_can_truncate"
(** Tests if the length of the stream can be adjusted with
    g_seekable_truncate(). *)

external can_seek : t -> bool = "ml_g_seekable_can_seek"
(** Tests if the stream supports the [GSeekableIface]. *)
