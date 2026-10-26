class type data_input_stream_t = object
  inherit Buffered_input_stream.buffered_input_stream_t
  method get_byte_order : unit -> Enums.datastreambyteorder
  method get_newline_type : unit -> Enums.datastreamnewlinetype

  method read_int16 :
    Cancellable.cancellable_t option -> (Int16.t, GError.t) result

  method read_int32 :
    Cancellable.cancellable_t option -> (Int32.t, GError.t) result

  method read_int64 :
    Cancellable.cancellable_t option -> (int64, GError.t) result

  method read_uint16 :
    Cancellable.cancellable_t option -> (UInt16.t, GError.t) result

  method read_uint32 :
    Cancellable.cancellable_t option -> (UInt32.t, GError.t) result

  method read_uint64 :
    Cancellable.cancellable_t option -> (UInt64.t, GError.t) result

  method set_byte_order : Enums.datastreambyteorder -> unit
  method set_newline_type : Enums.datastreamnewlinetype -> unit
  method as_data_input_stream : Raw.Data_input_stream.t
end

class data_input_stream : Raw.Data_input_stream.t -> data_input_stream_t

val new_ : Input_stream.input_stream_t -> data_input_stream_t
