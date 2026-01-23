(* High-level class for TlsCertificate *)
class tls_certificate (obj : Tls_certificate.t) = object (self)

  method get_ip_addresses : unit -> Inet_address.t array option =
    fun () ->
      (Tls_certificate.get_ip_addresses obj)

  method get_issuer : unit -> tls_certificate option =
    fun () ->
      Option.map (fun ret -> new tls_certificate ret) (Tls_certificate.get_issuer obj)

  method get_issuer_name : unit -> string option =
    fun () ->
      (Tls_certificate.get_issuer_name obj)

  method get_subject_name : unit -> string option =
    fun () ->
      (Tls_certificate.get_subject_name obj)

  method is_same : 'p1. (<as_tls_certificate: Tls_certificate.t; ..> as 'p1) -> bool =
    fun cert_two ->
      let cert_two = cert_two#as_tls_certificate in
      (Tls_certificate.is_same obj cert_two)

  method certificate_pem = Tls_certificate.get_certificate_pem obj

  method password = Tls_certificate.get_password obj

  method pkcs11_uri = Tls_certificate.get_pkcs11_uri obj

  method private_key_pem = Tls_certificate.get_private_key_pem obj

  method private_key_pkcs11_uri = Tls_certificate.get_private_key_pkcs11_uri obj

    method as_tls_certificate = obj
end

