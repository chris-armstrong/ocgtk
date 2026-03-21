class type content_serializer_t = object
    method get_cancellable : unit -> Ocgtk_gio.Gio.cancellable_t option
    method get_mime_type : unit -> string
    method get_output_stream : unit -> Ocgtk_gio.Gio.output_stream_t
    method get_priority : unit -> int
    method return_success : unit -> unit
    method as_content_serializer : Content_serializer.t
end

(* High-level class for ContentSerializer *)
class content_serializer (obj : Content_serializer.t) : content_serializer_t = object (self)

  method get_cancellable : unit -> Ocgtk_gio.Gio.cancellable_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gio.Gio.cancellable ret) (Content_serializer.get_cancellable obj)

  method get_mime_type : unit -> string =
    fun () ->
      (Content_serializer.get_mime_type obj)

  method get_output_stream : unit -> Ocgtk_gio.Gio.output_stream_t =
    fun () ->
      new  Ocgtk_gio.Gio.output_stream(Content_serializer.get_output_stream obj)

  method get_priority : unit -> int =
    fun () ->
      (Content_serializer.get_priority obj)

  method return_success : unit -> unit =
    fun () ->
      (Content_serializer.return_success obj)

    method as_content_serializer = obj
end

