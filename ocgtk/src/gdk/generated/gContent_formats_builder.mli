class content_formats_builder : Content_formats_builder.t ->
  object
    method add_formats : Content_formats.t -> unit
    method add_mime_type : string -> unit
    method free_to_formats : unit -> Content_formats.t
    method ref : unit -> Content_formats_builder.t
    method to_formats : unit -> Content_formats.t
    method unref : unit -> unit
    method as_content_formats_builder : Content_formats_builder.t
  end

