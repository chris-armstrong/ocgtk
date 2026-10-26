class type content_formats_builder_t = object
  method add_formats : Raw.Content_formats.t -> unit
  method add_gtype : Gobject.Type.t -> unit
  method add_mime_type : string -> unit
  method ref : unit -> Raw.Content_formats_builder.t
  method to_formats : unit -> Raw.Content_formats.t
  method as_content_formats_builder : Raw.Content_formats_builder.t
end

(* High-level class for ContentFormatsBuilder *)
class content_formats_builder (obj : Raw.Content_formats_builder.t) :
  content_formats_builder_t =
  object (self)
    method add_formats : Raw.Content_formats.t -> unit =
      fun formats -> Raw.Content_formats_builder.add_formats obj formats

    method add_gtype : Gobject.Type.t -> unit =
      fun type_ -> Raw.Content_formats_builder.add_gtype obj type_

    method add_mime_type : string -> unit =
      fun mime_type -> Raw.Content_formats_builder.add_mime_type obj mime_type

    method ref : unit -> Raw.Content_formats_builder.t =
      fun () -> Raw.Content_formats_builder.ref obj

    method to_formats : unit -> Raw.Content_formats.t =
      fun () -> Raw.Content_formats_builder.to_formats obj

    method as_content_formats_builder = obj
  end

let new_ () : content_formats_builder_t =
  new content_formats_builder (Raw.Content_formats_builder.new_ ())
