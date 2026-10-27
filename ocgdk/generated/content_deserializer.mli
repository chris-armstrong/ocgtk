(** Deserializes content received via inter-application data transfers.

    The [GdkContentDeserializer] transforms serialized content that is
    identified by a mime type into an object identified by a GType.

    GTK provides serializers and deserializers for common data types such as
    text, colors, images or file lists. To register your own deserialization
    functions, use [content_register_deserializer].

    Also see [Gdk.ContentSerializer].

    Its methods, signals and properties are on
    {!class-type-content_deserializer_t}. The functions it is built on are in
    {!Ocgdk.Raw.Content_deserializer}. *)

(** The methods, signals and properties of a [GdkContentDeserializer]. *)
class type content_deserializer_t = object
  inherit Ocgio.Async_result.async_result_t

  method get_cancellable : unit -> Ocgio.Cancellable.cancellable_t option
  (** Gets the cancellable for the current operation.

      This is the [GCancellable] that was passed to
      [Gdk.content_deserialize_async]. *)

  method get_gtype : unit -> Gobject.Type.t
  (** Gets the [GType] to create an instance of. *)

  method get_input_stream : unit -> Ocgio.Input_stream.input_stream_t
  (** Gets the input stream for the current operation.

      This is the stream that was passed to [Gdk.content_deserialize_async]. *)

  method get_mime_type : unit -> string
  (** Gets the mime type to deserialize from. *)

  method get_priority : unit -> int
  (** Gets the I/O priority for the current operation.

      This is the priority that was passed to [Gdk.content_deserialize_async].
  *)

  method get_value : unit -> Gobject.Value.t
  (** Gets the [GValue] to store the deserialized object in. *)

  method return_error : GError.t -> unit
  (** Indicate that the deserialization has ended with an error.

      This function consumes [error]. *)

  method return_success : unit -> unit
  (** Indicate that the deserialization has been successfully completed. *)

  method as_content_deserializer : Raw.Content_deserializer.t
end

class content_deserializer :
  Raw.Content_deserializer.t ->
  content_deserializer_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Content_deserializer.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GdkContentDeserializer], give one already wrapped. *)
