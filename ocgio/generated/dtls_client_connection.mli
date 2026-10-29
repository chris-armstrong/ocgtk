(** [GDtlsClientConnection] is the client-side subclass of
    {{!Ocgio.Dtls_connection.class-type-dtls_connection_t}[Gio.DtlsConnection]},
    representing a client-side DTLS connection.

    Its methods, signals and properties are on
    {!class-type-dtls_client_connection_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Dtls_client_connection}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DtlsClientConnection].}

    Requires:
    - {{!Ocgio.Datagram_based.class-type-datagram_based_t}Ocgio.Datagram_based}
    - {{!Ocgio.Dtls_connection.class-type-dtls_connection_t}Ocgio.Dtls_connection}

    [GDtlsClientConnection] is the client-side subclass of
    {{!Ocgio.Dtls_connection.class-type-dtls_connection_t}[Gio.DtlsConnection]},
    representing a client-side DTLS connection. *)
class type dtls_client_connection_t = object
  (** {2:methods Methods} *)

  method get_server_identity : unit -> Socket_connectable.socket_connectable_t
  (** Gets [conn]'s expected server identity *)

  method get_validation_flags : unit -> Enums.tlscertificateflags
  (** Gets [conn]'s validation flags

      This function does not work as originally designed and is impossible to
      use correctly. See [GDtlsClientConnection:validation-flags] for more
      information. *)

  method set_server_identity : Socket_connectable.socket_connectable_t -> unit
  (** Sets [conn]'s expected server identity, which is used both to tell servers
      on virtual hosts which certificate to present, and also to let [conn] know
      what name to look for in the certificate when performing
      [G_TLS_CERTIFICATE_BAD_IDENTITY] validation, if enabled. *)

  method set_validation_flags : Enums.tlscertificateflags -> unit
  (** Sets [conn]'s validation flags, to override the default set of checks
      performed when validating a server certificate. By default,
      [G_TLS_CERTIFICATE_VALIDATE_ALL] is used.

      This function does not work as originally designed and is impossible to
      use correctly. See [GDtlsClientConnection:validation-flags] for more
      information. *)

  (** {2:conversions Conversions} *)

  method as_dtls_client_connection : Raw.Dtls_client_connection.t
end

class dtls_client_connection :
  Raw.Dtls_client_connection.t ->
  dtls_client_connection_t
(** Wraps a raw handle of {!Ocgio.Raw.Dtls_client_connection.t}. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
