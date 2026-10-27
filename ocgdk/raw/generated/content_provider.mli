(* GENERATED CODE - DO NOT EDIT *)
(* ContentProvider: ContentProvider *)

(** Provides content for the clipboard or for drag-and-drop operations in a
    number of formats.

    To create a [GdkContentProvider], use [Gdk.ContentProvider.new_for_value] or
    [Gdk.ContentProvider.new_for_bytes].

    GDK knows how to handle common text and image formats out-of-the-box. See
    [Gdk.ContentSerializer] and [Gdk.ContentDeserializer] if you want to add
    support for application-specific data formats.

    The class built on this module is in {!Ocgdk.Content_provider}. *)

type t = [ `content_provider | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gdk_content_provider_get_type"

external new_for_bytes : string -> Glib_bytes.t -> t
  = "ml_gdk_content_provider_new_for_bytes"
(** Create a content provider that provides the given [bytes] as data for the
    given [mime_type]. *)

external new_for_value : Gobject.Value.t -> t
  = "ml_gdk_content_provider_new_for_value"
(** Create a content provider that provides the given [value]. *)

external new_union : t array option -> Gsize.t -> t
  = "ml_gdk_content_provider_new_union"
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

(* Methods *)

external write_mime_type_finish :
  t -> Ocgio_raw.Async_result.t -> (bool, GError.t) result
  = "ml_gdk_content_provider_write_mime_type_finish"
(** Finishes an asynchronous write operation.

    See [Gdk.ContentProvider.write_mime_type_async]. *)

external ref_storable_formats : t -> Content_formats.t
  = "ml_gdk_content_provider_ref_storable_formats"
(** Gets the formats that the provider suggests other applications to store the
    data in.

    An example of such an application would be a clipboard manager.

    This can be assumed to be a subset of [Gdk.ContentProvider.ref_formats]. *)

external ref_formats : t -> Content_formats.t
  = "ml_gdk_content_provider_ref_formats"
(** Gets the formats that the provider can provide its current contents in. *)

external get_value : t -> (bool * Gobject.Value.t, GError.t) result
  = "ml_gdk_content_provider_get_value"
(** Gets the contents of [provider] stored in [value].

    The [value] will have been initialized to the [GType] the value should be
    provided in. This given [GType] does not need to be listed in the formats
    returned by [Gdk.ContentProvider.ref_formats]. However, if the given [GType]
    is not supported, this operation can fail and [G_IO_ERROR_NOT_SUPPORTED]
    will be reported. *)

external content_changed : t -> unit = "ml_gdk_content_provider_content_changed"
(** Emits the ::content-changed signal. *)

(* Properties *)

val on_content_changed :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
