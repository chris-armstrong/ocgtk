class type d_bus_property_info_t = object
  method ref : unit -> Raw.D_bus_property_info.t
  method as_d_bus_property_info : Raw.D_bus_property_info.t
end

class d_bus_property_info : Raw.D_bus_property_info.t -> d_bus_property_info_t
