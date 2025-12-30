class file_input_stream : File_input_stream.t ->
  object
    method query_info : string -> #GCancellable.cancellable option -> (GFile_info.file_info, GError.t) result
    method as_file_input_stream : File_input_stream.t
  end

