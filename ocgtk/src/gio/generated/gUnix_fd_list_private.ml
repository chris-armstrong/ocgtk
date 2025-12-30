(* High-level class for UnixFDListPrivate *)
class unix_fd_list_private (obj : Unix_fd_list_private.t) = object (self)

    method as_unix_fd_list_private = obj
end

