class type tls_password_t = object
  (** {2:methods Methods} *)

  method get_description : unit -> string
  (** Get a description string about what the password will be used for. *)

  method get_flags : unit -> Enums.tlspasswordflags
  (** Get flags about the password. *)

  method get_warning : unit -> string
  (** Get a user readable translated warning. Usually this warning is a
      representation of the password flags returned from
      [g_tls_password_get_flags ()]. *)

  method set_description : string -> unit
  (** Set a description string about what the password will be used for. *)

  method set_flags : Enums.tlspasswordflags -> unit
  (** Set flags about the password. *)

  method set_warning : string -> unit
  (** Set a user readable translated warning. Usually this warning is a
      representation of the password flags returned from
      [g_tls_password_get_flags ()]. *)

  (** {2:conversions Conversions} *)

  method as_tls_password : Raw.Tls_password.t
end

(* High-level class for TlsPassword *)
class tls_password (obj : Raw.Tls_password.t) : tls_password_t =
  object (self)
    method get_description : unit -> string =
      fun () -> Raw.Tls_password.get_description obj

    method get_flags : unit -> Enums.tlspasswordflags =
      fun () -> Raw.Tls_password.get_flags obj

    method get_warning : unit -> string =
      fun () -> Raw.Tls_password.get_warning obj

    method set_description : string -> unit =
      fun description -> Raw.Tls_password.set_description obj description

    method set_flags : Enums.tlspasswordflags -> unit =
      fun flags -> Raw.Tls_password.set_flags obj flags

    method set_warning : string -> unit =
      fun warning -> Raw.Tls_password.set_warning obj warning

    method as_tls_password = obj
  end

let new_ (flags : Enums.tlspasswordflags) (description : string) :
    tls_password_t =
  let obj_ = Raw.Tls_password.new_ flags description in
  new tls_password obj_
