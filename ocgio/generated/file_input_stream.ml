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

(* High-level class for FileInputStream *)
class file_input_stream (obj : Raw.File_input_stream.t) : file_input_stream_t =
  object (self)
    inherit Input_stream.input_stream (obj :> Raw.Input_stream.t)
    inherit Seekable.seekable (Raw.Seekable.from_gobject obj)

    method query_info :
        string ->
        Cancellable.cancellable_t option ->
        (File_info.file_info_t, GError.t) result =
      fun attributes cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new File_info.file_info ret)
          (Raw.File_input_stream.query_info obj attributes cancellable)

    method query_info_finish :
        Async_result.async_result_t -> (File_info.file_info_t, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new File_info.file_info ret)
          (Raw.File_input_stream.query_info_finish obj result)

    method as_file_input_stream = obj
  end
