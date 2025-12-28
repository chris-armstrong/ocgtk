class tls_password : Tls_password.t ->
  object
    method get_description : unit -> string
    method get_flags : unit -> Gio_enums.tlspasswordflags
    method get_warning : unit -> string
    method set_description : string -> unit
    method set_flags : Gio_enums.tlspasswordflags -> unit
    method set_warning : string -> unit
    method as_tls_password : Tls_password.t
  end

