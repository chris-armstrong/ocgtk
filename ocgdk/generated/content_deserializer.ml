class type content_deserializer_t = object
  inherit Ocgio.Async_result.async_result_t
  method get_cancellable : unit -> Ocgio.Cancellable.cancellable_t option
  method get_gtype : unit -> Gobject.Type.t
  method get_input_stream : unit -> Ocgio.Input_stream.input_stream_t
  method get_mime_type : unit -> string
  method get_priority : unit -> int
  method get_value : unit -> Gobject.Value.t
  method return_error : GError.t -> unit
  method return_success : unit -> unit
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
