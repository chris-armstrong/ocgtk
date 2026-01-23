(* GENERATED CODE - DO NOT EDIT *)
(* TlsCertificate: TlsCertificate *)

type t = [`tls_certificate | `object_] Gobject.obj

(* Methods *)
(** This verifies @cert and returns a set of #GTlsCertificateFlags
indicating any problems found with it. This can be used to verify a
certificate outside the context of making a connection, or to
check a certificate against a CA that is not part of the system
CA database.

If @cert is valid, %G_TLS_CERTIFICATE_NO_FLAGS is returned.

If @identity is not %NULL, @cert's name(s) will be compared against
it, and %G_TLS_CERTIFICATE_BAD_IDENTITY will be set in the return
value if it does not match. If @identity is %NULL, that bit will
never be set in the return value.

If @trusted_ca is not %NULL, then @cert (or one of the certificates
in its chain) must be signed by it, or else
%G_TLS_CERTIFICATE_UNKNOWN_CA will be set in the return value. If
@trusted_ca is %NULL, that bit will never be set in the return
value.

GLib guarantees that if certificate verification fails, at least one
error will be set in the return value, but it does not guarantee
that all possible errors will be set. Accordingly, you may not safely
decide to ignore any particular type of error. For example, it would
be incorrect to mask %G_TLS_CERTIFICATE_EXPIRED if you want to allow
expired certificates, because this could potentially be the only
error flag set even if other problems exist with the certificate.

Because TLS session context is not used, #GTlsCertificate may not
perform as many checks on the certificates as #GTlsConnection would.
For example, certificate constraints may not be honored, and
revocation checks may not be performed. The best way to verify TLS
certificates used by a TLS connection is to let #GTlsConnection
handle the verification. *)
external verify : t -> Socket_connectable.t option -> t option -> Gio_enums.tlscertificateflags = "ml_g_tls_certificate_verify"

(** Check if two #GTlsCertificate objects represent the same certificate.
The raw DER byte data of the two certificates are checked for equality.
This has the effect that two certificates may compare equal even if
their #GTlsCertificate:issuer, #GTlsCertificate:private-key, or
#GTlsCertificate:private-key-pem properties differ. *)
external is_same : t -> t -> bool = "ml_g_tls_certificate_is_same"

(** Returns the subject name from the certificate. *)
external get_subject_name : t -> string option = "ml_g_tls_certificate_get_subject_name"

(** Returns the issuer name from the certificate. *)
external get_issuer_name : t -> string option = "ml_g_tls_certificate_get_issuer_name"

(** Gets the #GTlsCertificate representing @cert's issuer, if known *)
external get_issuer : t -> t option = "ml_g_tls_certificate_get_issuer"

(** Gets the value of #GTlsCertificate:ip-addresses. *)
external get_ip_addresses : t -> Inet_address.t array option = "ml_g_tls_certificate_get_ip_addresses"

(* Properties *)

(** Get property: certificate-pem *)
external get_certificate_pem : t -> string = "ml_gtk_tls_certificate_get_certificate_pem"

(** Get property: password *)
external get_password : t -> string = "ml_gtk_tls_certificate_get_password"

(** Get property: pkcs11-uri *)
external get_pkcs11_uri : t -> string = "ml_gtk_tls_certificate_get_pkcs11_uri"

(** Get property: private-key-pem *)
external get_private_key_pem : t -> string = "ml_gtk_tls_certificate_get_private_key_pem"

(** Get property: private-key-pkcs11-uri *)
external get_private_key_pkcs11_uri : t -> string = "ml_gtk_tls_certificate_get_private_key_pkcs11_uri"

