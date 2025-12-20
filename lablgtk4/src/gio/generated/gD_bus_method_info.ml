(* High-level class for DBusMethodInfo *)
class d_bus_method_info (obj : D_bus_method_info.t) = object (self)

  method ref : unit -> D_bus_method_info.t =
    fun () ->
      (D_bus_method_info.ref obj)

  method unref : unit -> unit =
    fun () ->
      (D_bus_method_info.unref obj)

    method as_d_bus_method_info = obj
end

