class tls_certificate : Tls_certificate.t ->
  object
    method get_ip_addresses : unit -> Inet_address.t array option
    method get_issuer : unit -> tls_certificate option
    method get_issuer_name : unit -> string option
    method get_subject_name : unit -> string option
    method is_same : <as_tls_certificate: Tls_certificate.t; ..> -> bool
    method certificate_pem : string
    method password : string
    method pkcs11_uri : string
    method private_key_pem : string
    method private_key_pkcs11_uri : string
    method as_tls_certificate : Tls_certificate.t
  end

