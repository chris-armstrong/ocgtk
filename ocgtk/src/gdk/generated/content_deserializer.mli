(* GENERATED CODE - DO NOT EDIT *)
(* ContentDeserializer: ContentDeserializer *)

type t = [`content_deserializer | `object_] Gobject.obj

(* Methods *)
(** Indicate that the deserialization has been successfully completed. *)
external return_success : t -> unit = "ml_gdk_content_deserializer_return_success"

(** Gets the I/O priority for the current operation.

This is the priority that was passed to [func@Gdk.content_deserialize_async]. *)
external get_priority : t -> int = "ml_gdk_content_deserializer_get_priority"

(** Gets the mime type to deserialize from. *)
external get_mime_type : t -> string = "ml_gdk_content_deserializer_get_mime_type"

