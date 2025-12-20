(* High-level class for SocketPrivate *)
class socket_private (obj : Socket_private.t) = object (self)

    method as_socket_private = obj
end

