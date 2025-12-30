(* High-level class for DBusObjectProxy *)
class d_bus_object_proxy (obj : D_bus_object_proxy.t) = object (self)

  method get_connection : unit -> GD_bus_connection.d_bus_connection =
    fun () ->
      new  GD_bus_connection.d_bus_connection(D_bus_object_proxy.get_connection obj)

  method g_connection = new GD_bus_connection.d_bus_connection (D_bus_object_proxy.get_g_connection obj)

  method g_object_path = D_bus_object_proxy.get_g_object_path obj

    method as_d_bus_object_proxy = obj
end

