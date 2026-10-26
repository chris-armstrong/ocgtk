class type d_bus_signal_info_t = object
  method ref : unit -> Raw.D_bus_signal_info.t
  method as_d_bus_signal_info : Raw.D_bus_signal_info.t
end

class d_bus_signal_info : Raw.D_bus_signal_info.t -> d_bus_signal_info_t
