class type converter_input_stream_t = object
  inherit Filter_input_stream.filter_input_stream_t
  inherit Pollable_input_stream.pollable_input_stream_t

  (** {2:methods Methods} *)

  method get_converter : unit -> Converter.converter_t
  (** Gets the [GConverter] that is used by [converter_stream]. *)

  (** {2:conversions Conversions} *)

  method as_converter_input_stream : Raw.Converter_input_stream.t
end

(* High-level class for ConverterInputStream *)
class converter_input_stream (obj : Raw.Converter_input_stream.t) :
  converter_input_stream_t =
  object (self)
    inherit
      Filter_input_stream.filter_input_stream (obj :> Raw.Filter_input_stream.t)

    inherit
      Pollable_input_stream.pollable_input_stream
        (Raw.Pollable_input_stream.from_gobject obj)

    method get_converter : unit -> Converter.converter_t =
      fun () ->
        new Converter.converter (Raw.Converter_input_stream.get_converter obj)

    method as_converter_input_stream = obj
  end

let new_ (base_stream : Input_stream.input_stream_t)
    (converter : Converter.converter_t) : converter_input_stream_t =
  let base_stream = base_stream#as_input_stream in
  let converter = converter#as_converter in
  let obj_ = Raw.Converter_input_stream.new_ base_stream converter in
  new converter_input_stream obj_
