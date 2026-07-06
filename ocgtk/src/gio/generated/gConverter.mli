class type converter_t = object
  method convert_bytes : Glib_bytes.t -> (Glib_bytes.t, GError.t) result
  method reset : unit -> unit
  method as_converter : Converter.t
end

class converter : Converter.t -> converter_t
