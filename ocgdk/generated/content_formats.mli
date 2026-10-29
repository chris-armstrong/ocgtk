(** Used to advertise and negotiate the format of content.

    Its methods, signals and properties are on {!class-type-content_formats_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Content_formats}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ContentFormats].}

    Used to advertise and negotiate the format of content.

    You will encounter [GdkContentFormats] when interacting with objects
    controlling operations that pass data between different widgets, window or
    application, like {{!Ocgdk.Drag.class-type-drag_t}[Gdk.Drag]},
    {{!Ocgdk.Drop.class-type-drop_t}[Gdk.Drop]},
    {{!Ocgdk.Clipboard.class-type-clipboard_t}[Gdk.Clipboard]} or
    {{!Ocgdk.Content_provider.class-type-content_provider_t}[Gdk.ContentProvider]}.

    GDK supports content in 2 forms: [GType] and mime type. Using [GTypes] is
    meant only for in-process content transfers. Mime types are meant to be used
    for data passing both in-process and out-of-process. The details of how data
    is passed is described in the documentation of the actual implementations.
    To transform between the two forms,
    {{!Ocgdk.Content_serializer.class-type-content_serializer_t}[Gdk.ContentSerializer]}
    and
    {{!Ocgdk.Content_deserializer.class-type-content_deserializer_t}[Gdk.ContentDeserializer]}
    are used.

    A [GdkContentFormats] describes a set of possible formats content can be
    exchanged in. It is assumed that this set is ordered. [GTypes] are more
    important than mime types. Order between different [GTypes] or mime types is
    the order they were added in, most important first. Functions that care
    about order, such as
    {{!Ocgdk.Content_formats.class-type-content_formats_t.method-union}[Gdk.ContentFormats.union]},
    will describe in their documentation how they interpret that order, though
    in general the order of the first argument is considered the primary order
    of the result, followed by the order of further arguments.

    For debugging purposes, the function
    {{!Ocgdk.Content_formats.class-type-content_formats_t.method-to_string}[Gdk.ContentFormats.to_string]}
    exists. It will print a comma-separated list of formats from most important
    to least important.

    [GdkContentFormats] is an immutable struct. After creation, you cannot
    change the types it represents. Instead, new [GdkContentFormats] have to be
    created. The
    {{!Ocgdk.Content_formats_builder.class-type-content_formats_builder_t}[Gdk.ContentFormatsBuilder]}
    structure is meant to help in this endeavor. *)
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

class content_formats : Raw.Content_formats.t -> content_formats_t
(** Wraps a raw handle of {!Ocgdk.Raw.Content_formats.t}. *)

(** {1:description Description}

    Used to advertise and negotiate the format of content.

    You will encounter [GdkContentFormats] when interacting with objects
    controlling operations that pass data between different widgets, window or
    application, like {{!Ocgdk.Drag.class-type-drag_t}[Gdk.Drag]},
    {{!Ocgdk.Drop.class-type-drop_t}[Gdk.Drop]},
    {{!Ocgdk.Clipboard.class-type-clipboard_t}[Gdk.Clipboard]} or
    {{!Ocgdk.Content_provider.class-type-content_provider_t}[Gdk.ContentProvider]}.

    GDK supports content in 2 forms: [GType] and mime type. Using [GTypes] is
    meant only for in-process content transfers. Mime types are meant to be used
    for data passing both in-process and out-of-process. The details of how data
    is passed is described in the documentation of the actual implementations.
    To transform between the two forms,
    {{!Ocgdk.Content_serializer.class-type-content_serializer_t}[Gdk.ContentSerializer]}
    and
    {{!Ocgdk.Content_deserializer.class-type-content_deserializer_t}[Gdk.ContentDeserializer]}
    are used.

    A [GdkContentFormats] describes a set of possible formats content can be
    exchanged in. It is assumed that this set is ordered. [GTypes] are more
    important than mime types. Order between different [GTypes] or mime types is
    the order they were added in, most important first. Functions that care
    about order, such as
    {{!Ocgdk.Content_formats.class-type-content_formats_t.method-union}[Gdk.ContentFormats.union]},
    will describe in their documentation how they interpret that order, though
    in general the order of the first argument is considered the primary order
    of the result, followed by the order of further arguments.

    For debugging purposes, the function
    {{!Ocgdk.Content_formats.class-type-content_formats_t.method-to_string}[Gdk.ContentFormats.to_string]}
    exists. It will print a comma-separated list of formats from most important
    to least important.

    [GdkContentFormats] is an immutable struct. After creation, you cannot
    change the types it represents. Instead, new [GdkContentFormats] have to be
    created. The
    {{!Ocgdk.Content_formats_builder.class-type-content_formats_builder_t}[Gdk.ContentFormatsBuilder]}
    structure is meant to help in this endeavor. *)

(** {1:constructors Constructors} *)

val new_ : string array option -> int -> content_formats_t
(** Creates a new [GdkContentFormats] from an array of mime types.

    The mime types must be valid and different from each other or the behavior
    of the return value is undefined. If you cannot guarantee this, use
    {{!Ocgdk.Content_formats_builder.class-type-content_formats_builder_t}[Gdk.ContentFormatsBuilder]}
    instead. *)

val new_for_gtype : Gobject.Type.t -> content_formats_t
(** Creates a new [GdkContentFormats] for a given [GType]. *)
