class type d_bus_method_info_t = object
  method ref : unit -> D_bus_method_info.t
  method unref : unit -> unit
  method as_d_bus_method_info : D_bus_method_info.t
end

class d_bus_method_info : D_bus_method_info.t -> d_bus_method_info_t
