(** A certificate used for TLS authentication and encryption. This can represent
    either a certificate only (eg, the certificate received by a client from a
    server), or the combination of a certificate and a private key (which is
    needed when acting as a [Gio.TlsServerConnection]).

    Its methods, signals and properties are on {!class-type-tls_certificate_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgio.Raw.Tls_certificate}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TlsCertificate].}

    Inherits from: [GObject.Object]

    A certificate used for TLS authentication and encryption. This can represent
    either a certificate only (eg, the certificate received by a client from a
    server), or the combination of a certificate and a private key (which is
    needed when acting as a [Gio.TlsServerConnection]). *)
class type tls_certificate_t = object
  (** {2:methods Methods} *)

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
    Socket_connectable.socket_connectable_t option ->
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

  (** {2:properties Properties} *)

  method certificate_pem : string
  (** The PEM (ASCII) encoded representation of the certificate. This property
      and the [GTlsCertificate:certificate] property represent the same data,
      just in different forms. *)

  method pkcs11_uri : string
  (** A URI referencing the
      {{:https://docs.oasis-open.org/pkcs11/pkcs11-base/v3.0/os/pkcs11-base-v3.0-os.html}PKCS
       #11} objects containing an X.509 certificate and optionally a private
      key.

      If [NULL], the certificate is either not backed by PKCS #11 or the
      [GTlsBackend] does not support PKCS #11. *)

  method private_key_pem : string
  [@@ocaml.doc
    "The PEM (ASCII) encoded representation of the certificate's\n\
     private key in either \
     {{:https://datatracker.ietf.org/doc/html/rfc8017}PKCS #1 format}\n\
     (\"[BEGIN RSA PRIVATE KEY]\") or unencrypted\n\
     {{:https://datatracker.ietf.org/doc/html/rfc5208}PKCS #8 format}\n\
     (\"[BEGIN PRIVATE KEY]\"). PKCS #8 format is supported since 2.32;\n\
     earlier releases only support PKCS #1. You can use the [openssl rsa]\n\
     tool to convert PKCS #8 keys to PKCS #1.\n\n\
     This property (or the [GTlsCertificate:private]-key property)\n\
     can be set when constructing a key (for example, from a file).\n\
     Since GLib 2.70, it is now also readable; however, be aware that if\n\
     the private key is backed by a PKCS #11 URI - for example, if it\n\
     is stored on a smartcard - then this property will be [NULL]. If so,\n\
     the private key must be referenced via its PKCS #11 URI,\n\
     [GTlsCertificate:private]-key-pkcs11-uri. You must check both\n\
     properties to see if the certificate really has a private key.\n\
     When this property is read, the output format will be unencrypted\n\
     PKCS #8."]

  method private_key_pkcs11_uri : string
  (** A URI referencing a
      {{:https://docs.oasis-open.org/pkcs11/pkcs11-base/v3.0/os/pkcs11-base-v3.0-os.html}PKCS
       #11} object containing a private key. *)

  (** {2:conversions Conversions} *)

  method as_tls_certificate : Raw.Tls_certificate.t
end

class tls_certificate : Raw.Tls_certificate.t -> tls_certificate_t
(** Wraps a raw handle of {!Ocgio.Raw.Tls_certificate.t}. *)

(** {1:constructors Constructors} *)

val new_from_file : string -> (tls_certificate_t, GError.t) result
(** Creates a [GTlsCertificate] from the data in [file].

    As of 2.72, if the filename ends in [.p12] or [.pfx] the data is loaded by
    g_tls_certificate_new_from_pkcs12() otherwise it is loaded by
    g_tls_certificate_new_from_pem(). See those functions for exact details.

    If [file] cannot be read or parsed, the function will return [NULL] and set
    [error]. *)

val new_from_file_with_password :
  string -> string -> (tls_certificate_t, GError.t) result
(** Creates a [GTlsCertificate] from the data in [file].

    If [file] cannot be read or parsed, the function will return [NULL] and set
    [error].

    Any unknown file types will error with [G_IO_ERROR_NOT_SUPPORTED]. Currently
    only [.p12] and [.pfx] files are supported. See
    g_tls_certificate_new_from_pkcs12() for more details. *)

val new_from_files : string -> string -> (tls_certificate_t, GError.t) result
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

val new_from_pem : string -> int -> (tls_certificate_t, GError.t) result
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

val new_from_pkcs11_uris :
  string -> string option -> (tls_certificate_t, GError.t) result
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
