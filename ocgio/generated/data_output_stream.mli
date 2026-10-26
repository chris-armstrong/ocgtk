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

val new_ : Output_stream.output_stream_t -> data_output_stream_t
