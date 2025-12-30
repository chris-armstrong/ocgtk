(* GENERATED CODE - DO NOT EDIT *)
(* TcpWrapperConnection: TcpWrapperConnection *)

type t = [`tcp_wrapper_connection | `tcp_connection | `socket_connection | `io_stream | `object_] Gobject.obj

(** Create a new TcpWrapperConnection *)
external new_ : Io_stream.t -> Socket_and__socket_connection.Socket.t -> t = "ml_g_tcp_wrapper_connection_new"

(* Methods *)
(** Gets @conn's base #GIOStream *)
external get_base_io_stream : t -> Io_stream.t = "ml_g_tcp_wrapper_connection_get_base_io_stream"

(* Properties *)

