(** TLS (Transport Layer Security, aka SSL) and DTLS backend. This is an
    internal type used to coordinate the different classes implemented by a TLS
    backend.

    Its methods, signals and properties are on {!class-type-tls_backend_t}. The
    functions it is built on are in {!Ocgio.Raw.Tls_backend}. *)

(** The methods, signals and properties of a [GTlsBackend]. *)
class type tls_backend_t = object
  method get_certificate_type : unit -> Gobject.Type.t
  method get_client_connection_type : unit -> Gobject.Type.t

  method get_default_database :
    unit -> Tls_connection_and__tls_database_and__tls_interaction.tls_database_t

  method get_dtls_client_connection_type : unit -> Gobject.Type.t
  method get_dtls_server_connection_type : unit -> Gobject.Type.t
  method get_file_database_type : unit -> Gobject.Type.t
  method get_server_connection_type : unit -> Gobject.Type.t

  method set_default_database :
    Tls_connection_and__tls_database_and__tls_interaction.tls_database_t option ->
    unit

  method supports_dtls : unit -> bool
  method supports_tls : unit -> bool
  method as_tls_backend : Raw.Tls_backend.t
end

class tls_backend : Raw.Tls_backend.t -> tls_backend_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Tls_backend.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GTlsBackend], give one already wrapped. *)
