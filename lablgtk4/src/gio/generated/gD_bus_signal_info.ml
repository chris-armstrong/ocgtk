(* High-level class for DBusSignalInfo *)
class d_bus_signal_info (obj : D_bus_signal_info.t) = object (self)

  method ref : unit -> D_bus_signal_info.t =
    fun () ->
      (D_bus_signal_info.ref obj)

  method unref : unit -> unit =
    fun () ->
      (D_bus_signal_info.unref obj)

    method as_d_bus_signal_info = obj
end

