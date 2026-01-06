(* High-level class for ContentSerializer *)
class content_serializer (obj : Content_serializer.t) = object (self)

  method get_mime_type : unit -> string =
    fun () ->
      (Content_serializer.get_mime_type obj)

  method get_priority : unit -> int =
    fun () ->
      (Content_serializer.get_priority obj)

  method return_success : unit -> unit =
    fun () ->
      (Content_serializer.return_success obj)

    method as_content_serializer = obj
end

