class type converter_output_stream_t = object
    method get_converter : unit -> GConverter.converter_t
    method as_converter_output_stream : Converter_output_stream.t
end

(* High-level class for ConverterOutputStream *)
class converter_output_stream (obj : Converter_output_stream.t) : converter_output_stream_t = object (self)

  method get_converter : unit -> GConverter.converter_t =
    fun () ->
      new  GConverter.converter(Converter_output_stream.get_converter obj)

    method as_converter_output_stream = obj
end

