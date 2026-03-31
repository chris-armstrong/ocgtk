class type tls_certificate_t = object
    method get_issuer : unit -> tls_certificate_t option
    method get_issuer_name : unit -> string option
    method get_subject_name : unit -> string option
    method is_same : tls_certificate_t -> bool
    method certificate_pem : string
    method password : string
    method pkcs11_uri : string
    method private_key_pem : string
    method private_key_pkcs11_uri : string
    method as_tls_certificate : Tls_certificate.t
end

(* High-level class for TlsCertificate *)
class tls_certificate (obj : Tls_certificate.t) : tls_certificate_t = object (self)

  method get_issuer : unit -> tls_certificate_t option =
    fun () ->
      Option.map (fun ret -> new tls_certificate ret) (Tls_certificate.get_issuer obj)

  method get_issuer_name : unit -> string option =
    fun () ->
      (Tls_certificate.get_issuer_name obj)

  method get_subject_name : unit -> string option =
    fun () ->
      (Tls_certificate.get_subject_name obj)

  method is_same : tls_certificate_t -> bool =
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

let new_from_file (file : string) : (tls_certificate_t, GError.t) result =
  let obj_ = Tls_certificate.new_from_file file in
Result.map (fun obj_ ->  new tls_certificate obj_) obj_

let new_from_file_with_password (file : string) (password : string) : (tls_certificate_t, GError.t) result =
  let obj_ = Tls_certificate.new_from_file_with_password file password in
Result.map (fun obj_ ->  new tls_certificate obj_) obj_

let new_from_files (cert_file : string) (key_file : string) : (tls_certificate_t, GError.t) result =
  let obj_ = Tls_certificate.new_from_files cert_file key_file in
Result.map (fun obj_ ->  new tls_certificate obj_) obj_

let new_from_pkcs11_uris (pkcs11_uri : string) (private_key_pkcs11_uri : string option) : (tls_certificate_t, GError.t) result =
  let obj_ = Tls_certificate.new_from_pkcs11_uris pkcs11_uri private_key_pkcs11_uri in
Result.map (fun obj_ ->  new tls_certificate obj_) obj_

