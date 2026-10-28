(** A [GSocketControlMessage] is a special-purpose utility message that can be
    sent to or received from a [Gio.Socket]. These types of messages are often
    called ‘ancillary data’.

    Its methods, signals and properties are on
    {!class-type-socket_control_message_t}. Its full description is under
    {!section-description}. The functions it is built on are in
    {!Ocgio.Raw.Socket_control_message}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [SocketControlMessage].}

    A [GSocketControlMessage] is a special-purpose utility message that can be
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
class type socket_control_message_t = object
  (** {2:methods Methods} *)

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

  (** {2:conversions Conversions} *)

  method as_socket_control_message : Raw.Socket_control_message.t
end

class socket_control_message :
  Raw.Socket_control_message.t ->
  socket_control_message_t
(** Wraps a raw handle of {!Ocgio.Raw.Socket_control_message.t}. *)

(** {1:description Description}

    A [GSocketControlMessage] is a special-purpose utility message that can be
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
