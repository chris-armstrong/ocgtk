(** Provides content for the clipboard or for drag-and-drop operations in a
    number of formats.

    To create a [GdkContentProvider], use [Gdk.ContentProvider.new_for_value] or
    [Gdk.ContentProvider.new_for_bytes].

    GDK knows how to handle common text and image formats out-of-the-box. See
    [Gdk.ContentSerializer] and [Gdk.ContentDeserializer] if you want to add
    support for application-specific data formats.

    Its methods, signals and properties are on {!class-type-content_provider_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgdk.Raw.Content_provider}. *)

(** The methods, signals and properties of a [GdkContentProvider]. *)
class type content_provider_t = object
  method on_content_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method content_changed : unit -> unit
  (** Emits the ::content-changed signal. *)

  method ref_formats : unit -> Raw.Content_formats.t
  (** Gets the formats that the provider can provide its current contents in. *)

  method ref_storable_formats : unit -> Raw.Content_formats.t
  (** Gets the formats that the provider suggests other applications to store
      the data in.

      An example of such an application would be a clipboard manager.

      This can be assumed to be a subset of [Gdk.ContentProvider.ref_formats].
  *)

  method write_mime_type_finish :
    Ocgio.Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes an asynchronous write operation.

      See [Gdk.ContentProvider.write_mime_type_async]. *)

  method as_content_provider : Raw.Content_provider.t
end

class content_provider : Raw.Content_provider.t -> content_provider_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Content_provider.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GdkContentProvider], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_for_bytes : string -> Glib_bytes.t -> content_provider_t
(** Create a content provider that provides the given [bytes] as data for the
    given [mime_type]. *)

val new_for_value : Gobject.Value.t -> content_provider_t
(** Create a content provider that provides the given [value]. *)

val new_union :
  Raw.Content_provider.t array option -> Gsize.t -> content_provider_t
(** Creates a content provider that represents all the given [providers].

    Whenever data needs to be written, the union provider will try the given
    [providers] in the given order and the first one supporting a format will be
    chosen to provide it.

    This allows an easy way to support providing data in different formats. For
    example, an image may be provided by its file and by the image contents with
    a call such as

    {[
    gdk_content_provider_new_union ((GdkContentProvider *[2]) {
                                      gdk_content_provider_new_typed (G_TYPE_FILE, file),
                                      gdk_content_provider_new_typed (GDK_TYPE_TEXTURE, texture)
                                    }, 2);
    ]} *)
