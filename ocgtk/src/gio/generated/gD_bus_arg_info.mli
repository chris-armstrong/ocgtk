class d_bus_arg_info : D_bus_arg_info.t ->
  object
    method ref : unit -> D_bus_arg_info.t
    method unref : unit -> unit
    method as_d_bus_arg_info : D_bus_arg_info.t
  end

