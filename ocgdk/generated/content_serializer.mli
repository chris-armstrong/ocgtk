(** Serializes content for inter-application data transfers.

    The [GdkContentSerializer] transforms an object that is identified by a
    GType into a serialized form (i.e. a byte stream) that is identified by a
    mime type.

    GTK provides serializers and deserializers for common data types such as
    text, colors, images or file lists. To register your own serialization
    functions, use [Gdk.content_register_serializer].

    Also see [Gdk.ContentDeserializer].

    Its methods, signals and properties are on
    {!class-type-content_serializer_t}. The functions it is built on are in
    {!Ocgdk.Raw.Content_serializer}. *)

(** The methods, signals and properties of a [GdkContentSerializer]. *)
class type content_serializer_t = object
  inherit Ocgio.Async_result.async_result_t
  method get_cancellable : unit -> Ocgio.Cancellable.cancellable_t option
  method get_gtype : unit -> Gobject.Type.t
  method get_mime_type : unit -> string
  method get_output_stream : unit -> Ocgio.Output_stream.output_stream_t
  method get_priority : unit -> int
  method get_value : unit -> Gobject.Value.t
  method return_error : GError.t -> unit
  method return_success : unit -> unit
  method as_content_serializer : Raw.Content_serializer.t
end

class content_serializer : Raw.Content_serializer.t -> content_serializer_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Content_serializer.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GdkContentSerializer], give one already wrapped. *)
