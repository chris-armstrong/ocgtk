(* High-level class for ConverterInputStream *)
class converter_input_stream (obj : Converter_input_stream.t) = object (self)

  method get_converter : unit -> GConverter.converter =
    fun () ->
      new  GConverter.converter(Converter_input_stream.get_converter obj)

    method as_converter_input_stream = obj
end

