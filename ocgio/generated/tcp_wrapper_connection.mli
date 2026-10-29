(** A [GTcpWrapperConnection] can be used to wrap a [Gio.IOStream] that is based
    on a [Gio.Socket], but which is not actually a [Gio.SocketConnection]. This
    is used by [Gio.SocketClient] so that it can always return a
    [Gio.SocketConnection], even when the connection it has actually created is
    not directly a [Gio.SocketConnection].

    Its methods, signals and properties are on
    {!class-type-tcp_wrapper_connection_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Tcp_wrapper_connection}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TcpWrapperConnection].}

    Inherits from:
    {{!Ocgio.Tcp_connection.class-type-tcp_connection_t}Ocgio.Tcp_connection}

    A [GTcpWrapperConnection] can be used to wrap a [Gio.IOStream] that is based
    on a [Gio.Socket], but which is not actually a [Gio.SocketConnection]. This
    is used by [Gio.SocketClient] so that it can always return a
    [Gio.SocketConnection], even when the connection it has actually created is
    not directly a [Gio.SocketConnection]. *)
class type tcp_wrapper_connection_t = object
  inherit Tcp_connection.tcp_connection_t

  (** {2:methods Methods} *)

  method get_base_io_stream : unit -> Io_stream.io_stream_t
  (** Gets [conn]'s base [GIOStream] *)

  (** {2:conversions Conversions} *)

  method as_tcp_wrapper_connection : Raw.Tcp_wrapper_connection.t
end

class tcp_wrapper_connection :
  Raw.Tcp_wrapper_connection.t ->
  tcp_wrapper_connection_t
(** Wraps a raw handle of {!Ocgio.Raw.Tcp_wrapper_connection.t}. *)

(** {1:constructors Constructors} *)

val new_ : Io_stream.io_stream_t -> Socket.socket_t -> tcp_wrapper_connection_t
(** Wraps [base_io_stream] and [socket] together as a [GSocketConnection]. *)
