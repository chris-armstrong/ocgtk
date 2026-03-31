class type io_extension_point_t = object
    method get_extension_by_name : string -> Io_extension.t
    method get_extensions : unit -> Io_extension.t list
    method as_io_extension_point : Io_extension_point.t
end

(* High-level class for IOExtensionPoint *)
class io_extension_point (obj : Io_extension_point.t) : io_extension_point_t = object (self)

  method get_extension_by_name : string -> Io_extension.t =
    fun name ->
      (Io_extension_point.get_extension_by_name obj name)

  method get_extensions : unit -> Io_extension.t list =
    fun () ->
      (Io_extension_point.get_extensions obj)

    method as_io_extension_point = obj
end

