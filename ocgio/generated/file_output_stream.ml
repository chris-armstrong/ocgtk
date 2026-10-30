class type file_output_stream_t = object
  inherit Output_stream.output_stream_t
  inherit Seekable.seekable_t

  (** {2:methods Methods} *)

  method get_etag : unit -> string option
  (** Gets the entity tag for the file when it has been written. This must be
      called after the stream has been written and closed, as the etag can
      change while writing. *)

  method query_info :
    string ->
    Cancellable.cancellable_t option ->
    (File_info.file_info_t, GError.t) result
  (** Queries a file output stream for the given [attributes]. This function
      blocks while querying the stream. For the asynchronous version of this
      function, see [g_file_output_stream_query_info_async ()]. While the stream
      is blocked, the stream will set the pending flag internally, and any other
      operations on the stream will fail with [G_IO_ERROR_PENDING].

      Can fail if the stream was already closed (with [error] being set to
      [G_IO_ERROR_CLOSED]), the stream has pending operations (with [error]
      being set to [G_IO_ERROR_PENDING]), or if querying info is not supported
      for the stream's interface (with [error] being set to
      [G_IO_ERROR_NOT_SUPPORTED]). In all cases of failure, [None] will be
      returned.

      If [cancellable] is not [None], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be set, and [None]
      will be returned. *)

  method query_info_finish :
    Async_result.async_result_t -> (File_info.file_info_t, GError.t) result
  (** Finalizes the asynchronous query started by
      [g_file_output_stream_query_info_async ()]. *)

  (** {2:conversions Conversions} *)

  method as_file_output_stream : Raw.File_output_stream.t
end

(* High-level class for FileOutputStream *)
class file_output_stream (obj : Raw.File_output_stream.t) : file_output_stream_t
  =
  object (self)
    inherit Output_stream.output_stream (obj :> Raw.Output_stream.t)
    inherit Seekable.seekable (Raw.Seekable.from_gobject obj)

    method get_etag : unit -> string option =
      fun () -> Raw.File_output_stream.get_etag obj

    method query_info :
        string ->
        Cancellable.cancellable_t option ->
        (File_info.file_info_t, GError.t) result =
      fun attributes cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new File_info.file_info ret)
          (Raw.File_output_stream.query_info obj attributes cancellable)

    method query_info_finish :
        Async_result.async_result_t -> (File_info.file_info_t, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new File_info.file_info ret)
          (Raw.File_output_stream.query_info_finish obj result)

    method as_file_output_stream = obj
  end
