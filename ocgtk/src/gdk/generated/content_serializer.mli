(* GENERATED CODE - DO NOT EDIT *)
(* ContentSerializer: ContentSerializer *)

type t = [`content_serializer | `object_] Gobject.obj

(* Methods *)
(** Indicate that the serialization has been successfully completed. *)
external return_success : t -> unit = "ml_gdk_content_serializer_return_success"

(** Gets the I/O priority for the current operation.

This is the priority that was passed to [func@content_serialize_async]. *)
external get_priority : t -> int = "ml_gdk_content_serializer_get_priority"

(** Gets the output stream for the current operation.

This is the stream that was passed to [func@content_serialize_async]. *)
external get_output_stream : t -> Ocgtk_gio.Gio.Wrappers.Output_stream.t = "ml_gdk_content_serializer_get_output_stream"

(** Gets the mime type to serialize to. *)
external get_mime_type : t -> string = "ml_gdk_content_serializer_get_mime_type"

(** Gets the cancellable for the current operation.

This is the `GCancellable` that was passed to [func@content_serialize_async]. *)
external get_cancellable : t -> Ocgtk_gio.Gio.Wrappers.Cancellable.t option = "ml_gdk_content_serializer_get_cancellable"

