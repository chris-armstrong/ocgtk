(* GENERATED CODE - DO NOT EDIT *)
(* SocketControlMessage: SocketControlMessage *)

type t = [ `socket_control_message | `object_ ] Gobject.obj

(* Methods *)

external get_size : t -> Gsize.t = "ml_g_socket_control_message_get_size"
(** Returns the space required for the control message, not including headers or
    alignment. *)

external get_msg_type : t -> int = "ml_g_socket_control_message_get_msg_type"
(** Returns the protocol specific type of the control message. For instance, for
    UNIX fd passing this would be SCM_RIGHTS. *)

external get_level : t -> int = "ml_g_socket_control_message_get_level"
(** Returns the "level" (i.e. the originating protocol) of the control message.
    This is often SOL_SOCKET. *)
