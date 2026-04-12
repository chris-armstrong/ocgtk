class type content_serializer_t = object
    inherit Ocgtk_gio.Gio.Async_result.async_result_t
    method get_cancellable : unit -> Ocgtk_gio.Gio.Cancellable.cancellable_t option
    method get_mime_type : unit -> string
    method get_output_stream : unit -> Ocgtk_gio.Gio.Output_stream.output_stream_t
    method get_priority : unit -> int
    method return_success : unit -> unit
    method as_content_serializer : Content_serializer.t
end

class content_serializer : Content_serializer.t -> content_serializer_t

