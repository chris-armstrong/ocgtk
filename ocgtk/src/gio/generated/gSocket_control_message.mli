class type socket_control_message_t = object
    method get_level : unit -> int
    method get_msg_type : unit -> int
    method get_size : unit -> int
    method as_socket_control_message : Socket_control_message.t
end

class socket_control_message : Socket_control_message.t -> socket_control_message_t

