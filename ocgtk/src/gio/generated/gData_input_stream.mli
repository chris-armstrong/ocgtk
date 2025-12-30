class data_input_stream : Data_input_stream.t ->
  object
    method get_byte_order : unit -> Gio_enums.datastreambyteorder
    method get_newline_type : unit -> Gio_enums.datastreamnewlinetype
    method set_byte_order : Gio_enums.datastreambyteorder -> unit
    method set_newline_type : Gio_enums.datastreamnewlinetype -> unit
    method as_data_input_stream : Data_input_stream.t
  end

