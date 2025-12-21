(* High-level class for UnixFDMessage *)
class unix_fd_message (obj : Unix_fd_message.t) = object (self)

  method append_fd : int -> (bool, GError.t) result =
    fun fd ->
      (Unix_fd_message.append_fd obj fd)

  method get_fd_list : unit -> GUnix_fd_list.unix_fd_list =
    fun () ->
      new  GUnix_fd_list.unix_fd_list(Unix_fd_message.get_fd_list obj)

    method as_unix_fd_message = obj
end

