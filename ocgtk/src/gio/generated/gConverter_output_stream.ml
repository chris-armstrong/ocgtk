class type converter_output_stream_t = object
    inherit GFilter_output_stream.filter_output_stream_t
    method get_converter : unit -> GConverter.converter_t
    method as_converter_output_stream : Converter_output_stream.t
end

(* High-level class for ConverterOutputStream *)
class converter_output_stream (obj : Converter_output_stream.t) : converter_output_stream_t = object (self)
  inherit GFilter_output_stream.filter_output_stream (obj :> Filter_output_stream.t)

  method get_converter : unit -> GConverter.converter_t =
    fun () ->
      new  GConverter.converter(Converter_output_stream.get_converter obj)

    method as_converter_output_stream = obj
end

let new_ (base_stream : GOutput_stream.output_stream_t) (converter : GConverter.converter_t) : converter_output_stream_t =
  let base_stream = base_stream#as_output_stream in
  let converter = converter#as_converter in
  new converter_output_stream (Converter_output_stream.new_ base_stream converter)

