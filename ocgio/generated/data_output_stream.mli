(** Data output stream implements [Gio.OutputStream] and includes functions for
    writing data directly to an output stream.

    Its methods, signals and properties are on
    {!class-type-data_output_stream_t}. The functions it is built on are in
    {!Ocgio.Raw.Data_output_stream}. *)

(** The methods, signals and properties of a [GDataOutputStream]. *)
class type data_output_stream_t = object
  inherit Filter_output_stream.filter_output_stream_t
  inherit Seekable.seekable_t
  method get_byte_order : unit -> Enums.datastreambyteorder

  method put_int16 :
    Int16.t -> Cancellable.cancellable_t option -> (bool, GError.t) result

  method put_int32 :
    Int32.t -> Cancellable.cancellable_t option -> (bool, GError.t) result

  method put_int64 :
    int64 -> Cancellable.cancellable_t option -> (bool, GError.t) result

  method put_string :
    string -> Cancellable.cancellable_t option -> (bool, GError.t) result

  method put_uint16 :
    UInt16.t -> Cancellable.cancellable_t option -> (bool, GError.t) result

  method put_uint32 :
    UInt32.t -> Cancellable.cancellable_t option -> (bool, GError.t) result

  method put_uint64 :
    UInt64.t -> Cancellable.cancellable_t option -> (bool, GError.t) result

  method set_byte_order : Enums.datastreambyteorder -> unit
  method as_data_output_stream : Raw.Data_output_stream.t
end

class data_output_stream : Raw.Data_output_stream.t -> data_output_stream_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Data_output_stream.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GDataOutputStream], give one already wrapped. *)

val new_ : Output_stream.output_stream_t -> data_output_stream_t
