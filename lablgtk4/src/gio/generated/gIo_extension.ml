(* High-level class for IOExtension *)
class io_extension (obj : Io_extension.t) = object (self)

  method get_name : unit -> string =
    fun () ->
      (Io_extension.get_name obj)

  method get_priority : unit -> int =
    fun () ->
      (Io_extension.get_priority obj)

    method as_io_extension = obj
end

