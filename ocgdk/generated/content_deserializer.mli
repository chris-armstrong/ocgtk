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

class content_deserializer :
  Raw.Content_deserializer.t ->
  content_deserializer_t
