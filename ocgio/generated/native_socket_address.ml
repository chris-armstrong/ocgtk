class type native_socket_address_t = object
  inherit
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t

  (** {2:conversions Conversions} *)

  method as_native_socket_address : Raw.Native_socket_address.t
end

(* High-level class for NativeSocketAddress *)
class native_socket_address (obj : Raw.Native_socket_address.t) :
  native_socket_address_t =
  object (self)
    inherit
      Socket_address_and__socket_address_enumerator_and__socket_connectable
      .socket_address
        (obj :> Raw.Socket_address.t)

    method as_native_socket_address = obj
  end
