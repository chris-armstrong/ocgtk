(* High-level class for ConverterOutputStream *)
class converter_output_stream (obj : Converter_output_stream.t) = object (self)

  method get_converter : unit -> GConverter.converter =
    fun () ->
      new  GConverter.converter(Converter_output_stream.get_converter obj)

    method as_converter_output_stream = obj
end

