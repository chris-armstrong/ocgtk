(* GENERATED CODE - DO NOT EDIT *)
(* TlsBackend: TlsBackend *)

(** TLS (Transport Layer Security, aka SSL) and DTLS backend. This is an
    internal type used to coordinate the different classes implemented by a TLS
    backend.

    The class built on this module is in {!Ocgio.Tls_backend}. *)

type t = [ `tls_backend ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_tls_backend_get_type"
external from_gobject : 'a Gobject.obj -> t = "ml_gio_tls_backend_from_gobject"

(* Methods *)
external supports_tls : t -> bool = "ml_g_tls_backend_supports_tls"
[@@ocaml.doc
  "Checks if TLS is supported; if this returns [false] for the default\n\
   {{!Ocgio.Raw.Tls_backend}[GTlsBackend]}, it means no \"real\" TLS backend \
   is available."]

external supports_dtls : t -> bool = "ml_g_tls_backend_supports_dtls"
(** Checks if DTLS is supported. DTLS support may not be available even if TLS
    support is available, and vice-versa. *)

external set_default_database :
  t ->
  Tls_connection_and__tls_database_and__tls_interaction.Tls_database.t option ->
  unit = "ml_g_tls_backend_set_default_database"
(** Set the default {{!Ocgio.Raw.Tls_database}[GTlsDatabase]} used to verify TLS
    connections

    Any subsequent call to
    {{!Ocgio.Raw.Tls_backend.val-get_default_database}[g_tls_backend_get_default_database
                                                       ()]} will return the
    database set in this call. Existing databases and connections are not
    modified.

    Setting a [None] default database will reset to using the system default
    database as if
    {{!Ocgio.Raw.Tls_backend.val-set_default_database}[g_tls_backend_set_default_database
                                                       ()]} had never been
    called. *)

external get_server_connection_type : t -> Gobject.Type.t
  = "ml_g_tls_backend_get_server_connection_type"
(** Gets the [GType] of [backend]'s
    {{!Ocgio.Raw.Tls_server_connection}[GTlsServerConnection]} implementation.
*)

external get_file_database_type : t -> Gobject.Type.t
  = "ml_g_tls_backend_get_file_database_type"
(** Gets the [GType] of [backend]'s
    {{!Ocgio.Raw.Tls_file_database}[GTlsFileDatabase]} implementation. *)

external get_dtls_server_connection_type : t -> Gobject.Type.t
  = "ml_g_tls_backend_get_dtls_server_connection_type"
(** Gets the [GType] of [backend]’s
    {{!Ocgio.Raw.Dtls_server_connection}[GDtlsServerConnection]} implementation.
*)

external get_dtls_client_connection_type : t -> Gobject.Type.t
  = "ml_g_tls_backend_get_dtls_client_connection_type"
(** Gets the [GType] of [backend]’s
    {{!Ocgio.Raw.Dtls_client_connection}[GDtlsClientConnection]} implementation.
*)

external get_default_database :
  t -> Tls_connection_and__tls_database_and__tls_interaction.Tls_database.t
  = "ml_g_tls_backend_get_default_database"
(** Gets the default {{!Ocgio.Raw.Tls_database}[GTlsDatabase]} used to verify
    TLS connections. *)

external get_client_connection_type : t -> Gobject.Type.t
  = "ml_g_tls_backend_get_client_connection_type"
(** Gets the [GType] of [backend]'s
    {{!Ocgio.Raw.Tls_client_connection}[GTlsClientConnection]} implementation.
*)

external get_certificate_type : t -> Gobject.Type.t
  = "ml_g_tls_backend_get_certificate_type"
(** Gets the [GType] of [backend]'s
    {{!Ocgio.Raw.Tls_certificate}[GTlsCertificate]} implementation. *)
