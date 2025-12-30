(* High-level class for UnixConnectionPrivate *)
class unix_connection_private (obj : Unix_connection_private.t) = object (self)

    method as_unix_connection_private = obj
end

