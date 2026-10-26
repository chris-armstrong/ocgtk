(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Socket from cyclic group Socket_and__socket_connection *)

class type socket_t = Socket_and__socket_connection.socket_t

class socket : Raw.Socket.t -> socket_t

val new_ :
  Enums.socketfamily ->
  Enums.sockettype ->
  Enums.socketprotocol ->
  (socket_t, GError.t) result

val new_from_fd : int -> (socket_t, GError.t) result
