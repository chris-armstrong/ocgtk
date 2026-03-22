class type file_output_stream_t = object
    inherit GOutput_stream.output_stream_t
    method get_etag : unit -> string option
    method query_info : string -> GCancellable.cancellable_t option -> (GFile_info.file_info_t, GError.t) result
    method as_file_output_stream : File_output_stream.t
end

(* High-level class for FileOutputStream *)
class file_output_stream (obj : File_output_stream.t) : file_output_stream_t = object (self)
  inherit GOutput_stream.output_stream (Obj.magic obj : Output_stream.t)

  method get_etag : unit -> string option =
    fun () ->
      (File_output_stream.get_etag obj)

  method query_info : string -> GCancellable.cancellable_t option -> (GFile_info.file_info_t, GError.t) result =
    fun attributes cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_info.file_info ret)(File_output_stream.query_info obj attributes cancellable)

    method as_file_output_stream = obj
end

