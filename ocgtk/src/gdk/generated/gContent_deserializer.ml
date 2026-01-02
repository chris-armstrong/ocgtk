(* High-level class for ContentDeserializer *)
class content_deserializer (obj : Content_deserializer.t) = object (self)

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

