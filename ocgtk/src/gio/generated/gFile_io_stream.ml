class type file_io_stream_t = object
    inherit GIo_stream.io_stream_t
    inherit GSeekable.seekable_t
    method get_etag : unit -> string option
    method query_info : string -> GCancellable.cancellable_t option -> (GFile_info.file_info_t, GError.t) result
    method query_info_finish : GAsync_result.async_result_t -> (GFile_info.file_info_t, GError.t) result
    method as_file_io_stream : File_io_stream.t
end

(* High-level class for FileIOStream *)
class file_io_stream (obj : File_io_stream.t) : file_io_stream_t = object (self)
  inherit GIo_stream.io_stream (obj :> Io_stream.t)
  inherit GSeekable.seekable (Seekable.from_gobject obj)

  method get_etag : unit -> string option =
    fun () ->
      (File_io_stream.get_etag obj)

  method query_info : string -> GCancellable.cancellable_t option -> (GFile_info.file_info_t, GError.t) result =
    fun attributes cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_info.file_info ret)(File_io_stream.query_info obj attributes cancellable)

  method query_info_finish : GAsync_result.async_result_t -> (GFile_info.file_info_t, GError.t) result =
    fun result ->
      let result = result#as_async_result in
      Result.map (fun ret -> new GFile_info.file_info ret)(File_io_stream.query_info_finish obj result)

    method as_file_io_stream = obj
end

