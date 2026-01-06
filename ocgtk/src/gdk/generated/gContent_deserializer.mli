class content_deserializer : Content_deserializer.t ->
  object
    method get_mime_type : unit -> string
    method get_priority : unit -> int
    method return_success : unit -> unit
    method as_content_deserializer : Content_deserializer.t
  end

