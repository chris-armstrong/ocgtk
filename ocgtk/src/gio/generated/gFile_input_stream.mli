class type file_input_stream_t = object
    method query_info : string -> GCancellable.cancellable_t option -> (GFile_info.file_info_t, GError.t) result
    method as_file_input_stream : File_input_stream.t
end

class file_input_stream : File_input_stream.t -> file_input_stream_t

