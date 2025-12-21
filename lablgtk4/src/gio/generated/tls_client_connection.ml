(* GENERATED CODE - DO NOT EDIT *)
(* TlsClientConnection: TlsClientConnection *)

type t = [`tls_client_connection] Gobject.obj

(* Methods *)
(** Since GLib 2.42.1, SSL 3.0 is no longer supported.

From GLib 2.42.1 through GLib 2.62, this function could be used to
force use of TLS 1.0, the lowest-supported TLS protocol version at
the time. In the past, this was needed to connect to broken TLS
servers that exhibited protocol version intolerance. Such servers
are no longer common, and using TLS 1.0 is no longer considered
acceptable.

Since GLib 2.64, this function does nothing. *)
external set_use_ssl3 : t -> bool -> unit = "ml_g_tls_client_connection_set_use_ssl3"

(** SSL 3.0 is no longer supported. See
g_tls_client_connection_set_use_ssl3() for details. *)
external get_use_ssl3 : t -> bool = "ml_g_tls_client_connection_get_use_ssl3"

(* Properties *)

