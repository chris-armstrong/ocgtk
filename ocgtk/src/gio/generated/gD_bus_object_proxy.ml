class type d_bus_object_proxy_t = object
    method get_connection : unit -> GD_bus_connection.d_bus_connection_t
    method g_connection : GD_bus_connection.d_bus_connection_t
    method g_object_path : string
    method as_d_bus_object_proxy : D_bus_object_proxy.t
end

(* High-level class for DBusObjectProxy *)
class d_bus_object_proxy (obj : D_bus_object_proxy.t) : d_bus_object_proxy_t = object (self)

  method get_connection : unit -> GD_bus_connection.d_bus_connection_t =
    fun () ->
      new  GD_bus_connection.d_bus_connection(D_bus_object_proxy.get_connection obj)

  method g_connection = new GD_bus_connection.d_bus_connection (D_bus_object_proxy.get_g_connection obj)

  method g_object_path = D_bus_object_proxy.get_g_object_path obj

    method as_d_bus_object_proxy = obj
end

let new_ (connection : GD_bus_connection.d_bus_connection_t) (object_path : string) : d_bus_object_proxy_t =
  let connection = connection#as_d_bus_connection in
  let obj_ = D_bus_object_proxy.new_ connection object_path in
  new d_bus_object_proxy obj_

