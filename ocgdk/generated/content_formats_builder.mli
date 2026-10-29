(** Creates [GdkContentFormats] objects.

    Its methods, signals and properties are on
    {!class-type-content_formats_builder_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Content_formats_builder}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ContentFormatsBuilder].}

    Creates [GdkContentFormats] objects. *)
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

class content_formats_builder :
  Raw.Content_formats_builder.t ->
  content_formats_builder_t
(** Wraps a raw handle of {!Ocgdk.Raw.Content_formats_builder.t}. *)

(** {1:constructors Constructors} *)

val new_ : unit -> content_formats_builder_t
(** Create a new [GdkContentFormatsBuilder] object.

    The resulting builder would create an empty [GdkContentFormats]. Use
    addition functions to add types to it. *)
