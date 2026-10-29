class type file_input_stream_t = object
  inherit Input_stream.input_stream_t
  inherit Seekable.seekable_t

  (** {2:methods Methods} *)

  method query_info :
    string ->
    Cancellable.cancellable_t option ->
    (File_info.file_info_t, GError.t) result
  (** Queries a file input stream the given [attributes]. This function blocks
      while querying the stream. For the asynchronous (non-blocking) version of
      this function, see [g_file_input_stream_query_info_async ()]. While the
      stream is blocked, the stream will set the pending flag internally, and
      any other operations on the stream will fail with [G_IO_ERROR_PENDING]. *)

  method query_info_finish :
    Async_result.async_result_t -> (File_info.file_info_t, GError.t) result
  (** Finishes an asynchronous info query operation. *)

  (** {2:conversions Conversions} *)

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
