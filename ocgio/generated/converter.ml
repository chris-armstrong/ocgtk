class type converter_t = object
  method convert_bytes : Glib_bytes.t -> (Glib_bytes.t, GError.t) result
  method reset : unit -> unit
  method as_converter : Raw.Converter.t
end

(* High-level class for Converter *)
class converter (obj : Raw.Converter.t) : converter_t =
  object (self)
    method convert_bytes : Glib_bytes.t -> (Glib_bytes.t, GError.t) result =
      fun bytes -> Raw.Converter.convert_bytes obj bytes

    method reset : unit -> unit = fun () -> Raw.Converter.reset obj
    method as_converter = obj
  end
