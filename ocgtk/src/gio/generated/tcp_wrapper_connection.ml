(* GENERATED CODE - DO NOT EDIT *)
(* TcpWrapperConnection: TcpWrapperConnection *)

type t =
  [ `tcp_wrapper_connection
  | `tcp_connection
  | `socket_connection
  | `io_stream
  | `object_ ]
  Gobject.obj
(** A [GTcpWrapperConnection] can be used to wrap a [Gio.IOStream] that is based
    on a [Gio.Socket], but which is not actually a [Gio.SocketConnection]. This
    is used by [Gio.SocketClient] so that it can always return a
    [Gio.SocketConnection], even when the connection it has actually created is
    not directly a [Gio.SocketConnection]. *)

external new_ : Io_stream.t -> Socket_and__socket_connection.Socket.t -> t
  = "ml_g_tcp_wrapper_connection_new"
(** Create a new TcpWrapperConnection *)

(* Methods *)

external get_base_io_stream : t -> Io_stream.t
  = "ml_g_tcp_wrapper_connection_get_base_io_stream"
(** Gets [conn]'s base [GIOStream] *)

(* Properties *)
