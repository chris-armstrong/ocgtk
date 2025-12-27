class converter_output_stream : Converter_output_stream.t ->
  object
    method get_converter : unit -> GConverter.converter
    method as_converter_output_stream : Converter_output_stream.t
  end

