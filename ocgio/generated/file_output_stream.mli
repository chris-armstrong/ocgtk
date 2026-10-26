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
