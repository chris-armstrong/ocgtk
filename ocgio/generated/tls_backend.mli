(** TLS (Transport Layer Security, aka SSL) and DTLS backend. This is an
    internal type used to coordinate the different classes implemented by a TLS
    backend.

    Its methods, signals and properties are on {!class-type-tls_backend_t}. The
    functions it is built on are in {!Ocgio.Raw.Tls_backend}. *)

(** The methods, signals and properties of a [GTlsBackend]. *)
class type tls_backend_t = object
  method get_certificate_type : unit -> Gobject.Type.t
  (** Gets the [GType] of [backend]'s [GTlsCertificate] implementation. *)

  method get_client_connection_type : unit -> Gobject.Type.t
  (** Gets the [GType] of [backend]'s [GTlsClientConnection] implementation. *)

  method get_default_database :
    unit -> Tls_connection_and__tls_database_and__tls_interaction.tls_database_t
  (** Gets the default [GTlsDatabase] used to verify TLS connections. *)

  method get_dtls_client_connection_type : unit -> Gobject.Type.t
  (** Gets the [GType] of [backend]’s [GDtlsClientConnection] implementation. *)

  method get_dtls_server_connection_type : unit -> Gobject.Type.t
  (** Gets the [GType] of [backend]’s [GDtlsServerConnection] implementation. *)

  method get_file_database_type : unit -> Gobject.Type.t
  (** Gets the [GType] of [backend]'s [GTlsFileDatabase] implementation. *)

  method get_server_connection_type : unit -> Gobject.Type.t
  (** Gets the [GType] of [backend]'s [GTlsServerConnection] implementation. *)

  method set_default_database :
    Tls_connection_and__tls_database_and__tls_interaction.tls_database_t option ->
    unit
  (** Set the default [GTlsDatabase] used to verify TLS connections

      Any subsequent call to g_tls_backend_get_default_database() will return
      the database set in this call. Existing databases and connections are not
      modified.

      Setting a [NULL] default database will reset to using the system default
      database as if g_tls_backend_set_default_database() had never been called.
  *)

  method supports_dtls : unit -> bool
  (** Checks if DTLS is supported. DTLS support may not be available even if TLS
      support is available, and vice-versa. *)

  method supports_tls : unit -> bool
  [@@ocaml.doc
    "Checks if TLS is supported; if this returns [FALSE] for the default\n\
     [GTlsBackend], it means no \"real\" TLS backend is available."]

  method as_tls_backend : Raw.Tls_backend.t
end

class tls_backend : Raw.Tls_backend.t -> tls_backend_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Tls_backend.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GTlsBackend], give one already wrapped. *)
