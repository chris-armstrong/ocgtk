(* GENERATED CODE - DO NOT EDIT *)
(* SocketControlMessage: SocketControlMessage *)

type t = [ `socket_control_message | `object_ ] Gobject.obj
(** A [GSocketControlMessage] is a special-purpose utility message that can be
    sent to or received from a [Gio.Socket]. These types of messages are often
    called ‘ancillary data’.

    The message can represent some sort of special instruction to or information
    from the socket or can represent a special kind of transfer to the peer (for
    example, sending a file descriptor over a UNIX socket).

    These messages are sent with [Gio.Socket.send_message] and received with
    [Gio.Socket.receive_message].

    To extend the set of control message that can be sent, subclass this class
    and override the [get_size], [get_level], [get_type] and [serialize]
    methods.

    To extend the set of control messages that can be received, subclass this
    class and implement the [deserialize] method. Also, make sure your class is
    registered with the [GObject.Type] type system before calling
    [Gio.Socket.receive_message] to read such a message. *)

(* Methods *)

external get_size : t -> Gsize.t = "ml_g_socket_control_message_get_size"
(** Returns the space required for the control message, not including headers or
    alignment. *)

external get_msg_type : t -> int = "ml_g_socket_control_message_get_msg_type"
(** Returns the protocol specific type of the control message. For instance, for
    UNIX fd passing this would be SCM_RIGHTS. *)

external get_level : t -> int = "ml_g_socket_control_message_get_level"
(** Returns the “level” (i.e. the originating protocol) of the control message.
    This is often SOL_SOCKET. *)
