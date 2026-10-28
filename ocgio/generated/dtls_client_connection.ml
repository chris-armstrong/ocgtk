class type dtls_client_connection_t = object
  (** {2:methods Methods} *)

  method get_server_identity :
    unit ->
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t
  (** Gets [conn]'s expected server identity *)

  method get_validation_flags : unit -> Enums.tlscertificateflags
  (** Gets [conn]'s validation flags

      This function does not work as originally designed and is impossible to
      use correctly. See [GDtlsClientConnection:validation]-flags for more
      information. *)

  method set_server_identity :
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t ->
    unit
  (** Sets [conn]'s expected server identity, which is used both to tell servers
      on virtual hosts which certificate to present, and also to let [conn] know
      what name to look for in the certificate when performing
      [G_TLS_CERTIFICATE_BAD_IDENTITY] validation, if enabled. *)

  method set_validation_flags : Enums.tlscertificateflags -> unit
  (** Sets [conn]'s validation flags, to override the default set of checks
      performed when validating a server certificate. By default,
      [G_TLS_CERTIFICATE_VALIDATE_ALL] is used.

      This function does not work as originally designed and is impossible to
      use correctly. See [GDtlsClientConnection:validation]-flags for more
      information. *)

  (** {2:conversions Conversions} *)

  method as_dtls_client_connection : Raw.Dtls_client_connection.t
end

(* High-level class for DtlsClientConnection *)
class dtls_client_connection (obj : Raw.Dtls_client_connection.t) :
  dtls_client_connection_t =
  object (self)
    method get_server_identity :
        unit ->
        Socket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_connectable_t =
      fun () ->
        new
          Socket_address_and__socket_address_enumerator_and__socket_connectable
          .socket_connectable
          (Raw.Dtls_client_connection.get_server_identity obj)

    method get_validation_flags : unit -> Enums.tlscertificateflags =
      fun () -> Raw.Dtls_client_connection.get_validation_flags obj

    method set_server_identity :
        Socket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_connectable_t ->
        unit =
      fun identity ->
        let identity = identity#as_socket_connectable in
        Raw.Dtls_client_connection.set_server_identity obj identity

    method set_validation_flags : Enums.tlscertificateflags -> unit =
      fun flags -> Raw.Dtls_client_connection.set_validation_flags obj flags

    method as_dtls_client_connection = obj
  end
