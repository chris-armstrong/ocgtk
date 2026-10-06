(* GENERATED CODE - DO NOT EDIT *)
(* FileOutputStream: FileOutputStream *)

(** [GFileOutputStream] provides output streams that write their content to a
    file.

    [GFileOutputStream] implements [Gio.Seekable], which allows the output
    stream to jump to arbitrary positions in the file and to truncate the file,
    provided the filesystem of the file supports these operations.

    To find the position of a file output stream, use [Gio.Seekable.tell]. To
    find out if a file output stream supports seeking, use
    [Gio.Seekable.can_seek].To position a file output stream, use
    [Gio.Seekable.seek]. To find out if a file output stream supports
    truncating, use [Gio.Seekable.can_truncate]. To truncate a file output
    stream, use [Gio.Seekable.truncate]. *)

type t = [ `file_output_stream | `output_stream | `object_ ] Gobject.obj

(* Methods *)

external query_info_finish :
  t -> Async_result.t -> (File_info.t, GError.t) result
  = "ml_g_file_output_stream_query_info_finish"
(** Finalizes the asynchronous query started by
    g_file_output_stream_query_info_async(). *)

external query_info :
  t -> string -> Cancellable.t option -> (File_info.t, GError.t) result
  = "ml_g_file_output_stream_query_info"
(** Queries a file output stream for the given [attributes]. This function
    blocks while querying the stream. For the asynchronous version of this
    function, see g_file_output_stream_query_info_async(). While the stream is
    blocked, the stream will set the pending flag internally, and any other
    operations on the stream will fail with [G_IO_ERROR_PENDING].

    Can fail if the stream was already closed (with [error] being set to
    [G_IO_ERROR_CLOSED]), the stream has pending operations (with [error] being
    set to [G_IO_ERROR_PENDING]), or if querying info is not supported for the
    stream's interface (with [error] being set to [G_IO_ERROR_NOT_SUPPORTED]).
    In all cases of failure, [NULL] will be returned.

    If [cancellable] is not [NULL], then the operation can be cancelled by
    triggering the cancellable object from another thread. If the operation was
    cancelled, the error [G_IO_ERROR_CANCELLED] will be set, and [NULL] will be
    returned. *)

external get_etag : t -> string option = "ml_g_file_output_stream_get_etag"
(** Gets the entity tag for the file when it has been written. This must be
    called after the stream has been written and closed, as the etag can change
    while writing. *)
