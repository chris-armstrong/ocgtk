(* GENERATED CODE - DO NOT EDIT *)
(* ThreadedSocketService: ThreadedSocketService *)

(** A [GThreadedSocketService] is a simple subclass of [Gio.SocketService] that
    handles incoming connections by creating a worker thread and dispatching the
    connection to it by emitting the [Gio.ThreadedSocketService::run signal] in
    the new thread.

    The signal handler may perform blocking I/O and need not return until the
    connection is closed.

    The service is implemented using a thread pool, so there is a limited amount
    of threads available to serve incoming requests. The service automatically
    stops the [Gio.SocketService] from accepting new connections when all
    threads are busy.

    As with [Gio.SocketService], you may connect to
    [Gio.ThreadedSocketService::run], or subclass and override the default
    handler. *)

type t =
  [ `threaded_socket_service | `socket_service | `socket_listener | `object_ ]
  Gobject.obj

external new_ : int -> t = "ml_g_threaded_socket_service_new"
(** Create a new ThreadedSocketService *)

(* Methods *)
(* Properties *)

external get_max_threads : t -> int
  = "ml_g_threaded_socket_service_get_max_threads"
(** Get property: max-threads *)
