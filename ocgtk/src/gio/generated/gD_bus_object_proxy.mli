class type d_bus_object_proxy_t = object
    method get_connection : unit -> GD_bus_connection.d_bus_connection_t
    method g_connection : GD_bus_connection.d_bus_connection_t
    method g_object_path : string
    method as_d_bus_object_proxy : D_bus_object_proxy.t
end

class d_bus_object_proxy : D_bus_object_proxy.t -> d_bus_object_proxy_t

