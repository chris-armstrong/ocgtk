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
