class content_deserializer : Content_deserializer.t ->
  object
    method get_cancellable : unit -> Ocgtk_gio.Gio.cancellable option
    method get_input_stream : unit -> Ocgtk_gio.Gio.input_stream
    method get_mime_type : unit -> string
    method get_priority : unit -> int
    method return_success : unit -> unit
    method as_content_deserializer : Content_deserializer.t
  end

