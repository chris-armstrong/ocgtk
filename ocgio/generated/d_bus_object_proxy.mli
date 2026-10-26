class type d_bus_object_proxy_t = object
  inherit D_bus_interface_and__d_bus_object.d_bus_object_t
  method get_connection : unit -> D_bus_connection.d_bus_connection_t
  method g_connection : D_bus_connection.d_bus_connection_t
  method g_object_path : string
  method as_d_bus_object_proxy : Raw.D_bus_object_proxy.t
end

class d_bus_object_proxy : Raw.D_bus_object_proxy.t -> d_bus_object_proxy_t

val new_ : D_bus_connection.d_bus_connection_t -> string -> d_bus_object_proxy_t
