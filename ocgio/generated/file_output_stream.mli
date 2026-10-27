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

(** The methods, signals and properties of a [GFileOutputStream]. *)
class type file_output_stream_t = object
  inherit Output_stream.output_stream_t
  inherit Seekable.seekable_t
  method get_etag : unit -> string option

  method query_info :
    string ->
    Cancellable.cancellable_t option ->
    (File_info.file_info_t, GError.t) result

  method query_info_finish :
    Async_result.async_result_t -> (File_info.file_info_t, GError.t) result

  method as_file_output_stream : Raw.File_output_stream.t
end

class file_output_stream : Raw.File_output_stream.t -> file_output_stream_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.File_output_stream.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GFileOutputStream], give one already wrapped. *)
