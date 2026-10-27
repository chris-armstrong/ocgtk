(** An abstract interface representing a password used in TLS. Often used in
    user interaction such as unlocking a key storage token.

    Its methods, signals and properties are on {!class-type-tls_password_t}. The
    functions it is built on are in {!Ocgio.Raw.Tls_password}. *)

(** The methods, signals and properties of a [GTlsPassword]. *)
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
(** Wraps a layer 1 handle, {!Ocgio.Raw.Tls_password.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GTlsPassword], give one already wrapped. *)

val new_ : Enums.tlspasswordflags -> string -> tls_password_t
