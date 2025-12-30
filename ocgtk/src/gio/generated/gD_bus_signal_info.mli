class d_bus_signal_info : D_bus_signal_info.t ->
  object
    method ref : unit -> D_bus_signal_info.t
    method unref : unit -> unit
    method as_d_bus_signal_info : D_bus_signal_info.t
  end

