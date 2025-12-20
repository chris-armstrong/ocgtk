(* High-level class for FileIOStream *)
class file_io_stream (obj : File_io_stream.t) = object (self)

  method get_etag : unit -> string option =
    fun () ->
      (File_io_stream.get_etag obj)

  method query_info : 'p1. string -> (#GCancellable.cancellable as 'p1) option -> (GFile_info.file_info, GError.t) result =
    fun attributes cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_info.file_info ret)(File_io_stream.query_info obj attributes cancellable)

    method as_file_io_stream = obj
end

