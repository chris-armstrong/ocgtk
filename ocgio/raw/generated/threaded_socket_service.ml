(* GENERATED CODE - DO NOT EDIT *)
(* ThreadedSocketService: ThreadedSocketService *)

(** A [GThreadedSocketService] is a simple subclass of
    {{!Ocgio.Raw.Socket_service}[Gio.SocketService]} that handles incoming
    connections by creating a worker thread and dispatching the connection to it
    by emitting the \[signal@Gio.ThreadedSocketService::run signal\] in the new
    thread.

    The signal handler may perform blocking I/O and need not return until the
    connection is closed.

    The service is implemented using a thread pool, so there is a limited amount
    of threads available to serve incoming requests. The service automatically
    stops the {{!Ocgio.Raw.Socket_service}[Gio.SocketService]} from accepting
    new connections when all threads are busy.

    As with {{!Ocgio.Raw.Socket_service}[Gio.SocketService]}, you may connect to
    [Gio.ThreadedSocketService::run], or subclass and override the default
    handler.

    The class built on this module is in {!Ocgio.Threaded_socket_service}. *)

type t =
  [ `threaded_socket_service | `socket_service | `socket_listener | `object_ ]
  Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gio_threaded_socket_service_get_type"

external new_ : int -> t = "ml_g_threaded_socket_service_new"
[@@ocaml.doc
  "Creates a new \
   {{!Ocgio.Raw.Threaded_socket_service}[GThreadedSocketService]} with no \
   listeners. Listeners\n\
   must be added with one of the \
   {{!Ocgio.Raw.Socket_listener}[GSocketListener]} \"add\" methods."]

(* Methods *)
(* Properties *)

external get_max_threads : t -> int
  = "ml_g_threaded_socket_service_get_max_threads"
(** The maximum number of threads handling clients for this service. *)
