class type content_serializer_t = object
  inherit Ocgio.Async_result.async_result_t

  (** {2:methods Methods} *)

  method get_cancellable : unit -> Ocgio.Cancellable.cancellable_t option
  (** Gets the cancellable for the current operation.

      This is the [GCancellable] that was passed to [content_serialize_async].
  *)

  method get_gtype : unit -> Gobject.Type.t
  (** Gets the [GType] to of the object to serialize. *)

  method get_mime_type : unit -> string
  (** Gets the mime type to serialize to. *)

  method get_output_stream : unit -> Ocgio.Output_stream.output_stream_t
  (** Gets the output stream for the current operation.

      This is the stream that was passed to [content_serialize_async]. *)

  method get_priority : unit -> int
  (** Gets the I/O priority for the current operation.

      This is the priority that was passed to [content_serialize_async]. *)

  method get_value : unit -> Gobject.Value.t
  (** Gets the [GValue] to read the object to serialize from. *)

  method return_error : GError.t -> unit
  (** Indicate that the serialization has ended with an error.

      This function consumes [error]. *)

  method return_success : unit -> unit
  (** Indicate that the serialization has been successfully completed. *)

  (** {2:conversions Conversions} *)

  method as_content_serializer : Raw.Content_serializer.t
end

(* High-level class for ContentSerializer *)
class content_serializer (obj : Raw.Content_serializer.t) : content_serializer_t
  =
  object (self)
    inherit
      Ocgio.Async_result.async_result (Ocgio.Raw.Async_result.from_gobject obj)

    method get_cancellable : unit -> Ocgio.Cancellable.cancellable_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.Cancellable.cancellable ret)
          (Raw.Content_serializer.get_cancellable obj)

    method get_gtype : unit -> Gobject.Type.t =
      fun () -> Raw.Content_serializer.get_gtype obj

    method get_mime_type : unit -> string =
      fun () -> Raw.Content_serializer.get_mime_type obj

    method get_output_stream : unit -> Ocgio.Output_stream.output_stream_t =
      fun () ->
        new Ocgio.Output_stream.output_stream
          (Raw.Content_serializer.get_output_stream obj)

    method get_priority : unit -> int =
      fun () -> Raw.Content_serializer.get_priority obj

    method get_value : unit -> Gobject.Value.t =
      fun () -> Raw.Content_serializer.get_value obj

    method return_error : GError.t -> unit =
      fun error -> Raw.Content_serializer.return_error obj error

    method return_success : unit -> unit =
      fun () -> Raw.Content_serializer.return_success obj

    method as_content_serializer = obj
  end
