class type io_extension_t = object
    method get_name : unit -> string
    method get_priority : unit -> int
    method get_type : unit -> int
    method as_io_extension : Io_extension.t
end

(* High-level class for IOExtension *)
class io_extension (obj : Io_extension.t) : io_extension_t = object (self)

  method get_name : unit -> string =
    fun () ->
      (Io_extension.get_name obj)

  method get_priority : unit -> int =
    fun () ->
      (Io_extension.get_priority obj)

  method get_type : unit -> int =
    fun () ->
      (Io_extension.get_type obj)

    method as_io_extension = obj
end

