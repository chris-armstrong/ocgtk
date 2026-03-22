class type unix_fd_message_t = object
    inherit GSocket_control_message.socket_control_message_t
    method append_fd : int -> (bool, GError.t) result
    method get_fd_list : unit -> GUnix_fd_list.unix_fd_list_t
    method as_unix_fd_message : Unix_fd_message.t
end

(* High-level class for UnixFDMessage *)
class unix_fd_message (obj : Unix_fd_message.t) : unix_fd_message_t = object (self)
  inherit GSocket_control_message.socket_control_message (Obj.magic obj : Socket_control_message.t)

  method append_fd : int -> (bool, GError.t) result =
    fun fd ->
      (Unix_fd_message.append_fd obj fd)

  method get_fd_list : unit -> GUnix_fd_list.unix_fd_list_t =
    fun () ->
      new  GUnix_fd_list.unix_fd_list(Unix_fd_message.get_fd_list obj)

    method as_unix_fd_message = obj
end

