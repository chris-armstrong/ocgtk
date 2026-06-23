class type d_bus_node_info_t = object
  method lookup_interface : string -> D_bus_interface_info.t option
  method ref : unit -> D_bus_node_info.t
  method get_ref_count : int
  method set_ref_count : int -> unit
  method get_path : string
  method set_path : string -> unit
  method as_d_bus_node_info : D_bus_node_info.t
end

class d_bus_node_info : D_bus_node_info.t -> d_bus_node_info_t

val new_for_xml : string -> (d_bus_node_info_t, GError.t) result
val make : int -> string -> d_bus_node_info_t
