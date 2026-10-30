class type content_formats_builder_t = object
  (** {2:methods Methods} *)

  method add_formats : Raw.Content_formats.t -> unit
  (** Appends all formats from [formats] to [builder], skipping those that
      already exist. *)

  method add_gtype : Gobject.Type.t -> unit
  (** Appends [type] to [builder] if it has not already been added. *)

  method add_mime_type : string -> unit
  (** Appends [mime_type] to [builder] if it has not already been added. *)

  method ref : unit -> Raw.Content_formats_builder.t
  (** Acquires a reference on the given [builder].

      This function is intended primarily for bindings.
      [GdkContentFormatsBuilder] objects should not be kept around. *)

  method to_formats : unit -> Raw.Content_formats.t
  (** Creates a new [GdkContentFormats] from the given [builder].

      The given [GdkContentFormatsBuilder] is reset once this function returns;
      you cannot call this function multiple times on the same [builder]
      instance.

      This function is intended primarily for bindings. C code should use
      [Gdk.ContentFormatsBuilder.free_to_formats]. *)

  (** {2:conversions Conversions} *)

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
