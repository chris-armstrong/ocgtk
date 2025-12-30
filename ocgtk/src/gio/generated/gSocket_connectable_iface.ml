(* High-level class for SocketConnectableIface *)
class socket_connectable_iface (obj : Socket_connectable_iface.t) = object (self)

    method as_socket_connectable_iface = obj
end

