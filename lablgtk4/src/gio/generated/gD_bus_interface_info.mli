class d_bus_interface_info : D_bus_interface_info.t ->
  object
    method cache_build : unit -> unit
    method cache_release : unit -> unit
    method lookup_method : string -> D_bus_method_info.t option
    method lookup_property : string -> D_bus_property_info.t option
    method lookup_signal : string -> D_bus_signal_info.t option
    method ref : unit -> D_bus_interface_info.t
    method unref : unit -> unit
    method as_d_bus_interface_info : D_bus_interface_info.t
  end

