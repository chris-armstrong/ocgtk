class type data_output_stream_t = object
    method get_byte_order : unit -> Gio_enums.datastreambyteorder
    method put_string : string -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method set_byte_order : Gio_enums.datastreambyteorder -> unit
    method as_data_output_stream : Data_output_stream.t
end

class data_output_stream : Data_output_stream.t -> data_output_stream_t

