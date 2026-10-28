(** A [GThreadedSocketService] is a simple subclass of [Gio.SocketService] that
    handles incoming connections by creating a worker thread and dispatching the
    connection to it by emitting the \[signal@Gio.ThreadedSocketService::run
    signal\] in the new thread.

    The signal handler may perform blocking I/O and need not return until the
    connection is closed.

    The service is implemented using a thread pool, so there is a limited amount
    of threads available to serve incoming requests. The service automatically
    stops the [Gio.SocketService] from accepting new connections when all
    threads are busy.

    As with [Gio.SocketService], you may connect to
    [Gio.ThreadedSocketService::run], or subclass and override the default
    handler.

    Its methods, signals and properties are on
    {!class-type-threaded_socket_service_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Threaded_socket_service}. *)

(** {b The methods, signals and properties of a [ThreadedSocketService].}

    A [GThreadedSocketService] is a simple subclass of [Gio.SocketService] that
    handles incoming connections by creating a worker thread and dispatching the
    connection to it by emitting the \[signal@Gio.ThreadedSocketService::run
    signal\] in the new thread.

    The signal handler may perform blocking I/O and need not return until the
    connection is closed.

    The service is implemented using a thread pool, so there is a limited amount
    of threads available to serve incoming requests. The service automatically
    stops the [Gio.SocketService] from accepting new connections when all
    threads are busy.

    As with [Gio.SocketService], you may connect to
    [Gio.ThreadedSocketService::run], or subclass and override the default
    handler. *)
class type threaded_socket_service_t = object
  inherit Socket_service.socket_service_t

  method max_threads : int
  (** The maximum number of threads handling clients for this service. *)

  method as_threaded_socket_service : Raw.Threaded_socket_service.t
end

class threaded_socket_service :
  Raw.Threaded_socket_service.t ->
  threaded_socket_service_t
(** Wraps a raw handle of {!Ocgio.Raw.Threaded_socket_service.t}. *)

(** {2:constructors Constructors} *)

val new_ : int -> threaded_socket_service_t
[@@ocaml.doc
  "Creates a new [GThreadedSocketService] with no listeners. Listeners\n\
   must be added with one of the [GSocketListener] \"add\" methods."]
