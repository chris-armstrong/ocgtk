class type tls_certificate_t = object
    method get_issuer : unit -> tls_certificate_t option
    method get_issuer_name : unit -> string option
    method get_subject_name : unit -> string option
    method is_same : tls_certificate_t -> bool
    method verify : GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_connectable_t option -> tls_certificate_t option -> Gio_enums.tlscertificateflags
    method certificate_pem : string
    method pkcs11_uri : string
    method private_key_pem : string
    method private_key_pkcs11_uri : string
    method as_tls_certificate : Tls_certificate.t
end

class tls_certificate : Tls_certificate.t -> tls_certificate_t

val new_from_file : string -> (tls_certificate_t, GError.t) result
val new_from_file_with_password : string -> string -> (tls_certificate_t, GError.t) result
val new_from_files : string -> string -> (tls_certificate_t, GError.t) result
val new_from_pem : string -> int -> (tls_certificate_t, GError.t) result
val new_from_pkcs11_uris : string -> string option -> (tls_certificate_t, GError.t) result
