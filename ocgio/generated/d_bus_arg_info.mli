class type d_bus_arg_info_t = object
  method ref : unit -> D_bus_arg_info.t
  method as_d_bus_arg_info : D_bus_arg_info.t
end

class d_bus_arg_info : D_bus_arg_info.t -> d_bus_arg_info_t
