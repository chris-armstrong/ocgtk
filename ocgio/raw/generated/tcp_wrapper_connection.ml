(* GENERATED CODE - DO NOT EDIT *)
(* TcpWrapperConnection: TcpWrapperConnection *)

(** A [GTcpWrapperConnection] can be used to wrap a
    {{!Ocgio.Raw.Io_stream}[Gio.IOStream]} that is based on a
    {{!Ocgio.Raw.Socket}[Gio.Socket]}, but which is not actually a
    {{!Ocgio.Raw.Socket_connection}[Gio.SocketConnection]}. This is used by
    {{!Ocgio.Raw.Socket_client}[Gio.SocketClient]} so that it can always return
    a {{!Ocgio.Raw.Socket_connection}[Gio.SocketConnection]}, even when the
    connection it has actually created is not directly a
    {{!Ocgio.Raw.Socket_connection}[Gio.SocketConnection]}.

    The class built on this module is in {!Ocgio.Tcp_wrapper_connection}. *)

type t =
  [ `tcp_wrapper_connection
  | `tcp_connection
  | `socket_connection
  | `io_stream
  | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gio_tcp_wrapper_connection_get_type"

external new_ : Io_stream.t -> Socket_and__socket_connection.Socket.t -> t
  = "ml_g_tcp_wrapper_connection_new"
(** Wraps [base_io_stream] and [socket] together as a
    {{!Ocgio.Raw.Socket_connection}[GSocketConnection]}. *)

(* Methods *)

external get_base_io_stream : t -> Io_stream.t
  = "ml_g_tcp_wrapper_connection_get_base_io_stream"
(** Gets [conn]'s base {{!Ocgio.Raw.Io_stream}[GIOStream]} *)

(* Properties *)
