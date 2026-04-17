class type socket_control_message_t = object
    method get_level : unit -> int
    method get_msg_type : unit -> int
    method get_size : unit -> Gsize.t
    method as_socket_control_message : Socket_control_message.t
end

(* High-level class for SocketControlMessage *)
class socket_control_message (obj : Socket_control_message.t) : socket_control_message_t = object (self)

  method get_level : unit -> int =
    fun () ->
      (Socket_control_message.get_level obj)

  method get_msg_type : unit -> int =
    fun () ->
      (Socket_control_message.get_msg_type obj)

  method get_size : unit -> Gsize.t =
    fun () ->
      (Socket_control_message.get_size obj)

    method as_socket_control_message = obj
end

