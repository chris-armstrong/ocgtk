class d_bus_method_info : D_bus_method_info.t ->
  object
    method ref : unit -> D_bus_method_info.t
    method unref : unit -> unit
    method as_d_bus_method_info : D_bus_method_info.t
  end

