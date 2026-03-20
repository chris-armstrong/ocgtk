class type converter_input_stream_t = object
    method get_converter : unit -> GConverter.converter_t
    method as_converter_input_stream : Converter_input_stream.t
end

(* High-level class for ConverterInputStream *)
class converter_input_stream (obj : Converter_input_stream.t) : converter_input_stream_t = object (self)

  method get_converter : unit -> GConverter.converter_t =
    fun () ->
      new  GConverter.converter(Converter_input_stream.get_converter obj)

    method as_converter_input_stream = obj
end

