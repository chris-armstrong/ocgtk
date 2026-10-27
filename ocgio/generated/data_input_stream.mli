(** Data input stream implements [Gio.InputStream] and includes functions for
    reading structured data directly from a binary input stream.

    Its methods, signals and properties are on
    {!class-type-data_input_stream_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Data_input_stream}. *)

(** The methods, signals and properties of a [GDataInputStream]. *)
class type data_input_stream_t = object
  inherit Buffered_input_stream.buffered_input_stream_t

  method get_byte_order : unit -> Enums.datastreambyteorder
  (** Gets the byte order for the data input stream. *)

  method get_newline_type : unit -> Enums.datastreamnewlinetype
  (** Gets the current newline type for the [stream]. *)

  method read_int16 :
    Cancellable.cancellable_t option -> (Int16.t, GError.t) result
  (** Reads a 16-bit/2-byte value from [stream].

      In order to get the correct byte order for this read operation, see
      g_data_input_stream_get_byte_order() and
      g_data_input_stream_set_byte_order(). *)

  method read_int32 :
    Cancellable.cancellable_t option -> (Int32.t, GError.t) result
  (** Reads a signed 32-bit/4-byte value from [stream].

      In order to get the correct byte order for this read operation, see
      g_data_input_stream_get_byte_order() and
      g_data_input_stream_set_byte_order().

      If [cancellable] is not [NULL], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. *)

  method read_int64 :
    Cancellable.cancellable_t option -> (int64, GError.t) result
  (** Reads a 64-bit/8-byte value from [stream].

      In order to get the correct byte order for this read operation, see
      g_data_input_stream_get_byte_order() and
      g_data_input_stream_set_byte_order().

      If [cancellable] is not [NULL], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. *)

  method read_uint16 :
    Cancellable.cancellable_t option -> (UInt16.t, GError.t) result
  (** Reads an unsigned 16-bit/2-byte value from [stream].

      In order to get the correct byte order for this read operation, see
      g_data_input_stream_get_byte_order() and
      g_data_input_stream_set_byte_order(). *)

  method read_uint32 :
    Cancellable.cancellable_t option -> (UInt32.t, GError.t) result
  (** Reads an unsigned 32-bit/4-byte value from [stream].

      In order to get the correct byte order for this read operation, see
      g_data_input_stream_get_byte_order() and
      g_data_input_stream_set_byte_order().

      If [cancellable] is not [NULL], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. *)

  method read_uint64 :
    Cancellable.cancellable_t option -> (UInt64.t, GError.t) result
  (** Reads an unsigned 64-bit/8-byte value from [stream].

      In order to get the correct byte order for this read operation, see
      g_data_input_stream_get_byte_order().

      If [cancellable] is not [NULL], then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [G_IO_ERROR_CANCELLED] will be returned. *)

  method set_byte_order : Enums.datastreambyteorder -> unit
  (** This function sets the byte order for the given [stream]. All subsequent
      reads from the [stream] will be read in the given [order]. *)

  method set_newline_type : Enums.datastreamnewlinetype -> unit
  [@@ocaml.doc
    "Sets the newline type for the [stream].\n\n\
     Note that using G_DATA_STREAM_NEWLINE_TYPE_ANY is slightly unsafe. If a \
     read\n\
     chunk ends in \"CR\" we must read an additional byte to know if this is \
     \"CR\" or\n\
     \"CR LF\", and this might block if there is no more data available."]

  method as_data_input_stream : Raw.Data_input_stream.t
end

class data_input_stream : Raw.Data_input_stream.t -> data_input_stream_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Data_input_stream.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GDataInputStream], give one already wrapped. *)

(** {2:constructors Constructors} *)

val new_ : Input_stream.input_stream_t -> data_input_stream_t
(** Creates a new data input stream for the [base_stream]. *)
