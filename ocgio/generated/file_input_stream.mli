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

(** The methods, signals and properties of a [GFileInputStream]. *)
class type file_input_stream_t = object
  inherit Input_stream.input_stream_t
  inherit Seekable.seekable_t

  method query_info :
    string ->
    Cancellable.cancellable_t option ->
    (File_info.file_info_t, GError.t) result

  method query_info_finish :
    Async_result.async_result_t -> (File_info.file_info_t, GError.t) result

  method as_file_input_stream : Raw.File_input_stream.t
end

class file_input_stream : Raw.File_input_stream.t -> file_input_stream_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.File_input_stream.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GFileInputStream], give one already wrapped. *)
