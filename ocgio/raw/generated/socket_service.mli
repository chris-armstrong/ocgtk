(* GENERATED CODE - DO NOT EDIT *)
(* SocketService: SocketService *)

(** A [GSocketService] is an object that represents a service that is provided
    to the network or over local sockets. When a new connection is made to the
    service the [Gio.SocketService::incoming] signal is emitted.

    A [GSocketService] is a subclass of
    {{!Ocgio.Raw.Socket_listener}[Gio.SocketListener]} and you need to add the
    addresses you want to accept connections on with the
    {{!Ocgio.Raw.Socket_listener}[Gio.SocketListener]} APIs.

    There are two options for implementing a network service based on
    [GSocketService]. The first is to create the service using
    {{!Ocgio.Raw.Socket_service.val-new_}[Gio.SocketService.new]} and to connect
    to the [Gio.SocketService::incoming] signal. The second is to subclass
    [GSocketService] and override the default signal handler implementation.

    In either case, the handler must immediately return, or else it will block
    additional incoming connections from being serviced. If you are interested
    in writing connection handlers that contain blocking code then see
    {{!Ocgio.Raw.Threaded_socket_service}[Gio.ThreadedSocketService]}.

    The socket service runs on the main loop of the thread-default context (see
    [GLib.MainContext.push_thread_default]) of the thread it is created in, and
    is not threadsafe in general. However, the calls to start and stop the
    service are thread-safe so these can be used from threads that handle
    incoming clients.

    The class built on this module is in {!Ocgio.Socket_service}. *)

type t = [ `socket_service | `socket_listener | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_socket_service_get_type"

external new_ : unit -> t = "ml_g_socket_service_new"
(** Creates a new {{!Ocgio.Raw.Socket_service}[GSocketService]} with no sockets
    to listen for. New listeners can be added with e.g.
    [g_socket_listener_add_address ()] or
    {{!Ocgio.Raw.Socket_listener.val-add_inet_port}[g_socket_listener_add_inet_port
                                                    ()]}.

    New services are created active, there is no need to call
    {{!Ocgio.Raw.Socket_service.val-start}[g_socket_service_start ()]}, unless
    {{!Ocgio.Raw.Socket_service.val-stop}[g_socket_service_stop ()]} has been
    called before. *)

(* Methods *)

external stop : t -> unit = "ml_g_socket_service_stop"
(** Stops the service, i.e. stops accepting connections from the added sockets
    when the mainloop runs.

    This call is thread-safe, so it may be called from a thread handling an
    incoming client request.

    Note that this only stops accepting new connections; it does not close the
    listening sockets, and you can call
    {{!Ocgio.Raw.Socket_service.val-start}[g_socket_service_start ()]} again
    later to begin listening again. To close the listening sockets, call
    {{!Ocgio.Raw.Socket_listener.val-close}[g_socket_listener_close ()]}. (This
    will happen automatically when the
    {{!Ocgio.Raw.Socket_service}[GSocketService]} is finalized.)

    This must be called before calling
    {{!Ocgio.Raw.Socket_listener.val-close}[g_socket_listener_close ()]} as the
    socket service will start accepting connections immediately when a new
    socket is added. *)

external start : t -> unit = "ml_g_socket_service_start"
(** Restarts the service, i.e. start accepting connections from the added
    sockets when the mainloop runs. This only needs to be called after the
    service has been stopped from
    {{!Ocgio.Raw.Socket_service.val-stop}[g_socket_service_stop ()]}.

    This call is thread-safe, so it may be called from a thread handling an
    incoming client request. *)

external is_active : t -> bool = "ml_g_socket_service_is_active"
(** Check whether the service is active or not. An active service will accept
    new clients that connect, while a non-active service will let connecting
    clients queue up until the service is started. *)

(* Properties *)
