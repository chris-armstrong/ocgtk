(* High-level class for DBusNodeInfo *)
class d_bus_node_info (obj : D_bus_node_info.t) = object (self)

  method lookup_interface : string -> D_bus_interface_info.t option =
    fun name ->
      (D_bus_node_info.lookup_interface obj name)

  method ref : unit -> D_bus_node_info.t =
    fun () ->
      (D_bus_node_info.ref obj)

  method unref : unit -> unit =
    fun () ->
      (D_bus_node_info.unref obj)

    method as_d_bus_node_info = obj
end

