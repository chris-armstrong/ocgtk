(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Socket from cyclic group Socket_and__socket_connection *)

class type socket_t = GSocket_and__socket_connection.socket_t

class socket : Socket_and__socket_connection.Socket.t -> socket_t
val new_ : Gio_enums.socketfamily -> Gio_enums.sockettype -> Gio_enums.socketprotocol -> (socket_t, GError.t) result
val new_from_fd : int -> (socket_t, GError.t) result

