class type d_bus_interface_info_t = object
  method cache_build : unit -> unit
  method cache_release : unit -> unit
  method lookup_method : string -> Raw.D_bus_method_info.t option
  method lookup_property : string -> Raw.D_bus_property_info.t option
  method lookup_signal : string -> Raw.D_bus_signal_info.t option
  method ref : unit -> Raw.D_bus_interface_info.t
  method as_d_bus_interface_info : Raw.D_bus_interface_info.t
end

class d_bus_interface_info :
  Raw.D_bus_interface_info.t ->
  d_bus_interface_info_t
