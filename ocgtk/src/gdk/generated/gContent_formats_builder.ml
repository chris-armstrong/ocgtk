class type content_formats_builder_t = object
    method add_formats : Content_formats.t -> unit
    method add_mime_type : string -> unit
    method ref : unit -> Content_formats_builder.t
    method to_formats : unit -> Content_formats.t
    method unref : unit -> unit
    method as_content_formats_builder : Content_formats_builder.t
end

(* High-level class for ContentFormatsBuilder *)
class content_formats_builder (obj : Content_formats_builder.t) : content_formats_builder_t = object (self)

  method add_formats : Content_formats.t -> unit =
    fun formats ->
      (Content_formats_builder.add_formats obj formats)

  method add_mime_type : string -> unit =
    fun mime_type ->
      (Content_formats_builder.add_mime_type obj mime_type)

  method ref : unit -> Content_formats_builder.t =
    fun () ->
      (Content_formats_builder.ref obj)

  method to_formats : unit -> Content_formats.t =
    fun () ->
      (Content_formats_builder.to_formats obj)

  method unref : unit -> unit =
    fun () ->
      (Content_formats_builder.unref obj)

    method as_content_formats_builder = obj
end

