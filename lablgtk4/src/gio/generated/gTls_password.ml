(* High-level class for TlsPassword *)
class tls_password (obj : Tls_password.t) = object (self)

  method get_description : unit -> string =
    fun () ->
      (Tls_password.get_description obj)

  method get_warning : unit -> string =
    fun () ->
      (Tls_password.get_warning obj)

  method set_description : string -> unit =
    fun description ->
      (Tls_password.set_description obj description)

  method set_warning : string -> unit =
    fun warning ->
      (Tls_password.set_warning obj warning)

    method as_tls_password = obj
end

