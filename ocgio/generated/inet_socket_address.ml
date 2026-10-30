class type inet_socket_address_t = object
  inherit Socket_address.socket_address_t

  (** {2:methods Methods} *)

  method get_address : unit -> Inet_address.inet_address_t
  (** Gets [address]'s [GInetAddress]. *)

  method get_flowinfo : unit -> UInt32.t
  (** Gets the [sin6_flowinfo] field from [address], which must be an IPv6
      address.

      If not overridden this value will be inherited from
      [Gio.InetSocketAddress:address]. *)

  method get_port : unit -> UInt16.t
  (** Gets [address]'s port. *)

  method get_scope_id : unit -> UInt32.t
  (** Gets the [sin6_scope_id] field from [address], which must be an IPv6
      address.

      If not overridden this value will be inherited from
      [Gio.InetSocketAddress:address]. *)

  (** {2:conversions Conversions} *)

  method as_inet_socket_address : Raw.Inet_socket_address.t
end

(* High-level class for InetSocketAddress *)
class inet_socket_address (obj : Raw.Inet_socket_address.t) :
  inet_socket_address_t =
  object (self)
    inherit Socket_address.socket_address (obj :> Raw.Socket_address.t)

    method get_address : unit -> Inet_address.inet_address_t =
      fun () ->
        new Inet_address.inet_address (Raw.Inet_socket_address.get_address obj)

    method get_flowinfo : unit -> UInt32.t =
      fun () -> Raw.Inet_socket_address.get_flowinfo obj

    method get_port : unit -> UInt16.t =
      fun () -> Raw.Inet_socket_address.get_port obj

    method get_scope_id : unit -> UInt32.t =
      fun () -> Raw.Inet_socket_address.get_scope_id obj

    method as_inet_socket_address = obj
  end

let new_ (address : Inet_address.inet_address_t) (port : UInt16.t) :
    inet_socket_address_t =
  let address = address#as_inet_address in
  let obj_ = Raw.Inet_socket_address.new_ address port in
  new inet_socket_address obj_

let new_from_string (address : string) (port : int) : inet_socket_address_t =
  let obj_ = Raw.Inet_socket_address.new_from_string address port in
  new inet_socket_address obj_
