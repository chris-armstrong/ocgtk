(* High-level class for DBusArgInfo *)
class d_bus_arg_info (obj : D_bus_arg_info.t) = object (self)

  method ref : unit -> D_bus_arg_info.t =
    fun () ->
      (D_bus_arg_info.ref obj)

  method unref : unit -> unit =
    fun () ->
      (D_bus_arg_info.unref obj)

    method as_d_bus_arg_info = obj
end

