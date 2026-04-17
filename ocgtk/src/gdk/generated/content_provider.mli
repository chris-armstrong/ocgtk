(* GENERATED CODE - DO NOT EDIT *)
(* ContentProvider: ContentProvider *)

type t = [`content_provider | `object_] Gobject.obj

(** Create a new ContentProvider *)
external new_for_bytes : string -> Glib_bytes.t -> t = "ml_gdk_content_provider_new_for_bytes"

(** Create a new ContentProvider *)
external new_union : t array option -> Gsize.t -> t = "ml_gdk_content_provider_new_union"

(* Methods *)
(** Finishes an asynchronous write operation.

See [method@Gdk.ContentProvider.write_mime_type_async]. *)
external write_mime_type_finish : t -> Ocgtk_gio.Gio.Wrappers.Async_result.t -> (bool, GError.t) result = "ml_gdk_content_provider_write_mime_type_finish"

(** Gets the formats that the provider suggests other applications to store
the data in.

An example of such an application would be a clipboard manager.

This can be assumed to be a subset of [method@Gdk.ContentProvider.ref_formats]. *)
external ref_storable_formats : t -> Content_formats.t = "ml_gdk_content_provider_ref_storable_formats"

(** Gets the formats that the provider can provide its current contents in. *)
external ref_formats : t -> Content_formats.t = "ml_gdk_content_provider_ref_formats"

(** Emits the ::content-changed signal. *)
external content_changed : t -> unit = "ml_gdk_content_provider_content_changed"

(* Properties *)

(** Get property: formats *)
external get_formats : t -> Content_formats.t = "ml_gdk_content_provider_get_formats"

(** Get property: storable-formats *)
external get_storable_formats : t -> Content_formats.t = "ml_gdk_content_provider_get_storable_formats"

