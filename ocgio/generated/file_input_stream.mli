(** [GFileInputStream] provides input streams that take their content from a
    file.

    [GFileInputStream] implements [Gio.Seekable], which allows the input stream
    to jump to arbitrary positions in the file, provided the filesystem of the
    file allows it. To find the position of a file input stream, use
    [Gio.Seekable.tell]. To find out if a file input stream supports seeking,
    use [Gio.Seekable.can_seek]. To position a file input stream, use
    [Gio.Seekable.seek].

    Its methods, signals and properties are on
    {!class-type-file_input_stream_t}. The functions it is built on are in
    {!Ocgio.Raw.File_input_stream}. *)

(** The methods, signals and properties of a [FileInputStream]. *)
class type file_input_stream_t = object
  inherit Input_stream.input_stream_t
  inherit Seekable.seekable_t

  method query_info :
    string ->
    Cancellable.cancellable_t option ->
    (File_info.file_info_t, GError.t) result
  (** Queries a file input stream the given [attributes]. This function blocks
      while querying the stream. For the asynchronous (non-blocking) version of
      this function, see g_file_input_stream_query_info_async(). While the
      stream is blocked, the stream will set the pending flag internally, and
      any other operations on the stream will fail with [G_IO_ERROR_PENDING]. *)

  method query_info_finish :
    Async_result.async_result_t -> (File_info.file_info_t, GError.t) result
  (** Finishes an asynchronous info query operation. *)

  method as_file_input_stream : Raw.File_input_stream.t
end

class file_input_stream : Raw.File_input_stream.t -> file_input_stream_t
(** Wraps a raw handle of {!Ocgio.Raw.File_input_stream.t}. *)
