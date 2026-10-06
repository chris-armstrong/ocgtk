(* GENERATED CODE - DO NOT EDIT *)
(* ContentSerializer: ContentSerializer *)

(** Serializes content for inter-application data transfers.

    The [GdkContentSerializer] transforms an object that is identified by a
    GType into a serialized form (i.e. a byte stream) that is identified by a
    mime type.

    GTK provides serializers and deserializers for common data types such as
    text, colors, images or file lists. To register your own serialization
    functions, use [Gdk.content_register_serializer].

    Also see [Gdk.ContentDeserializer]. *)

type t = [ `content_serializer | `object_ ] Gobject.obj

(* Methods *)

external return_success : t -> unit = "ml_gdk_content_serializer_return_success"
(** Indicate that the serialization has been successfully completed. *)

external return_error : t -> GError.t -> unit
  = "ml_gdk_content_serializer_return_error"
(** Indicate that the serialization has ended with an error.

    This function consumes [error]. *)

external get_value : t -> Gobject.Value.t
  = "ml_gdk_content_serializer_get_value"
(** Gets the [GValue] to read the object to serialize from. *)

external get_priority : t -> int = "ml_gdk_content_serializer_get_priority"
(** Gets the I/O priority for the current operation.

    This is the priority that was passed to [content_serialize_async]. *)

external get_output_stream : t -> Ocgtk_gio.Gio.Wrappers.Output_stream.t
  = "ml_gdk_content_serializer_get_output_stream"
(** Gets the output stream for the current operation.

    This is the stream that was passed to [content_serialize_async]. *)

external get_mime_type : t -> string = "ml_gdk_content_serializer_get_mime_type"
(** Gets the mime type to serialize to. *)

external get_gtype : t -> Gobject.Type.t = "ml_gdk_content_serializer_get_gtype"
(** Gets the [GType] to of the object to serialize. *)

external get_cancellable : t -> Ocgtk_gio.Gio.Wrappers.Cancellable.t option
  = "ml_gdk_content_serializer_get_cancellable"
(** Gets the cancellable for the current operation.

    This is the [GCancellable] that was passed to [content_serialize_async]. *)
