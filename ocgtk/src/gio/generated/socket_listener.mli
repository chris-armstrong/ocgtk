(* GENERATED CODE - DO NOT EDIT *)
(* SocketListener: SocketListener *)

type t = [`socket_listener | `object_] Gobject.obj

(** Create a new SocketListener *)
external new_ : unit -> t = "ml_g_socket_listener_new"

(* Methods *)
(** Sets the listen backlog on the sockets in the listener. This must be called
before adding any sockets, addresses or ports to the #GSocketListener (for
example, by calling g_socket_listener_add_inet_port()) to be effective.

See g_socket_set_listen_backlog() for details *)
external set_backlog : t -> int -> unit = "ml_g_socket_listener_set_backlog"

(** Closes all the sockets in the listener. *)
external close : t -> unit = "ml_g_socket_listener_close"

(** Adds @socket to the set of sockets that we try to accept
new clients from. The socket must be bound to a local
address and listened to.

@source_object will be passed out in the various calls
to accept to identify this particular source, which is
useful if you're listening on multiple addresses and do
different things depending on what address is connected to.

The @socket will not be automatically closed when the @listener is finalized
unless the listener held the final reference to the socket. Before GLib 2.42,
the @socket was automatically closed on finalization of the @listener, even
if references to it were held elsewhere. *)
external add_socket : t -> Socket_and__socket_connection.Socket.t -> [`object_] Gobject.obj option -> (bool, GError.t) result = "ml_g_socket_listener_add_socket"

(* Properties *)

(** Get property: listen-backlog *)
external get_listen_backlog : t -> int = "ml_g_socket_listener_get_listen_backlog"

(** Set property: listen-backlog *)
external set_listen_backlog : t -> int -> unit = "ml_g_socket_listener_set_listen_backlog"

