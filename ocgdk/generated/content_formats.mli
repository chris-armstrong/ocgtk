class type content_formats_t = object
  method contain_gtype : Gobject.Type.t -> bool
  method contain_mime_type : string -> bool
  method is_empty : unit -> bool
  method match_ : Raw.Content_formats.t -> bool
  method match_gtype : Raw.Content_formats.t -> Gobject.Type.t
  method match_mime_type : Raw.Content_formats.t -> string option
  method ref : unit -> Raw.Content_formats.t
  method to_string : unit -> string
  method union : Raw.Content_formats.t -> Raw.Content_formats.t
  method union_deserialize_gtypes : unit -> Raw.Content_formats.t
  method union_deserialize_mime_types : unit -> Raw.Content_formats.t
  method union_serialize_gtypes : unit -> Raw.Content_formats.t
  method union_serialize_mime_types : unit -> Raw.Content_formats.t
  method as_content_formats : Raw.Content_formats.t
end

class content_formats : Raw.Content_formats.t -> content_formats_t

val new_ : string array option -> int -> content_formats_t
val new_for_gtype : Gobject.Type.t -> content_formats_t
