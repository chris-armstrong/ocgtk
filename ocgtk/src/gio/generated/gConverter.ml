class type converter_t = object
    method reset : unit -> unit
    method as_converter : Converter.t
end

(* High-level class for Converter *)
class converter (obj : Converter.t) : converter_t = object (self)

  method reset : unit -> unit =
    fun () ->
      (Converter.reset obj)

    method as_converter = obj
end

