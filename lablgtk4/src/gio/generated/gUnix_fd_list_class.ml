(* High-level class for UnixFDListClass *)
class unix_fd_list_class (obj : Unix_fd_list_class.t) = object (self)

    method as_unix_fd_list_class = obj
end

