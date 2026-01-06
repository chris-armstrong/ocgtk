(* GENERATED CODE - DO NOT EDIT *)
(* ContentProvider: ContentProvider *)

type t = [`content_provider | `object_] Gobject.obj

(** Create a new ContentProvider *)
external new_for_bytes : string -> unit -> t = "ml_gdk_content_provider_new_for_bytes"

(** Create a new ContentProvider *)
external new_for_value : unit -> t = "ml_gdk_content_provider_new_for_value"

(** Create a new ContentProvider *)
external new_typed : unit -> unit -> t = "ml_gdk_content_provider_new_typed"

(** Create a new ContentProvider *)
external new_union : unit -> unit -> t = "ml_gdk_content_provider_new_union"

(* Methods *)
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
external get_formats : t -> Content_formats.t = "ml_gtk_content_provider_get_formats"

(** Get property: storable-formats *)
external get_storable_formats : t -> Content_formats.t = "ml_gtk_content_provider_get_storable_formats"

