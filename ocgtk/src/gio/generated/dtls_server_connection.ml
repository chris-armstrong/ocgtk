(* GENERATED CODE - DO NOT EDIT *)
(* DtlsServerConnection: DtlsServerConnection *)

type t = [`dtls_server_connection] Gobject.obj

(* Methods *)
(* Properties *)

(** Get property: authentication-mode *)
external get_authentication_mode : t -> Gio_enums.tlsauthenticationmode = "ml_g_dtls_server_connection_get_authentication_mode"

(** Set property: authentication-mode *)
external set_authentication_mode : t -> Gio_enums.tlsauthenticationmode -> unit = "ml_g_dtls_server_connection_set_authentication_mode"

