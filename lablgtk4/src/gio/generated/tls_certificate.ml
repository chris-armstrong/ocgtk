(* GENERATED CODE - DO NOT EDIT *)
(* TlsCertificate: TlsCertificate *)

type t = [`tls_certificate | `object_] Gobject.obj

(* Methods *)
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

