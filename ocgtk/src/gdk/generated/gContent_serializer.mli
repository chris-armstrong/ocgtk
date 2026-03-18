class content_serializer : Content_serializer.t ->
  object
    method get_cancellable : unit -> Ocgtk_gio.Gio.cancellable option
    method get_mime_type : unit -> string
    method get_output_stream : unit -> Ocgtk_gio.Gio.output_stream
    method get_priority : unit -> int
    method return_success : unit -> unit
    method as_content_serializer : Content_serializer.t
  end

