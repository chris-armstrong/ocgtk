class type file_output_stream_t = object
    method get_etag : unit -> string option
    method query_info : string -> GCancellable.cancellable_t option -> (GFile_info.file_info_t, GError.t) result
    method as_file_output_stream : File_output_stream.t
end

class file_output_stream : File_output_stream.t -> file_output_stream_t

