(* GENERATED CODE - DO NOT EDIT *)
(* SocketService: SocketService *)

type t = [`socket_service | `socket_listener | `object_] Gobject.obj

(** Create a new SocketService *)
external new_ : unit -> t = "ml_g_socket_service_new"

(* Methods *)
(** Stops the service, i.e. stops accepting connections
from the added sockets when the mainloop runs.

This call is thread-safe, so it may be called from a thread
handling an incoming client request.

Note that this only stops accepting new connections; it does not
close the listening sockets, and you can call
g_socket_service_start() again later to begin listening again. To
close the listening sockets, call g_socket_listener_close(). (This
will happen automatically when the #GSocketService is finalized.)

This must be called before calling g_socket_listener_close() as
the socket service will start accepting connections immediately
when a new socket is added. *)
external stop : t -> unit = "ml_g_socket_service_stop"

(** Restarts the service, i.e. start accepting connections
from the added sockets when the mainloop runs. This only needs
to be called after the service has been stopped from
g_socket_service_stop().

This call is thread-safe, so it may be called from a thread
handling an incoming client request. *)
external start : t -> unit = "ml_g_socket_service_start"

(** Check whether the service is active or not. An active
service will accept new clients that connect, while
a non-active service will let connecting clients queue
up until the service is started. *)
external is_active : t -> bool = "ml_g_socket_service_is_active"

(* Properties *)

(** Get property: active *)
external get_active : t -> bool = "ml_gtk_socket_service_get_active"

(** Set property: active *)
external set_active : t -> bool -> unit = "ml_gtk_socket_service_set_active"

