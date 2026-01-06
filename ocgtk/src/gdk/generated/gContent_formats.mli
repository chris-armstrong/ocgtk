class content_formats : Content_formats.t ->
  object
    method contain_mime_type : string -> bool
    method match_ : Content_formats.t -> bool
    method match_mime_type : Content_formats.t -> string option
    method ref : unit -> Content_formats.t
    method to_string : unit -> string
    method union : Content_formats.t -> Content_formats.t
    method union_deserialize_gtypes : unit -> Content_formats.t
    method union_deserialize_mime_types : unit -> Content_formats.t
    method union_serialize_gtypes : unit -> Content_formats.t
    method union_serialize_mime_types : unit -> Content_formats.t
    method unref : unit -> unit
    method as_content_formats : Content_formats.t
  end

