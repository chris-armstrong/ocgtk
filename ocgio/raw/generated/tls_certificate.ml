(* GENERATED CODE - DO NOT EDIT *)
(* TlsCertificate: TlsCertificate *)

(** A certificate used for TLS authentication and encryption. This can represent
    either a certificate only (eg, the certificate received by a client from a
    server), or the combination of a certificate and a private key (which is
    needed when acting as a [Gio.TlsServerConnection]).

    The class built on this module is in {!Ocgio.Tls_certificate}. *)

type t = [ `tls_certificate | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_tls_certificate_get_type"

external new_from_file : string -> (t, GError.t) result
  = "ml_g_tls_certificate_new_from_file"
(** Creates a [GTlsCertificate] from the data in [file].

    As of 2.72, if the filename ends in [.p12] or [.pfx] the data is loaded by
    g_tls_certificate_new_from_pkcs12() otherwise it is loaded by
    g_tls_certificate_new_from_pem(). See those functions for exact details.

    If [file] cannot be read or parsed, the function will return [NULL] and set
    [error]. *)

external new_from_file_with_password : string -> string -> (t, GError.t) result
  = "ml_g_tls_certificate_new_from_file_with_password"
(** Creates a [GTlsCertificate] from the data in [file].

    If [file] cannot be read or parsed, the function will return [NULL] and set
    [error].

    Any unknown file types will error with [G_IO_ERROR_NOT_SUPPORTED]. Currently
    only [.p12] and [.pfx] files are supported. See
    g_tls_certificate_new_from_pkcs12() for more details. *)

external new_from_files : string -> string -> (t, GError.t) result
  = "ml_g_tls_certificate_new_from_files"
(** Creates a [GTlsCertificate] from the PEM-encoded data in [cert_file] and
    [key_file]. The returned certificate will be the first certificate found in
    [cert_file]. As of GLib 2.44, if [cert_file] contains more certificates it
    will try to load a certificate chain. All certificates will be verified in
    the order found (top-level certificate should be the last one in the file)
    and the [GTlsCertificate:issuer] property of each certificate will be set
    accordingly if the verification succeeds. If any certificate in the chain
    cannot be verified, the first certificate in the file will still be
    returned.

    If either file cannot be read or parsed, the function will return [NULL] and
    set [error]. Otherwise, this behaves like g_tls_certificate_new_from_pem().
*)

external new_from_pem : string -> int -> (t, GError.t) result
  = "ml_g_tls_certificate_new_from_pem"
(** Creates a [GTlsCertificate] from the PEM-encoded data in [data]. If [data]
    includes both a certificate and a private key, then the returned certificate
    will include the private key data as well. (See the
    [GTlsCertificate:private]-key-pem property for information about supported
    formats.)

    The returned certificate will be the first certificate found in [data]. As
    of GLib 2.44, if [data] contains more certificates it will try to load a
    certificate chain. All certificates will be verified in the order found
    (top-level certificate should be the last one in the file) and the
    [GTlsCertificate:issuer] property of each certificate will be set
    accordingly if the verification succeeds. If any certificate in the chain
    cannot be verified, the first certificate in the file will still be
    returned. *)

external new_from_pkcs11_uris : string -> string option -> (t, GError.t) result
  = "ml_g_tls_certificate_new_from_pkcs11_uris"
(** Creates a [GTlsCertificate] from a
    {{:https://docs.oasis-open.org/pkcs11/pkcs11-base/v3.0/os/pkcs11-base-v3.0-os.html}PKCS
     #11} URI.

    An example [pkcs11_uri] would be
    [pkcs11:model=Model;manufacturer=Manufacture;serial=1;token=My%20Client%20Certificate;id=%01]

    Where the token’s layout is:

    {[
    Object 0:
      URL: pkcs11:model=Model;manufacturer=Manufacture;serial=1;token=My%20Client%20Certificate;id=%01;object=private%20key;type=private
      Type: Private key (RSA-2048)
      ID: 01

    Object 1:
      URL: pkcs11:model=Model;manufacturer=Manufacture;serial=1;token=My%20Client%20Certificate;id=%01;object=Certificate%20for%20Authentication;type=cert
      Type: X.509 Certificate (RSA-2048)
      ID: 01
    ]}

    In this case the certificate and private key would both be detected and used
    as expected. [pkcs_uri] may also just reference an X.509 certificate object
    and then optionally [private_key_pkcs11_uri] allows using a private key
    exposed under a different URI.

    Note that the private key is not accessed until usage and may fail or
    require a PIN later. *)

(* Methods *)

external verify :
  t ->
  Socket_address_and__socket_address_enumerator_and__socket_connectable
  .Socket_connectable
  .t
  option ->
  t option ->
  Ocgio_enums.tlscertificateflags = "ml_g_tls_certificate_verify"
(** This verifies [cert] and returns a set of [GTlsCertificateFlags] indicating
    any problems found with it. This can be used to verify a certificate outside
    the context of making a connection, or to check a certificate against a CA
    that is not part of the system CA database.

    If [cert] is valid, [G_TLS_CERTIFICATE_NO_FLAGS] is returned.

    If [identity] is not [NULL], [cert]'s name(s) will be compared against it,
    and [G_TLS_CERTIFICATE_BAD_IDENTITY] will be set in the return value if it
    does not match. If [identity] is [NULL], that bit will never be set in the
    return value.

    If [trusted_ca] is not [NULL], then [cert] (or one of the certificates in
    its chain) must be signed by it, or else [G_TLS_CERTIFICATE_UNKNOWN_CA] will
    be set in the return value. If [trusted_ca] is [NULL], that bit will never
    be set in the return value.

    GLib guarantees that if certificate verification fails, at least one error
    will be set in the return value, but it does not guarantee that all possible
    errors will be set. Accordingly, you may not safely decide to ignore any
    particular type of error. For example, it would be incorrect to mask
    [G_TLS_CERTIFICATE_EXPIRED] if you want to allow expired certificates,
    because this could potentially be the only error flag set even if other
    problems exist with the certificate.

    Because TLS session context is not used, [GTlsCertificate] may not perform
    as many checks on the certificates as [GTlsConnection] would. For example,
    certificate constraints may not be honored, and revocation checks may not be
    performed. The best way to verify TLS certificates used by a TLS connection
    is to let [GTlsConnection] handle the verification. *)

external is_same : t -> t -> bool = "ml_g_tls_certificate_is_same"
(** Check if two [GTlsCertificate] objects represent the same certificate. The
    raw DER byte data of the two certificates are checked for equality. This has
    the effect that two certificates may compare equal even if their
    [GTlsCertificate:issuer], [GTlsCertificate:private]-key, or
    [GTlsCertificate:private]-key-pem properties differ. *)

external get_subject_name : t -> string option
  = "ml_g_tls_certificate_get_subject_name"
(** Returns the subject name from the certificate. *)

external get_issuer_name : t -> string option
  = "ml_g_tls_certificate_get_issuer_name"
(** Returns the issuer name from the certificate. *)

external get_issuer : t -> t option = "ml_g_tls_certificate_get_issuer"
(** Gets the [GTlsCertificate] representing [cert]'s issuer, if known *)

(* Properties *)

external get_certificate_pem : t -> string
  = "ml_g_tls_certificate_get_certificate_pem"
(** Get property: certificate-pem *)

external get_pkcs11_uri : t -> string = "ml_g_tls_certificate_get_pkcs11_uri"
(** Get property: pkcs11-uri *)

external get_private_key_pem : t -> string
  = "ml_g_tls_certificate_get_private_key_pem"
(** Get property: private-key-pem *)

external get_private_key_pkcs11_uri : t -> string
  = "ml_g_tls_certificate_get_private_key_pkcs11_uri"
(** Get property: private-key-pkcs11-uri *)
