class type tls_password_t = object
  method get_description : unit -> string
  method get_flags : unit -> Enums.tlspasswordflags
  method get_warning : unit -> string
  method set_description : string -> unit
  method set_flags : Enums.tlspasswordflags -> unit
  method set_warning : string -> unit
  method as_tls_password : Raw.Tls_password.t
end

class tls_password : Raw.Tls_password.t -> tls_password_t

val new_ : Enums.tlspasswordflags -> string -> tls_password_t
