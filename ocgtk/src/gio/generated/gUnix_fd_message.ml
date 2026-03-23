class type unix_fd_message_t = object
    inherit GSocket_control_message.socket_control_message_t
    method append_fd : int -> (bool, GError.t) result
    method get_fd_list : unit -> GUnix_fd_list.unix_fd_list_t
    method as_unix_fd_message : Unix_fd_message.t
end

(* High-level class for UnixFDMessage *)
class unix_fd_message (obj : Unix_fd_message.t) : unix_fd_message_t = object (self)
  inherit GSocket_control_message.socket_control_message (obj :> Socket_control_message.t)

  method append_fd : int -> (bool, GError.t) result =
    fun fd ->
      (Unix_fd_message.append_fd obj fd)

  method get_fd_list : unit -> GUnix_fd_list.unix_fd_list_t =
    fun () ->
      new  GUnix_fd_list.unix_fd_list(Unix_fd_message.get_fd_list obj)

    method as_unix_fd_message = obj
end

let new_ () : unix_fd_message_t =
  new unix_fd_message (Unix_fd_message.new_ ())

let new_with_fd_list (fd_list : GUnix_fd_list.unix_fd_list_t) : unix_fd_message_t =
  let fd_list = fd_list#as_unix_fd_list in
  new unix_fd_message (Unix_fd_message.new_with_fd_list fd_list)

