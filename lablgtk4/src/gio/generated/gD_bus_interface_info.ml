(* High-level class for DBusInterfaceInfo *)
class d_bus_interface_info (obj : D_bus_interface_info.t) = object (self)

  method cache_build : unit -> unit =
    fun () ->
      (D_bus_interface_info.cache_build obj)

  method cache_release : unit -> unit =
    fun () ->
      (D_bus_interface_info.cache_release obj)

  method lookup_method : string -> D_bus_method_info.t option =
    fun name ->
      (D_bus_interface_info.lookup_method obj name)

  method lookup_property : string -> D_bus_property_info.t option =
    fun name ->
      (D_bus_interface_info.lookup_property obj name)

  method lookup_signal : string -> D_bus_signal_info.t option =
    fun name ->
      (D_bus_interface_info.lookup_signal obj name)

  method ref : unit -> D_bus_interface_info.t =
    fun () ->
      (D_bus_interface_info.ref obj)

  method unref : unit -> unit =
    fun () ->
      (D_bus_interface_info.unref obj)

    method as_d_bus_interface_info = obj
end

