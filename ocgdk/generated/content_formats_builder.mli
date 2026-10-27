class type content_formats_builder_t = object
  method add_formats : Raw.Content_formats.t -> unit
  method add_gtype : Gobject.Type.t -> unit
  method add_mime_type : string -> unit
  method ref : unit -> Raw.Content_formats_builder.t
  method to_formats : unit -> Raw.Content_formats.t
  method as_content_formats_builder : Raw.Content_formats_builder.t
end

class content_formats_builder :
  Raw.Content_formats_builder.t ->
  content_formats_builder_t

val new_ : unit -> content_formats_builder_t
