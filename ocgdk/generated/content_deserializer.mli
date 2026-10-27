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
  method get_gtype : unit -> Gobject.Type.t
  method get_input_stream : unit -> Ocgio.Input_stream.input_stream_t
  method get_mime_type : unit -> string
  method get_priority : unit -> int
  method get_value : unit -> Gobject.Value.t
  method return_error : GError.t -> unit
  method return_success : unit -> unit
  method as_content_deserializer : Raw.Content_deserializer.t
end

class content_deserializer :
  Raw.Content_deserializer.t ->
  content_deserializer_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Content_deserializer.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GdkContentDeserializer], give one already wrapped. *)
