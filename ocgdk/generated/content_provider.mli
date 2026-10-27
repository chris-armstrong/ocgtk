(** Provides content for the clipboard or for drag-and-drop operations in a
    number of formats.

    To create a [GdkContentProvider], use [Gdk.ContentProvider.new_for_value] or
    [Gdk.ContentProvider.new_for_bytes].

    GDK knows how to handle common text and image formats out-of-the-box. See
    [Gdk.ContentSerializer] and [Gdk.ContentDeserializer] if you want to add
    support for application-specific data formats.

    Its methods, signals and properties are on {!class-type-content_provider_t}.
    The functions it is built on are in {!Ocgdk.Raw.Content_provider}. *)

(** The methods, signals and properties of a [GdkContentProvider]. *)
class type content_provider_t = object
  method on_content_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method content_changed : unit -> unit
  method ref_formats : unit -> Raw.Content_formats.t
  method ref_storable_formats : unit -> Raw.Content_formats.t

  method write_mime_type_finish :
    Ocgio.Async_result.async_result_t -> (bool, GError.t) result

  method as_content_provider : Raw.Content_provider.t
end

class content_provider : Raw.Content_provider.t -> content_provider_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Content_provider.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GdkContentProvider], give one already wrapped. *)

val new_for_bytes : string -> Glib_bytes.t -> content_provider_t
val new_for_value : Gobject.Value.t -> content_provider_t

val new_union :
  Raw.Content_provider.t array option -> Gsize.t -> content_provider_t
