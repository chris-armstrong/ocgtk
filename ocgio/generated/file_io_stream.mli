(** [GFileIOStream] provides I/O streams that both read and write to the same
    file handle.

    [GFileIOStream] implements [Gio.Seekable], which allows the I/O stream to
    jump to arbitrary positions in the file and to truncate the file, provided
    the filesystem of the file supports these operations.

    To find the position of a file I/O stream, use [Gio.Seekable.tell].

    To find out if a file I/O stream supports seeking, use
    [Gio.Seekable.can_seek]. To position a file I/O stream, use
    [Gio.Seekable.seek]. To find out if a file I/O stream supports truncating,
    use [Gio.Seekable.can_truncate]. To truncate a file I/O stream, use
    [Gio.Seekable.truncate].

    The default implementation of all the [GFileIOStream] operations and the
    implementation of [Gio.Seekable] just call into the same operations on the
    output stream.

    Its methods, signals and properties are on {!class-type-file_io_stream_t}.
    The functions it is built on are in {!Ocgio.Raw.File_io_stream}. *)

(** The methods, signals and properties of a [GFileIOStream]. *)
class type file_io_stream_t = object
  inherit Io_stream.io_stream_t
  inherit Seekable.seekable_t
  method get_etag : unit -> string option

  method query_info :
    string ->
    Cancellable.cancellable_t option ->
    (File_info.file_info_t, GError.t) result

  method query_info_finish :
    Async_result.async_result_t -> (File_info.file_info_t, GError.t) result

  method as_file_io_stream : Raw.File_io_stream.t
end

class file_io_stream : Raw.File_io_stream.t -> file_io_stream_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.File_io_stream.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GFileIOStream], give one already wrapped. *)
