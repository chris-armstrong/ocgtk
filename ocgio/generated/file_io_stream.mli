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
