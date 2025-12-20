(* High-level class for Vfs *)
class vfs (obj : Vfs.t) = object (self)

  method is_active : unit -> bool =
    fun () ->
      (Vfs.is_active obj)

  method unregister_uri_scheme : string -> bool =
    fun scheme ->
      (Vfs.unregister_uri_scheme obj scheme)

    method as_vfs = obj
end

