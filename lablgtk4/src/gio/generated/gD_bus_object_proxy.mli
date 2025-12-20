class d_bus_object_proxy : D_bus_object_proxy.t ->
  object
    method get_connection : unit -> GD_bus_connection.d_bus_connection
    method g_connection : GD_bus_connection.d_bus_connection
    method g_object_path : string
    method as_d_bus_object_proxy : D_bus_object_proxy.t
  end

