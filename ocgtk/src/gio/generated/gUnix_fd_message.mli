class type unix_fd_message_t = object
    inherit GSocket_control_message.socket_control_message_t
    method append_fd : int -> (bool, GError.t) result
    method get_fd_list : unit -> GUnix_fd_list.unix_fd_list_t
    method as_unix_fd_message : Unix_fd_message.t
end

class unix_fd_message : Unix_fd_message.t -> unix_fd_message_t

val new_ : unit -> unix_fd_message_t
val new_with_fd_list : GUnix_fd_list.unix_fd_list_t -> unix_fd_message_t
