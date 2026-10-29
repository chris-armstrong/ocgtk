class type content_deserializer_t = object
  inherit Ocgio.Async_result.async_result_t

  (** {2:methods Methods} *)

  method get_cancellable : unit -> Ocgio.Cancellable.cancellable_t option
  (** Gets the cancellable for the current operation.

      This is the [GCancellable] that was passed to
      [Gdk.content_deserialize_async]. *)

  method get_gtype : unit -> Gobject.Type.t
  (** Gets the [GType] to create an instance of. *)

  method get_input_stream : unit -> Ocgio.Input_stream.input_stream_t
  (** Gets the input stream for the current operation.

      This is the stream that was passed to [Gdk.content_deserialize_async]. *)

  method get_mime_type : unit -> string
  (** Gets the mime type to deserialize from. *)

  method get_priority : unit -> int
  (** Gets the I/O priority for the current operation.

      This is the priority that was passed to [Gdk.content_deserialize_async].
  *)

  method get_value : unit -> Gobject.Value.t
  (** Gets the [GValue] to store the deserialized object in. *)

  method return_error : GError.t -> unit
  (** Indicate that the deserialization has ended with an error.

      This function consumes [error]. *)

  method return_success : unit -> unit
  (** Indicate that the deserialization has been successfully completed. *)

  (** {2:conversions Conversions} *)

  method as_content_deserializer : Raw.Content_deserializer.t
end

(* High-level class for ContentDeserializer *)
class content_deserializer (obj : Raw.Content_deserializer.t) :
  content_deserializer_t =
  object (self)
    inherit
      Ocgio.Async_result.async_result (Ocgio.Raw.Async_result.from_gobject obj)

    method get_cancellable : unit -> Ocgio.Cancellable.cancellable_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.Cancellable.cancellable ret)
          (Raw.Content_deserializer.get_cancellable obj)

    method get_gtype : unit -> Gobject.Type.t =
      fun () -> Raw.Content_deserializer.get_gtype obj

    method get_input_stream : unit -> Ocgio.Input_stream.input_stream_t =
      fun () ->
        new Ocgio.Input_stream.input_stream
          (Raw.Content_deserializer.get_input_stream obj)

    method get_mime_type : unit -> string =
      fun () -> Raw.Content_deserializer.get_mime_type obj

    method get_priority : unit -> int =
      fun () -> Raw.Content_deserializer.get_priority obj

    method get_value : unit -> Gobject.Value.t =
      fun () -> Raw.Content_deserializer.get_value obj

    method return_error : GError.t -> unit =
      fun error -> Raw.Content_deserializer.return_error obj error

    method return_success : unit -> unit =
      fun () -> Raw.Content_deserializer.return_success obj

    method as_content_deserializer = obj
  end
