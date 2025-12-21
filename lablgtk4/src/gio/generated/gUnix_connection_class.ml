(* High-level class for UnixConnectionClass *)
class unix_connection_class (obj : Unix_connection_class.t) = object (self)

    method as_unix_connection_class = obj
end

