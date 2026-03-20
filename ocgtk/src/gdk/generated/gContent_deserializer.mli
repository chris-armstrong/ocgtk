class type content_deserializer_t = object
    method get_cancellable : unit -> Ocgtk_gio.Gio.cancellable_t option
    method get_input_stream : unit -> Ocgtk_gio.Gio.input_stream_t
    method get_mime_type : unit -> string
    method get_priority : unit -> int
    method return_success : unit -> unit
    method as_content_deserializer : Content_deserializer.t
end

class content_deserializer : Content_deserializer.t -> content_deserializer_t

