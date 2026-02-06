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

(* Properties *)

(** Get property: listen-backlog *)
external get_listen_backlog : t -> int = "ml_g_socket_listener_get_listen_backlog"

(** Set property: listen-backlog *)
external set_listen_backlog : t -> int -> unit = "ml_g_socket_listener_set_listen_backlog"

