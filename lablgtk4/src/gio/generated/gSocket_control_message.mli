class socket_control_message : Socket_control_message.t ->
  object
    method get_level : unit -> int
    method get_msg_type : unit -> int
    method as_socket_control_message : Socket_control_message.t
  end

