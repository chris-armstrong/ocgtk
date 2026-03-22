class type data_input_stream_t = object
    inherit GBuffered_input_stream.buffered_input_stream_t
    method get_byte_order : unit -> Gio_enums.datastreambyteorder
    method get_newline_type : unit -> Gio_enums.datastreamnewlinetype
    method set_byte_order : Gio_enums.datastreambyteorder -> unit
    method set_newline_type : Gio_enums.datastreamnewlinetype -> unit
    method as_data_input_stream : Data_input_stream.t
end

(* High-level class for DataInputStream *)
class data_input_stream (obj : Data_input_stream.t) : data_input_stream_t = object (self)
  inherit GBuffered_input_stream.buffered_input_stream (Obj.magic obj : Buffered_input_stream.t)

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

