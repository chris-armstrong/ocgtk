class type file_input_stream_t = object
    method query_info : string -> GCancellable.cancellable_t option -> (GFile_info.file_info_t, GError.t) result
    method as_file_input_stream : File_input_stream.t
end

(* High-level class for FileInputStream *)
class file_input_stream (obj : File_input_stream.t) : file_input_stream_t = object (self)

  method query_info : string -> GCancellable.cancellable_t option -> (GFile_info.file_info_t, GError.t) result =
    fun attributes cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_info.file_info ret)(File_input_stream.query_info obj attributes cancellable)

    method as_file_input_stream = obj
end

