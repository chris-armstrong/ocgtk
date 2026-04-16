class type converter_t = object
  method reset : unit -> unit
  method as_converter : Converter.t
end

class converter : Converter.t -> converter_t
