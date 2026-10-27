(** Used to advertise and negotiate the format of content.

    You will encounter [GdkContentFormats] when interacting with objects
    controlling operations that pass data between different widgets, window or
    application, like [Gdk.Drag], [Gdk.Drop], [Gdk.Clipboard] or
    [Gdk.ContentProvider].

    GDK supports content in 2 forms: [GType] and mime type. Using [GTypes] is
    meant only for in-process content transfers. Mime types are meant to be used
    for data passing both in-process and out-of-process. The details of how data
    is passed is described in the documentation of the actual implementations.
    To transform between the two forms, [Gdk.ContentSerializer] and
    [Gdk.ContentDeserializer] are used.

    A [GdkContentFormats] describes a set of possible formats content can be
    exchanged in. It is assumed that this set is ordered. [GTypes] are more
    important than mime types. Order between different [GTypes] or mime types is
    the order they were added in, most important first. Functions that care
    about order, such as [Gdk.ContentFormats.union], will describe in their
    documentation how they interpret that order, though in general the order of
    the first argument is considered the primary order of the result, followed
    by the order of further arguments.

    For debugging purposes, the function [Gdk.ContentFormats.to_string] exists.
    It will print a comma-separated list of formats from most important to least
    important.

    [GdkContentFormats] is an immutable struct. After creation, you cannot
    change the types it represents. Instead, new [GdkContentFormats] have to be
    created. The [Gdk.ContentFormatsBuilder] structure is meant to help in this
    endeavor.

    Its methods, signals and properties are on {!class-type-content_formats_t}.
    The functions it is built on are in {!Ocgdk.Raw.Content_formats}. *)

(** The methods, signals and properties of a [GdkContentFormats]. *)
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
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Content_formats.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GdkContentFormats], give one already wrapped. *)

val new_ : string array option -> int -> content_formats_t
val new_for_gtype : Gobject.Type.t -> content_formats_t
