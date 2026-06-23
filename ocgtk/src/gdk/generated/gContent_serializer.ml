class type content_serializer_t = object
  inherit Ocgtk_gio.Gio.Async_result.async_result_t

  method get_cancellable :
    unit -> Ocgtk_gio.Gio.Cancellable.cancellable_t option

  method get_gtype : unit -> Gobject.Type.t
  method get_mime_type : unit -> string
  method get_output_stream : unit -> Ocgtk_gio.Gio.Output_stream.output_stream_t
  method get_priority : unit -> int
  method get_value : unit -> Gobject.Value.t
  method return_error : GError.t -> unit
  method return_success : unit -> unit
  method as_content_serializer : Content_serializer.t
end

(* High-level class for ContentSerializer *)
class content_serializer (obj : Content_serializer.t) : content_serializer_t =
  object (self)
    inherit
      Ocgtk_gio.Gio.Async_result.async_result
        (Ocgtk_gio.Gio.Wrappers.Async_result.from_gobject obj)

    method get_cancellable :
        unit -> Ocgtk_gio.Gio.Cancellable.cancellable_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgtk_gio.Gio.Cancellable.cancellable ret)
          (Content_serializer.get_cancellable obj)

    method get_gtype : unit -> Gobject.Type.t =
      fun () -> Content_serializer.get_gtype obj

    method get_mime_type : unit -> string =
      fun () -> Content_serializer.get_mime_type obj

    method get_output_stream :
        unit -> Ocgtk_gio.Gio.Output_stream.output_stream_t =
      fun () ->
        new Ocgtk_gio.Gio.Output_stream.output_stream
          (Content_serializer.get_output_stream obj)

    method get_priority : unit -> int =
      fun () -> Content_serializer.get_priority obj

    method get_value : unit -> Gobject.Value.t =
      fun () -> Content_serializer.get_value obj

    method return_error : GError.t -> unit =
      fun error -> Content_serializer.return_error obj error

    method return_success : unit -> unit =
      fun () -> Content_serializer.return_success obj

    method as_content_serializer = obj
  end
