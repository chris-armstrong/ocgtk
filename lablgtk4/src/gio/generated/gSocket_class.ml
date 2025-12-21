(* High-level class for SocketClass *)
class socket_class (obj : Socket_class.t) = object (self)

    method as_socket_class = obj
end

