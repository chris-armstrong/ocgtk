class type converter_input_stream_t = object
    inherit GFilter_input_stream.filter_input_stream_t
    inherit GPollable_input_stream.pollable_input_stream_t
    method get_converter : unit -> GConverter.converter_t
    method as_converter_input_stream : Converter_input_stream.t
end

(* High-level class for ConverterInputStream *)
class converter_input_stream (obj : Converter_input_stream.t) : converter_input_stream_t = object (self)
  inherit GFilter_input_stream.filter_input_stream (obj :> Filter_input_stream.t)
  inherit GPollable_input_stream.pollable_input_stream (Pollable_input_stream.from_gobject obj)

  method get_converter : unit -> GConverter.converter_t =
    fun () ->
      new  GConverter.converter(Converter_input_stream.get_converter obj)

    method as_converter_input_stream = obj
end

let new_ (base_stream : GInput_stream.input_stream_t) (converter : GConverter.converter_t) : converter_input_stream_t =
  let base_stream = base_stream#as_input_stream in
  let converter = converter#as_converter in
  let obj_ = Converter_input_stream.new_ base_stream converter in
  new converter_input_stream obj_

