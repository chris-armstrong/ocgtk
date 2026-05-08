class type socket_listener_t = object
  method add_any_inet_port :
    [ `object_ ] Gobject.obj option -> (UInt16.t, GError.t) result

  method add_inet_port :
    UInt16.t -> [ `object_ ] Gobject.obj option -> (bool, GError.t) result

  method add_socket :
    GSocket_and__socket_connection.socket_t ->
    [ `object_ ] Gobject.obj option ->
    (bool, GError.t) result

  method close : unit -> unit
  method set_backlog : int -> unit
  method listen_backlog : int
  method set_listen_backlog : int -> unit
  method as_socket_listener : Socket_listener.t
end

(* High-level class for SocketListener *)
class socket_listener (obj : Socket_listener.t) : socket_listener_t =
  object (self)
    method add_any_inet_port :
        [ `object_ ] Gobject.obj option -> (UInt16.t, GError.t) result =
      fun source_object -> Socket_listener.add_any_inet_port obj source_object

    method add_inet_port :
        UInt16.t -> [ `object_ ] Gobject.obj option -> (bool, GError.t) result =
      fun port source_object ->
        Socket_listener.add_inet_port obj port source_object

    method add_socket :
        GSocket_and__socket_connection.socket_t ->
        [ `object_ ] Gobject.obj option ->
        (bool, GError.t) result =
      fun socket source_object ->
        let socket = socket#as_socket in
        Socket_listener.add_socket obj socket source_object

    method close : unit -> unit = fun () -> Socket_listener.close obj

    method set_backlog : int -> unit =
      fun listen_backlog -> Socket_listener.set_backlog obj listen_backlog

    method listen_backlog = Socket_listener.get_listen_backlog obj
    method set_listen_backlog v = Socket_listener.set_listen_backlog obj v
    method as_socket_listener = obj
  end

let new_ () : socket_listener_t = new socket_listener (Socket_listener.new_ ())
