(* GENERATED CODE - DO NOT EDIT *)
(* FileInputStream: FileInputStream *)

type t = [`file_input_stream | `input_stream | `object_] Gobject.obj

(* Methods *)
(** Queries a file input stream the given @attributes. This function blocks
while querying the stream. For the asynchronous (non-blocking) version
of this function, see g_file_input_stream_query_info_async(). While the
stream is blocked, the stream will set the pending flag internally, and
any other operations on the stream will fail with %G_IO_ERROR_PENDING. *)
external query_info : t -> string -> Cancellable.t option -> (File_info.t, GError.t) result = "ml_g_file_input_stream_query_info"

