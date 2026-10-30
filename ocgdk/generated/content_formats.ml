class type content_formats_t = object
  (** {2:methods Methods} *)

  method contain_gtype : Gobject.Type.t -> bool
  (** Checks if a given [GType] is part of the given [formats]. *)

  method contain_mime_type : string -> bool
  (** Checks if a given mime type is part of the given [formats]. *)

  method is_empty : unit -> bool
  (** Returns whether the content formats contain any formats. *)

  method match_ : Raw.Content_formats.t -> bool
  (** Checks if [first] and [second] have any matching formats. *)

  method match_gtype : Raw.Content_formats.t -> Gobject.Type.t
  (** Finds the first [GType] from [first] that is also contained in [second].

      If no matching [GType] is found, [G_TYPE_INVALID] is returned. *)

  method match_mime_type : Raw.Content_formats.t -> string option
  (** Finds the first mime type from [first] that is also contained in [second].

      If no matching mime type is found, [None] is returned. *)

  method ref : unit -> Raw.Content_formats.t
  (** Increases the reference count of a [GdkContentFormats] by one. *)

  method to_string : unit -> string
  (** Prints the given [formats] into a human-readable string.

      The resulting string can be parsed with [Gdk.ContentFormats.parse].

      This is a small wrapper around [Gdk.ContentFormats.print] to help when
      debugging. *)

  method union : Raw.Content_formats.t -> Raw.Content_formats.t
  (** Append all missing types from [second] to [first], in the order they had
      in [second]. *)

  method union_deserialize_gtypes : unit -> Raw.Content_formats.t
  (** Add GTypes for mime types in [formats] for which deserializers are
      registered. *)

  method union_deserialize_mime_types : unit -> Raw.Content_formats.t
  (** Add mime types for GTypes in [formats] for which deserializers are
      registered. *)

  method union_serialize_gtypes : unit -> Raw.Content_formats.t
  (** Add GTypes for the mime types in [formats] for which serializers are
      registered. *)

  method union_serialize_mime_types : unit -> Raw.Content_formats.t
  (** Add mime types for GTypes in [formats] for which serializers are
      registered. *)

  (** {2:conversions Conversions} *)

  method as_content_formats : Raw.Content_formats.t
end

(* High-level class for ContentFormats *)
class content_formats (obj : Raw.Content_formats.t) : content_formats_t =
  object (self)
    method contain_gtype : Gobject.Type.t -> bool =
      fun type_ -> Raw.Content_formats.contain_gtype obj type_

    method contain_mime_type : string -> bool =
      fun mime_type -> Raw.Content_formats.contain_mime_type obj mime_type

    method is_empty : unit -> bool = fun () -> Raw.Content_formats.is_empty obj

    method match_ : Raw.Content_formats.t -> bool =
      fun second -> Raw.Content_formats.match_ obj second

    method match_gtype : Raw.Content_formats.t -> Gobject.Type.t =
      fun second -> Raw.Content_formats.match_gtype obj second

    method match_mime_type : Raw.Content_formats.t -> string option =
      fun second -> Raw.Content_formats.match_mime_type obj second

    method ref : unit -> Raw.Content_formats.t =
      fun () -> Raw.Content_formats.ref obj

    method to_string : unit -> string =
      fun () -> Raw.Content_formats.to_string obj

    method union : Raw.Content_formats.t -> Raw.Content_formats.t =
      fun second -> Raw.Content_formats.union obj second

    method union_deserialize_gtypes : unit -> Raw.Content_formats.t =
      fun () -> Raw.Content_formats.union_deserialize_gtypes obj

    method union_deserialize_mime_types : unit -> Raw.Content_formats.t =
      fun () -> Raw.Content_formats.union_deserialize_mime_types obj

    method union_serialize_gtypes : unit -> Raw.Content_formats.t =
      fun () -> Raw.Content_formats.union_serialize_gtypes obj

    method union_serialize_mime_types : unit -> Raw.Content_formats.t =
      fun () -> Raw.Content_formats.union_serialize_mime_types obj

    method as_content_formats = obj
  end

let new_ (mime_types : string array option) (n_mime_types : int) :
    content_formats_t =
  let obj_ = Raw.Content_formats.new_ mime_types n_mime_types in
  new content_formats obj_

let new_for_gtype (type_ : Gobject.Type.t) : content_formats_t =
  let obj_ = Raw.Content_formats.new_for_gtype type_ in
  new content_formats obj_
