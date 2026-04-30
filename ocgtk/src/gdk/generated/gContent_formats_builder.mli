class type content_formats_builder_t = object
  method add_formats : Content_formats.t -> unit
  method add_gtype : int -> unit
  method add_mime_type : string -> unit
  method ref : unit -> Content_formats_builder.t
  method to_formats : unit -> Content_formats.t
  method as_content_formats_builder : Content_formats_builder.t
end

class content_formats_builder :
  Content_formats_builder.t ->
  content_formats_builder_t

val new_ : unit -> content_formats_builder_t
