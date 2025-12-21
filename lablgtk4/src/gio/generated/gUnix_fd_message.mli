class unix_fd_message : Unix_fd_message.t ->
  object
    method append_fd : int -> (bool, GError.t) result
    method get_fd_list : unit -> GUnix_fd_list.unix_fd_list
    method as_unix_fd_message : Unix_fd_message.t
  end

