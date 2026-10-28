class type d_bus_object_proxy_t = object
  inherit D_bus_interface_and__d_bus_object.d_bus_object_t

  method get_connection : unit -> D_bus_connection.d_bus_connection_t
  (** Gets the connection that [proxy] is for. *)

  method g_connection : D_bus_connection.d_bus_connection_t
  method g_object_path : string
  method as_d_bus_object_proxy : Raw.D_bus_object_proxy.t
end

(* High-level class for DBusObjectProxy *)
class d_bus_object_proxy (obj : Raw.D_bus_object_proxy.t) : d_bus_object_proxy_t
  =
  object (self)
    inherit
      D_bus_interface_and__d_bus_object.d_bus_object
        (Raw.D_bus_object.from_gobject obj)

    method get_connection : unit -> D_bus_connection.d_bus_connection_t =
      fun () ->
        new D_bus_connection.d_bus_connection
          (Raw.D_bus_object_proxy.get_connection obj)

    method g_connection =
      new D_bus_connection.d_bus_connection
        (Raw.D_bus_object_proxy.get_g_connection obj)

    method g_object_path = Raw.D_bus_object_proxy.get_g_object_path obj
    method as_d_bus_object_proxy = obj
  end

let new_ (connection : D_bus_connection.d_bus_connection_t)
    (object_path : string) : d_bus_object_proxy_t =
  let connection = connection#as_d_bus_connection in
  let obj_ = Raw.D_bus_object_proxy.new_ connection object_path in
  new d_bus_object_proxy obj_
