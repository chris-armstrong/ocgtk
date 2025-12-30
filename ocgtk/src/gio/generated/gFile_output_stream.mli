class file_output_stream : File_output_stream.t ->
  object
    method get_etag : unit -> string option
    method query_info : string -> #GCancellable.cancellable option -> (GFile_info.file_info, GError.t) result
    method as_file_output_stream : File_output_stream.t
  end

