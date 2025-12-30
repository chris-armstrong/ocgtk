class d_bus_node_info : D_bus_node_info.t ->
  object
    method lookup_interface : string -> D_bus_interface_info.t option
    method ref : unit -> D_bus_node_info.t
    method unref : unit -> unit
    method as_d_bus_node_info : D_bus_node_info.t
  end

