class type content_formats_t = object
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

(* High-level class for ContentFormats *)
class content_formats (obj : Content_formats.t) : content_formats_t = object (self)

  method contain_mime_type : string -> bool =
    fun mime_type ->
      (Content_formats.contain_mime_type obj mime_type)

  method match_ : Content_formats.t -> bool =
    fun second ->
      (Content_formats.match_ obj second)

  method match_mime_type : Content_formats.t -> string option =
    fun second ->
      (Content_formats.match_mime_type obj second)

  method ref : unit -> Content_formats.t =
    fun () ->
      (Content_formats.ref obj)

  method to_string : unit -> string =
    fun () ->
      (Content_formats.to_string obj)

  method union : Content_formats.t -> Content_formats.t =
    fun second ->
      (Content_formats.union obj second)

  method union_deserialize_gtypes : unit -> Content_formats.t =
    fun () ->
      (Content_formats.union_deserialize_gtypes obj)

  method union_deserialize_mime_types : unit -> Content_formats.t =
    fun () ->
      (Content_formats.union_deserialize_mime_types obj)

  method union_serialize_gtypes : unit -> Content_formats.t =
    fun () ->
      (Content_formats.union_serialize_gtypes obj)

  method union_serialize_mime_types : unit -> Content_formats.t =
    fun () ->
      (Content_formats.union_serialize_mime_types obj)

  method unref : unit -> unit =
    fun () ->
      (Content_formats.unref obj)

    method as_content_formats = obj
end

let new_ (mime_types : string array option) (n_mime_types : int) : content_formats_t =
  new content_formats (Content_formats.new_ mime_types n_mime_types)

