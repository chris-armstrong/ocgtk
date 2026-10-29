(** Serializes content for inter-application data transfers.

    Its methods, signals and properties are on
    {!class-type-content_serializer_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgdk.Raw.Content_serializer}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ContentSerializer].}

    Implements:
    - {{!Ocgio.Async_result.class-type-async_result_t}Ocgio.Async_result}

    Serializes content for inter-application data transfers.

    The [GdkContentSerializer] transforms an object that is identified by a
    GType into a serialized form (i.e. a byte stream) that is identified by a
    mime type.

    GTK provides serializers and deserializers for common data types such as
    text, colors, images or file lists. To register your own serialization
    functions, use [Gdk.content_register_serializer].

    Also see [Gdk.ContentDeserializer]. *)
class type content_serializer_t = object
  inherit Ocgio.Async_result.async_result_t

  (** {2:methods Methods} *)

  method get_cancellable : unit -> Ocgio.Cancellable.cancellable_t option
  (** Gets the cancellable for the current operation.

      This is the [GCancellable] that was passed to [content_serialize_async].
  *)

  method get_gtype : unit -> Gobject.Type.t
  (** Gets the [GType] to of the object to serialize. *)

  method get_mime_type : unit -> string
  (** Gets the mime type to serialize to. *)

  method get_output_stream : unit -> Ocgio.Output_stream.output_stream_t
  (** Gets the output stream for the current operation.

      This is the stream that was passed to [content_serialize_async]. *)

  method get_priority : unit -> int
  (** Gets the I/O priority for the current operation.

      This is the priority that was passed to [content_serialize_async]. *)

  method get_value : unit -> Gobject.Value.t
  (** Gets the [GValue] to read the object to serialize from. *)

  method return_error : GError.t -> unit
  (** Indicate that the serialization has ended with an error.

      This function consumes [error]. *)

  method return_success : unit -> unit
  (** Indicate that the serialization has been successfully completed. *)

  (** {2:conversions Conversions} *)

  method as_content_serializer : Raw.Content_serializer.t
end

class content_serializer : Raw.Content_serializer.t -> content_serializer_t
(** Wraps a raw handle of {!Ocgdk.Raw.Content_serializer.t}. *)

(** {1:description Description}

    Serializes content for inter-application data transfers.

    The [GdkContentSerializer] transforms an object that is identified by a
    GType into a serialized form (i.e. a byte stream) that is identified by a
    mime type.

    GTK provides serializers and deserializers for common data types such as
    text, colors, images or file lists. To register your own serialization
    functions, use [Gdk.content_register_serializer].

    Also see [Gdk.ContentDeserializer]. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
