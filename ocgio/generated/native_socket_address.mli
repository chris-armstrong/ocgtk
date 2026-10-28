(** A socket address of some unknown native type.

    This corresponds to a general [struct sockaddr] of a type not otherwise
    handled by GLib.

    Its methods, signals and properties are on
    {!class-type-native_socket_address_t}. The functions it is built on are in
    {!Ocgio.Raw.Native_socket_address}. *)

(** {b The methods, signals and properties of a [NativeSocketAddress].}

    A socket address of some unknown native type.

    This corresponds to a general [struct sockaddr] of a type not otherwise
    handled by GLib. *)
class type native_socket_address_t = object
  inherit
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t

  method as_native_socket_address : Raw.Native_socket_address.t
end

class native_socket_address :
  Raw.Native_socket_address.t ->
  native_socket_address_t
(** Wraps a raw handle of {!Ocgio.Raw.Native_socket_address.t}. *)
