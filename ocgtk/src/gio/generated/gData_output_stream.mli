class type data_output_stream_t = object
    inherit GFilter_output_stream.filter_output_stream_t
    inherit GSeekable.seekable_t
    method get_byte_order : unit -> Gio_enums.datastreambyteorder
    method put_int16 : Int16.t -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method put_int32 : Int32.t -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method put_int64 : int64 -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method put_string : string -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method put_uint16 : UInt16.t -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method put_uint32 : UInt32.t -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method put_uint64 : UInt64.t -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method set_byte_order : Gio_enums.datastreambyteorder -> unit
    method as_data_output_stream : Data_output_stream.t
end

class data_output_stream : Data_output_stream.t -> data_output_stream_t

val new_ : GOutput_stream.output_stream_t -> data_output_stream_t
