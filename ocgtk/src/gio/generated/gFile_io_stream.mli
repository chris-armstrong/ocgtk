class type file_io_stream_t = object
    inherit GIo_stream.io_stream_t
    inherit GSeekable.seekable_t
    method get_etag : unit -> string option
    method query_info : string -> GCancellable.cancellable_t option -> (GFile_info.file_info_t, GError.t) result
    method as_file_io_stream : File_io_stream.t
end

class file_io_stream : File_io_stream.t -> file_io_stream_t

