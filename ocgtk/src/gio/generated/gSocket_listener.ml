(* Signal class defined in gsocket_listener_signals.ml *)

(* High-level class for SocketListener *)
class socket_listener (obj : Socket_listener.t) = object (self)
  inherit Gsocket_listener_signals.socket_listener_signals obj

  method close : unit -> unit =
    fun () ->
      (Socket_listener.close obj)

  method set_backlog : int -> unit =
    fun listen_backlog ->
      (Socket_listener.set_backlog obj listen_backlog)

  method listen_backlog = Socket_listener.get_listen_backlog obj
  method set_listen_backlog v =  Socket_listener.set_listen_backlog obj v

    method as_socket_listener = obj
end

