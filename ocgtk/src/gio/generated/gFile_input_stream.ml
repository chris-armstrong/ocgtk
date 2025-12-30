(* High-level class for FileInputStream *)
class file_input_stream (obj : File_input_stream.t) = object (self)

  method query_info : 'p1. string -> (#GCancellable.cancellable as 'p1) option -> (GFile_info.file_info, GError.t) result =
    fun attributes cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GFile_info.file_info ret)(File_input_stream.query_info obj attributes cancellable)

    method as_file_input_stream = obj
end

