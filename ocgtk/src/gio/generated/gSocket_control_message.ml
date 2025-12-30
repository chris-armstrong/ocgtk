(* High-level class for SocketControlMessage *)
class socket_control_message (obj : Socket_control_message.t) = object (self)

  method get_level : unit -> int =
    fun () ->
      (Socket_control_message.get_level obj)

  method get_msg_type : unit -> int =
    fun () ->
      (Socket_control_message.get_msg_type obj)

    method as_socket_control_message = obj
end

