class converter : Converter.t ->
  object
    method reset : unit -> unit
    method as_converter : Converter.t
  end

