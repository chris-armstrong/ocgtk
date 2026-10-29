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
      [GTlsCertificate:issuer], [GTlsCertificate:private-key], or
      [GTlsCertificate:private-key-pem] properties differ. *)

  method verify :
    Socket_connectable.socket_connectable_t option ->
    tls_certificate_t option ->
    Enums.tlscertificateflags
  (** This verifies [cert] and returns a set of [GTlsCertificateFlags]
      indicating any problems found with it. This can be used to verify a
      certificate outside the context of making a connection, or to check a
      certificate against a CA that is not part of the system CA database.

      If [cert] is valid, [G_TLS_CERTIFICATE_NO_FLAGS] is returned.

      If [identity] is not [None], [cert]'s name(s) will be compared against it,
      and [G_TLS_CERTIFICATE_BAD_IDENTITY] will be set in the return value if it
      does not match. If [identity] is [None], that bit will never be set in the
      return value.

      If [trusted_ca] is not [None], then [cert] (or one of the certificates in
      its chain) must be signed by it, or else [G_TLS_CERTIFICATE_UNKNOWN_CA]
      will be set in the return value. If [trusted_ca] is [None], that bit will
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

      If [None], the certificate is either not backed by PKCS #11 or the
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
     This property (or the [GTlsCertificate:private-key] property)\n\
     can be set when constructing a key (for example, from a file).\n\
     Since GLib 2.70, it is now also readable; however, be aware that if\n\
     the private key is backed by a PKCS #11 URI - for example, if it\n\
     is stored on a smartcard - then this property will be [None]. If so,\n\
     the private key must be referenced via its PKCS #11 URI,\n\
     [GTlsCertificate:private-key-pkcs11-uri]. You must check both\n\
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

(* High-level class for TlsCertificate *)
class tls_certificate (obj : Raw.Tls_certificate.t) : tls_certificate_t =
  object (self)
    method get_issuer : unit -> tls_certificate_t option =
      fun () ->
        Option.map
          (fun ret -> new tls_certificate ret)
          (Raw.Tls_certificate.get_issuer obj)

    method get_issuer_name : unit -> string option =
      fun () -> Raw.Tls_certificate.get_issuer_name obj

    method get_subject_name : unit -> string option =
      fun () -> Raw.Tls_certificate.get_subject_name obj

    method is_same : tls_certificate_t -> bool =
      fun cert_two ->
        let cert_two = cert_two#as_tls_certificate in
        Raw.Tls_certificate.is_same obj cert_two

    method verify :
        Socket_connectable.socket_connectable_t option ->
        tls_certificate_t option ->
        Enums.tlscertificateflags =
      fun identity trusted_ca ->
        let identity = Option.map (fun c -> c#as_socket_connectable) identity in
        let trusted_ca =
          Option.map (fun c -> c#as_tls_certificate) trusted_ca
        in
        Raw.Tls_certificate.verify obj identity trusted_ca

    method certificate_pem = Raw.Tls_certificate.get_certificate_pem obj
    method pkcs11_uri = Raw.Tls_certificate.get_pkcs11_uri obj
    method private_key_pem = Raw.Tls_certificate.get_private_key_pem obj

    method private_key_pkcs11_uri =
      Raw.Tls_certificate.get_private_key_pkcs11_uri obj

    method as_tls_certificate = obj
  end

let new_from_file (file : string) : (tls_certificate_t, GError.t) result =
  let obj_ = Raw.Tls_certificate.new_from_file file in
  Result.map (fun obj_ -> new tls_certificate obj_) obj_

let new_from_file_with_password (file : string) (password : string) :
    (tls_certificate_t, GError.t) result =
  let obj_ = Raw.Tls_certificate.new_from_file_with_password file password in
  Result.map (fun obj_ -> new tls_certificate obj_) obj_

let new_from_files (cert_file : string) (key_file : string) :
    (tls_certificate_t, GError.t) result =
  let obj_ = Raw.Tls_certificate.new_from_files cert_file key_file in
  Result.map (fun obj_ -> new tls_certificate obj_) obj_

let new_from_pem (data : string) (length : int) :
    (tls_certificate_t, GError.t) result =
  let obj_ = Raw.Tls_certificate.new_from_pem data length in
  Result.map (fun obj_ -> new tls_certificate obj_) obj_

let new_from_pkcs11_uris (pkcs11_uri : string)
    (private_key_pkcs11_uri : string option) :
    (tls_certificate_t, GError.t) result =
  let obj_ =
    Raw.Tls_certificate.new_from_pkcs11_uris pkcs11_uri private_key_pkcs11_uri
  in
  Result.map (fun obj_ -> new tls_certificate obj_) obj_
