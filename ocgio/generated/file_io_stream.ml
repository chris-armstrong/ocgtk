class type file_io_stream_t = object
  inherit Io_stream.io_stream_t
  inherit Seekable.seekable_t
  method get_etag : unit -> string option

  method query_info :
    string ->
    Cancellable.cancellable_t option ->
    (File_info.file_info_t, GError.t) result

  method query_info_finish :
    Async_result.async_result_t -> (File_info.file_info_t, GError.t) result

  method as_file_io_stream : Raw.File_io_stream.t
end

(* High-level class for FileIOStream *)
class file_io_stream (obj : Raw.File_io_stream.t) : file_io_stream_t =
  object (self)
    inherit Io_stream.io_stream (obj :> Raw.Io_stream.t)
    inherit Seekable.seekable (Raw.Seekable.from_gobject obj)

    method get_etag : unit -> string option =
      fun () -> Raw.File_io_stream.get_etag obj

    method query_info :
        string ->
        Cancellable.cancellable_t option ->
        (File_info.file_info_t, GError.t) result =
      fun attributes cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new File_info.file_info ret)
          (Raw.File_io_stream.query_info obj attributes cancellable)

    method query_info_finish :
        Async_result.async_result_t -> (File_info.file_info_t, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new File_info.file_info ret)
          (Raw.File_io_stream.query_info_finish obj result)

    method as_file_io_stream = obj
  end
