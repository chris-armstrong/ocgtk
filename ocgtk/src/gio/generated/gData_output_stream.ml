class type data_output_stream_t = object
    inherit GFilter_output_stream.filter_output_stream_t
    method get_byte_order : unit -> Gio_enums.datastreambyteorder
    method put_string : string -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method set_byte_order : Gio_enums.datastreambyteorder -> unit
    method as_data_output_stream : Data_output_stream.t
end

(* High-level class for DataOutputStream *)
class data_output_stream (obj : Data_output_stream.t) : data_output_stream_t = object (self)
  inherit GFilter_output_stream.filter_output_stream (Obj.magic obj : Filter_output_stream.t)

  method get_byte_order : unit -> Gio_enums.datastreambyteorder =
    fun () ->
      (Data_output_stream.get_byte_order obj)

  method put_string : string -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun str cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Data_output_stream.put_string obj str cancellable)

  method set_byte_order : Gio_enums.datastreambyteorder -> unit =
    fun order ->
      (Data_output_stream.set_byte_order obj order)

    method as_data_output_stream = obj
end

