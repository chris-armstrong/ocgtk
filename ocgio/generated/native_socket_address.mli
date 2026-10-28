(** A socket address of some unknown native type.

    Its methods, signals and properties are on
    {!class-type-native_socket_address_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgio.Raw.Native_socket_address}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [NativeSocketAddress].}

    Inherits from:
    {{!Ocgio.Socket_address.class-type-socket_address_t}Ocgio.Socket_address}

    Implements:
    - {{!Ocgio.Socket_connectable.class-type-socket_connectable_t}Ocgio.Socket_connectable}

    A socket address of some unknown native type.

    This corresponds to a general [struct sockaddr] of a type not otherwise
    handled by GLib. *)
class type native_socket_address_t = object
  inherit
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t

  (** {2:conversions Conversions} *)

  method as_native_socket_address : Raw.Native_socket_address.t
end

class native_socket_address :
  Raw.Native_socket_address.t ->
  native_socket_address_t
(** Wraps a raw handle of {!Ocgio.Raw.Native_socket_address.t}. *)

(** {1:description Description}

    A socket address of some unknown native type.

    This corresponds to a general [struct sockaddr] of a type not otherwise
    handled by GLib. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
