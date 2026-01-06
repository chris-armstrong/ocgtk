(* GENERATED CODE - DO NOT EDIT *)
(* ContentSerializer: ContentSerializer *)

type t = [`content_serializer | `object_] Gobject.obj

(* Methods *)
(** Indicate that the serialization has been successfully completed. *)
external return_success : t -> unit = "ml_gdk_content_serializer_return_success"

(** Gets the I/O priority for the current operation.

This is the priority that was passed to [func@content_serialize_async]. *)
external get_priority : t -> int = "ml_gdk_content_serializer_get_priority"

(** Gets the mime type to serialize to. *)
external get_mime_type : t -> string = "ml_gdk_content_serializer_get_mime_type"

