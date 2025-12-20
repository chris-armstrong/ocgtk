(* High-level class for DataInputStream *)
class data_input_stream (obj : Data_input_stream.t) = object (self)

  method get_byte_order : unit -> Gio_enums.datastreambyteorder =
    fun () ->
      (Data_input_stream.get_byte_order obj)

  method get_newline_type : unit -> Gio_enums.datastreamnewlinetype =
    fun () ->
      (Data_input_stream.get_newline_type obj)

  method set_byte_order : Gio_enums.datastreambyteorder -> unit =
    fun order ->
      (Data_input_stream.set_byte_order obj order)

  method set_newline_type : Gio_enums.datastreamnewlinetype -> unit =
    fun type_ ->
      (Data_input_stream.set_newline_type obj type_)

    method as_data_input_stream = obj
end

