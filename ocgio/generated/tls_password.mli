(** An abstract interface representing a password used in TLS. Often used in
    user interaction such as unlocking a key storage token.

    Its methods, signals and properties are on {!class-type-tls_password_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgio.Raw.Tls_password}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TlsPassword].}

    An abstract interface representing a password used in TLS. Often used in
    user interaction such as unlocking a key storage token. *)
class type tls_password_t = object
  method get_description : unit -> string
  (** Get a description string about what the password will be used for. *)

  method get_flags : unit -> Enums.tlspasswordflags
  (** Get flags about the password. *)

  method get_warning : unit -> string
  (** Get a user readable translated warning. Usually this warning is a
      representation of the password flags returned from
      g_tls_password_get_flags(). *)

  method set_description : string -> unit
  (** Set a description string about what the password will be used for. *)

  method set_flags : Enums.tlspasswordflags -> unit
  (** Set flags about the password. *)

  method set_warning : string -> unit
  (** Set a user readable translated warning. Usually this warning is a
      representation of the password flags returned from
      g_tls_password_get_flags(). *)

  method as_tls_password : Raw.Tls_password.t
end

class tls_password : Raw.Tls_password.t -> tls_password_t
(** Wraps a raw handle of {!Ocgio.Raw.Tls_password.t}. *)

(** {1:constructors Constructors} *)

val new_ : Enums.tlspasswordflags -> string -> tls_password_t
(** Create a new [GTlsPassword] object. *)
