class type file_input_stream_t = object
    inherit GInput_stream.input_stream_t
    inherit GSeekable.seekable_t
    method query_info : string -> GCancellable.cancellable_t option -> (GFile_info.file_info_t, GError.t) result
    method query_info_finish : GAsync_result.async_result_t -> (GFile_info.file_info_t, GError.t) result
    method as_file_input_stream : File_input_stream.t
end

(* High-level class for FileInputStream *)
class file_input_stream (obj : File_input_stream.t) : file_input_stream_t = object (self)
  inherit GInput_stream.input_stream (obj :> Input_stream.t)
  inherit GSeekable.seekable (Seekable.from_gobject obj)

  method query_info : string -> GCancellable.cancellable_t option -> (GFile_info.file_info_t, GError.t) result =
    fun attributes cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_info.file_info ret)(File_input_stream.query_info obj attributes cancellable)

  method query_info_finish : GAsync_result.async_result_t -> (GFile_info.file_info_t, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      Result.map (fun ret -> new GFile_info.file_info ret)(File_input_stream.query_info_finish obj result)

    method as_file_input_stream = obj
end

