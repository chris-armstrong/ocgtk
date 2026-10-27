(** A certificate used for TLS authentication and encryption. This can represent
    either a certificate only (eg, the certificate received by a client from a
    server), or the combination of a certificate and a private key (which is
    needed when acting as a [Gio.TlsServerConnection]).

    Its methods, signals and properties are on {!class-type-tls_certificate_t}.
    The functions it is built on are in {!Ocgio.Raw.Tls_certificate}. *)

(** The methods, signals and properties of a [GTlsCertificate]. *)
class type tls_certificate_t = object
  method get_issuer : unit -> tls_certificate_t option
  method get_issuer_name : unit -> string option
  method get_subject_name : unit -> string option
  method is_same : tls_certificate_t -> bool

  method verify :
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t
    option ->
    tls_certificate_t option ->
    Enums.tlscertificateflags

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
