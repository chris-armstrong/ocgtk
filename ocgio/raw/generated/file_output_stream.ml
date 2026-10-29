(* GENERATED CODE - DO NOT EDIT *)
(* FileOutputStream: FileOutputStream *)

(** [GFileOutputStream] provides output streams that write their content to a
    file.

    [GFileOutputStream] implements {{!Ocgio.Raw.Seekable}[Gio.Seekable]}, which
    allows the output stream to jump to arbitrary positions in the file and to
    truncate the file, provided the filesystem of the file supports these
    operations.

    To find the position of a file output stream, use
    {{!Ocgio.Raw.Seekable.val-tell}[Gio.Seekable.tell]}. To find out if a file
    output stream supports seeking, use
    {{!Ocgio.Raw.Seekable.val-can_seek}[Gio.Seekable.can_seek]}.To position a
    file output stream, use [Gio.Seekable.seek]. To find out if a file output
    stream supports truncating, use
    {{!Ocgio.Raw.Seekable.val-can_truncate}[Gio.Seekable.can_truncate]}. To
    truncate a file output stream, use
    {{!Ocgio.Raw.Seekable.val-truncate}[Gio.Seekable.truncate]}.

    The class built on this module is in {!Ocgio.File_output_stream}. *)

type t = [ `file_output_stream | `output_stream | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_file_output_stream_get_type"

(* Methods *)

external query_info_finish :
  t -> Async_result.t -> (File_info.t, GError.t) result
  = "ml_g_file_output_stream_query_info_finish"
(** Finalizes the asynchronous query started by
    [g_file_output_stream_query_info_async ()]. *)

external query_info :
  t -> string -> Cancellable.t option -> (File_info.t, GError.t) result
  = "ml_g_file_output_stream_query_info"
(** Queries a file output stream for the given [attributes]. This function
    blocks while querying the stream. For the asynchronous version of this
    function, see [g_file_output_stream_query_info_async ()]. While the stream
    is blocked, the stream will set the pending flag internally, and any other
    operations on the stream will fail with
    {{!Ocgio.Enums.type-ioerrorenum.constructor-PENDING}[G_IO_ERROR_PENDING]}.

    Can fail if the stream was already closed (with [error] being set to
    {{!Ocgio.Enums.type-ioerrorenum.constructor-CLOSED}[G_IO_ERROR_CLOSED]}),
    the stream has pending operations (with [error] being set to
    {{!Ocgio.Enums.type-ioerrorenum.constructor-PENDING}[G_IO_ERROR_PENDING]}),
    or if querying info is not supported for the stream's interface (with
    [error] being set to
    {{!Ocgio.Enums.type-ioerrorenum.constructor-NOT_SUPPORTED}[G_IO_ERROR_NOT_SUPPORTED]}).
    In all cases of failure, [None] will be returned.

    If [cancellable] is not [None], then the operation can be cancelled by
    triggering the cancellable object from another thread. If the operation was
    cancelled, the error
    {{!Ocgio.Enums.type-ioerrorenum.constructor-CANCELLED}[G_IO_ERROR_CANCELLED]}
    will be set, and [None] will be returned. *)

external get_etag : t -> string option = "ml_g_file_output_stream_get_etag"
(** Gets the entity tag for the file when it has been written. This must be
    called after the stream has been written and closed, as the etag can change
    while writing. *)
