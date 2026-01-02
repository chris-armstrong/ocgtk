(* GENERATED CODE - DO NOT EDIT *)
(* ContentFormatsBuilder: ContentFormatsBuilder *)

(** A `GdkContentFormatsBuilder` is an auxiliary struct used to create
new `GdkContentFormats`, and should not be kept around. *)
type t = [`content_formats_builder] Gobject.obj

(** Create a new ContentFormatsBuilder *)
external new_ : unit -> t = "ml_gdk_content_formats_builder_new"

(* Methods *)
(** Releases a reference on the given @builder. *)
external unref : t -> unit = "ml_gdk_content_formats_builder_unref"

(** Creates a new `GdkContentFormats` from the given @builder.

The given `GdkContentFormatsBuilder` is reset once this function returns;
you cannot call this function multiple times on the same @builder instance.

This function is intended primarily for bindings. C code should use
[method@Gdk.ContentFormatsBuilder.free_to_formats]. *)
external to_formats : t -> Content_formats.t = "ml_gdk_content_formats_builder_to_formats"

(** Acquires a reference on the given @builder.

This function is intended primarily for bindings.
`GdkContentFormatsBuilder` objects should not be kept around. *)
external ref : t -> t = "ml_gdk_content_formats_builder_ref"

(** Creates a new `GdkContentFormats` from the current state of the
given @builder, and frees the @builder instance. *)
external free_to_formats : t -> Content_formats.t = "ml_gdk_content_formats_builder_free_to_formats"

(** Appends @mime_type to @builder if it has not already been added. *)
external add_mime_type : t -> string -> unit = "ml_gdk_content_formats_builder_add_mime_type"

(** Appends all formats from @formats to @builder, skipping those that
already exist. *)
external add_formats : t -> Content_formats.t -> unit = "ml_gdk_content_formats_builder_add_formats"

