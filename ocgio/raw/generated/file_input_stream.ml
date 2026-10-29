(* GENERATED CODE - DO NOT EDIT *)
(* FileInputStream: FileInputStream *)

(** [GFileInputStream] provides input streams that take their content from a
    file.

    [GFileInputStream] implements {{!Ocgio.Raw.Seekable}[Gio.Seekable]}, which
    allows the input stream to jump to arbitrary positions in the file, provided
    the filesystem of the file allows it. To find the position of a file input
    stream, use {{!Ocgio.Raw.Seekable.val-tell}[Gio.Seekable.tell]}. To find out
    if a file input stream supports seeking, use [Gio.Seekable.can_seek]. To
    position a file input stream, use [Gio.Seekable.seek].

    The class built on this module is in {!Ocgio.File_input_stream}. *)

type t = [ `file_input_stream | `input_stream | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_file_input_stream_get_type"

(* Methods *)

external query_info_finish :
  t -> Async_result.t -> (File_info.t, GError.t) result
  = "ml_g_file_input_stream_query_info_finish"
(** Finishes an asynchronous info query operation. *)

external query_info :
  t -> string -> Cancellable.t option -> (File_info.t, GError.t) result
  = "ml_g_file_input_stream_query_info"
(** Queries a file input stream the given [attributes]. This function blocks
    while querying the stream. For the asynchronous (non-blocking) version of
    this function, see g_file_input_stream_query_info_async(). While the stream
    is blocked, the stream will set the pending flag internally, and any other
    operations on the stream will fail with [G_IO_ERROR_PENDING]. *)
