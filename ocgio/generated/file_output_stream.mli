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
    stream, use [Gio.Seekable.truncate].

    Its methods, signals and properties are on
    {!class-type-file_output_stream_t}. The functions it is built on are in
    {!Ocgio.Raw.File_output_stream}. *)

(** {b The methods, signals and properties of a [FileOutputStream].}

    [GFileOutputStream] provides output streams that write their content to a
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
class type file_output_stream_t = object
  inherit Output_stream.output_stream_t
  inherit Seekable.seekable_t

  method get_etag : unit -> string option
  (** Gets the entity tag for the file when it has been written. This must be
      called after the stream has been written and closed, as the etag can
      change while writing. *)

  method query_info :
    string ->
    Cancellable.cancellable_t option ->
    (File_info.file_info_t, GError.t) result
  (** Queries a file output stream for the given [attributes]. This function
      blocks while querying the stream. For the asynchronous version of this
      function, see g_file_output_stream_query_info_async(). While the stream is
      blocked, the stream will set the pending flag internally, and any other
      operations on the stream will fail with [G_IO_ERROR_PENDING].

      Can fail if the stream was already closed (with [error] being set to
      [G_IO_ERROR_CLOSED]), the stream has pending operations (with [error]
      being set to [G_IO_ERROR_PENDING]), or if querying info is not supported
      for the stream's interface (with [error] being set to
      [G_IO_ERROR_NOT_SUPPORTED]). In all cases of failure, [NULL] will be
      returned.

      If [cancellable] is not [NULL], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be set, and [NULL]
      will be returned. *)

  method query_info_finish :
    Async_result.async_result_t -> (File_info.file_info_t, GError.t) result
  (** Finalizes the asynchronous query started by
      g_file_output_stream_query_info_async(). *)

  method as_file_output_stream : Raw.File_output_stream.t
end

class file_output_stream : Raw.File_output_stream.t -> file_output_stream_t
(** Wraps a raw handle of {!Ocgio.Raw.File_output_stream.t}. *)
