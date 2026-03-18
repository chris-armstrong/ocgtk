(* High-level class for ContentDeserializer *)
class content_deserializer (obj : Content_deserializer.t) = object (self)

  method get_cancellable : unit -> Ocgtk_gio.Gio.cancellable option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.cancellable ret) (Content_deserializer.get_cancellable obj)

  method get_input_stream : unit -> Ocgtk_gio.Gio.input_stream =
    fun () ->
      new  Ocgtk_gio.Gio.input_stream(Content_deserializer.get_input_stream obj)

  method get_mime_type : unit -> string =
    fun () ->
      (Content_deserializer.get_mime_type obj)

  method get_priority : unit -> int =
    fun () ->
      (Content_deserializer.get_priority obj)

  method return_success : unit -> unit =
    fun () ->
      (Content_deserializer.return_success obj)

    method as_content_deserializer = obj
end

