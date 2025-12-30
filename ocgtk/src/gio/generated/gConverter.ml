(* High-level class for Converter *)
class converter (obj : Converter.t) = object (self)

  method reset : unit -> unit =
    fun () ->
      (Converter.reset obj)

    method as_converter = obj
end

