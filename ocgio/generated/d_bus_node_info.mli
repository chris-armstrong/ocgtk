class type d_bus_node_info_t = object
  method lookup_interface : string -> Raw.D_bus_interface_info.t option
  method ref : unit -> Raw.D_bus_node_info.t
  method as_d_bus_node_info : Raw.D_bus_node_info.t
end

class d_bus_node_info : Raw.D_bus_node_info.t -> d_bus_node_info_t

val new_for_xml : string -> (d_bus_node_info_t, GError.t) result
