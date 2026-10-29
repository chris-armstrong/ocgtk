(* GENERATED CODE - DO NOT EDIT *)
(* DtlsServerConnection: DtlsServerConnection *)

(** [GDtlsServerConnection] is the server-side subclass of
    {{!Ocgio.Raw.Dtls_connection}[Gio.DtlsConnection]}, representing a
    server-side DTLS connection.

    The class built on this module is in {!Ocgio.Dtls_server_connection}. *)

type t = [ `dtls_server_connection ] Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gio_dtls_server_connection_get_type"

external from_gobject : 'a Gobject.obj -> t
  = "ml_gio_dtls_server_connection_from_gobject"

(* Methods *)
(* Properties *)

external get_authentication_mode : t -> Ocgio_enums.tlsauthenticationmode
  = "ml_g_dtls_server_connection_get_authentication_mode"
(** The [GTlsAuthenticationMode] for the server. This can be changed before
    calling g_dtls_connection_handshake() if you want to rehandshake with a
    different mode from the initial handshake. *)

external set_authentication_mode :
  t -> Ocgio_enums.tlsauthenticationmode -> unit
  = "ml_g_dtls_server_connection_set_authentication_mode"
(** The [GTlsAuthenticationMode] for the server. This can be changed before
    calling g_dtls_connection_handshake() if you want to rehandshake with a
    different mode from the initial handshake. *)
