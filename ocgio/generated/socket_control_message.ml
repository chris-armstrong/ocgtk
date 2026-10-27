class type socket_control_message_t = object
  method get_level : unit -> int
  [@@ocaml.doc
    "Returns the \"level\" (i.e. the originating protocol) of the control \
     message.\n\
     This is often SOL_SOCKET."]

  method get_msg_type : unit -> int
  (** Returns the protocol specific type of the control message. For instance,
      for UNIX fd passing this would be SCM_RIGHTS. *)

  method get_size : unit -> Gsize.t
  (** Returns the space required for the control message, not including headers
      or alignment. *)

  method as_socket_control_message : Raw.Socket_control_message.t
end

(* High-level class for SocketControlMessage *)
class socket_control_message (obj : Raw.Socket_control_message.t) :
  socket_control_message_t =
  object (self)
    method get_level : unit -> int =
      fun () -> Raw.Socket_control_message.get_level obj

    method get_msg_type : unit -> int =
      fun () -> Raw.Socket_control_message.get_msg_type obj

    method get_size : unit -> Gsize.t =
      fun () -> Raw.Socket_control_message.get_size obj

    method as_socket_control_message = obj
  end
