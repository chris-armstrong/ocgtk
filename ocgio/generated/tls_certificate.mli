(** A certificate used for TLS authentication and encryption. This can represent
    either a certificate only (eg, the certificate received by a client from a
    server), or the combination of a certificate and a private key (which is
    needed when acting as a [Gio.TlsServerConnection]).

    Its methods, signals and properties are on {!class-type-tls_certificate_t}.
    The functions it is built on are in {!Ocgio.Raw.Tls_certificate}. *)

(** The methods, signals and properties of a [GTlsCertificate]. *)
class type tls_certificate_t = object
  method get_issuer : unit -> tls_certificate_t option
  (** Gets the [GTlsCertificate] representing [cert]'s issuer, if known *)

  method get_issuer_name : unit -> string option
  (** Returns the issuer name from the certificate. *)

  method get_subject_name : unit -> string option
  (** Returns the subject name from the certificate. *)

  method is_same : tls_certificate_t -> bool
  (** Check if two [GTlsCertificate] objects represent the same certificate. The
      raw DER byte data of the two certificates are checked for equality. This
      has the effect that two certificates may compare equal even if their
      [GTlsCertificate:issuer], [GTlsCertificate:private]-key, or
      [GTlsCertificate:private]-key-pem properties differ. *)

  method verify :
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t
    option ->
    tls_certificate_t option ->
    Enums.tlscertificateflags
  (** This verifies [cert] and returns a set of [GTlsCertificateFlags]
      indicating any problems found with it. This can be used to verify a
      certificate outside the context of making a connection, or to check a
      certificate against a CA that is not part of the system CA database.

      If [cert] is valid, [G_TLS_CERTIFICATE_NO_FLAGS] is returned.

      If [identity] is not [NULL], [cert]'s name(s) will be compared against it,
      and [G_TLS_CERTIFICATE_BAD_IDENTITY] will be set in the return value if it
      does not match. If [identity] is [NULL], that bit will never be set in the
      return value.

      If [trusted_ca] is not [NULL], then [cert] (or one of the certificates in
      its chain) must be signed by it, or else [G_TLS_CERTIFICATE_UNKNOWN_CA]
      will be set in the return value. If [trusted_ca] is [NULL], that bit will
      never be set in the return value.

      GLib guarantees that if certificate verification fails, at least one error
      will be set in the return value, but it does not guarantee that all
      possible errors will be set. Accordingly, you may not safely decide to
      ignore any particular type of error. For example, it would be incorrect to
      mask [G_TLS_CERTIFICATE_EXPIRED] if you want to allow expired
      certificates, because this could potentially be the only error flag set
      even if other problems exist with the certificate.

      Because TLS session context is not used, [GTlsCertificate] may not perform
      as many checks on the certificates as [GTlsConnection] would. For example,
      certificate constraints may not be honored, and revocation checks may not
      be performed. The best way to verify TLS certificates used by a TLS
      connection is to let [GTlsConnection] handle the verification. *)

  method certificate_pem : string
  method pkcs11_uri : string
  method private_key_pem : string
  method private_key_pkcs11_uri : string
  method as_tls_certificate : Raw.Tls_certificate.t
end

class tls_certificate : Raw.Tls_certificate.t -> tls_certificate_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Tls_certificate.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GTlsCertificate], give one already wrapped. *)

val new_from_file : string -> (tls_certificate_t, GError.t) result

val new_from_file_with_password :
  string -> string -> (tls_certificate_t, GError.t) result

val new_from_files : string -> string -> (tls_certificate_t, GError.t) result
val new_from_pem : string -> int -> (tls_certificate_t, GError.t) result

val new_from_pkcs11_uris :
  string -> string option -> (tls_certificate_t, GError.t) result
