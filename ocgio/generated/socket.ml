(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Socket from cyclic group Socket_and__socket_connection *)

class type socket_t = Socket_and__socket_connection.socket_t

class socket = Socket_and__socket_connection.socket

let new_ (family : Enums.socketfamily) (type_ : Enums.sockettype)
    (protocol : Enums.socketprotocol) : (socket_t, GError.t) result =
  let obj_ = Raw.Socket.new_ family type_ protocol in
  Result.map (fun obj_ -> new socket obj_) obj_

let new_from_fd (fd : int) : (socket_t, GError.t) result =
  let obj_ = Raw.Socket.new_from_fd fd in
  Result.map (fun obj_ -> new socket obj_) obj_
