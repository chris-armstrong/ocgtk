class file_io_stream : File_io_stream.t ->
  object
    method get_etag : unit -> string option
    method query_info : string -> #GCancellable.cancellable option -> (GFile_info.file_info, GError.t) result
    method as_file_io_stream : File_io_stream.t
  end

