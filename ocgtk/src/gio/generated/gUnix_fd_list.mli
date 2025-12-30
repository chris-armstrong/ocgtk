class unix_fd_list : Unix_fd_list.t ->
  object
    method append : int -> (int, GError.t) result
    method get : int -> (int, GError.t) result
    method get_length : unit -> int
    method as_unix_fd_list : Unix_fd_list.t
  end

