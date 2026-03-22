class type data_input_stream_t = object
    inherit GBuffered_input_stream.buffered_input_stream_t
    method get_byte_order : unit -> Gio_enums.datastreambyteorder
    method get_newline_type : unit -> Gio_enums.datastreamnewlinetype
    method set_byte_order : Gio_enums.datastreambyteorder -> unit
    method set_newline_type : Gio_enums.datastreamnewlinetype -> unit
    method as_data_input_stream : Data_input_stream.t
end

class data_input_stream : Data_input_stream.t -> data_input_stream_t

val new_ : GInput_stream.input_stream_t -> data_input_stream_t
