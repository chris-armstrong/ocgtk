(* High-level class for IOModule *)
class io_module (obj : Io_module.t) = object (self)

  method load : unit -> unit =
    fun () ->
      (Io_module.load obj)

  method unload : unit -> unit =
    fun () ->
      (Io_module.unload obj)

    method as_io_module = obj
end

