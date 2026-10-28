class type socket_service_t = object
  inherit Socket_listener.socket_listener_t

  (** {2:methods Methods} *)

  method is_active : unit -> bool
  (** Check whether the service is active or not. An active service will accept
      new clients that connect, while a non-active service will let connecting
      clients queue up until the service is started. *)

  method start : unit -> unit
  (** Restarts the service, i.e. start accepting connections from the added
      sockets when the mainloop runs. This only needs to be called after the
      service has been stopped from g_socket_service_stop().

      This call is thread-safe, so it may be called from a thread handling an
      incoming client request. *)

  method stop : unit -> unit
  (** Stops the service, i.e. stops accepting connections from the added sockets
      when the mainloop runs.

      This call is thread-safe, so it may be called from a thread handling an
      incoming client request.

      Note that this only stops accepting new connections; it does not close the
      listening sockets, and you can call g_socket_service_start() again later
      to begin listening again. To close the listening sockets, call
      g_socket_listener_close(). (This will happen automatically when the
      [GSocketService] is finalized.)

      This must be called before calling g_socket_listener_close() as the socket
      service will start accepting connections immediately when a new socket is
      added. *)

  (** {2:conversions Conversions} *)

  method as_socket_service : Raw.Socket_service.t
end

(* High-level class for SocketService *)
class socket_service (obj : Raw.Socket_service.t) : socket_service_t =
  object (self)
    inherit Socket_listener.socket_listener (obj :> Raw.Socket_listener.t)
    method is_active : unit -> bool = fun () -> Raw.Socket_service.is_active obj
    method start : unit -> unit = fun () -> Raw.Socket_service.start obj
    method stop : unit -> unit = fun () -> Raw.Socket_service.stop obj
    method as_socket_service = obj
  end

let new_ () : socket_service_t = new socket_service (Raw.Socket_service.new_ ())
