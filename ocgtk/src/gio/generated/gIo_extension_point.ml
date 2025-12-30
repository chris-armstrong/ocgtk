(* High-level class for IOExtensionPoint *)
class io_extension_point (obj : Io_extension_point.t) = object (self)

  method get_extension_by_name : string -> Io_extension.t =
    fun name ->
      (Io_extension_point.get_extension_by_name obj name)

    method as_io_extension_point = obj
end

