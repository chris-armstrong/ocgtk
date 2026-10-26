(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Socket from cyclic group Socket_and__socket_connection *)

class type socket_t = GSocket_and__socket_connection.socket_t

class socket = GSocket_and__socket_connection.socket

let new_ (family : Gio_enums.socketfamily) (type_ : Gio_enums.sockettype)
    (protocol : Gio_enums.socketprotocol) : (socket_t, GError.t) result =
  let obj_ = Socket_and__socket_connection.Socket.new_ family type_ protocol in
  Result.map (fun obj_ -> new socket obj_) obj_

let new_from_fd (fd : int) : (socket_t, GError.t) result =
  let obj_ = Socket_and__socket_connection.Socket.new_from_fd fd in
  Result.map (fun obj_ -> new socket obj_) obj_
