class type inet_address_t = object
  (** {2:methods Methods} *)

  method equal : inet_address_t -> bool
  (** Checks if two [GInetAddress] instances are equal, e.g. the same address.
  *)

  method get_family : unit -> Enums.socketfamily
  (** Gets [address]'s family *)

  method get_flowinfo : unit -> UInt32.t
  (** Gets the value of [Gio.InetAddress:flowinfo]. *)

  method get_is_any : unit -> bool
  [@@ocaml.doc "Tests whether [address] is the \"any\" address for its family."]

  method get_is_link_local : unit -> bool
  (** Tests whether [address] is a link-local address (that is, if it identifies
      a host on a local network that is not connected to the Internet). *)

  method get_is_loopback : unit -> bool
  (** Tests whether [address] is the loopback address for its family. *)

  method get_is_mc_global : unit -> bool
  (** Tests whether [address] is a global multicast address. *)

  method get_is_mc_link_local : unit -> bool
  (** Tests whether [address] is a link-local multicast address. *)

  method get_is_mc_node_local : unit -> bool
  (** Tests whether [address] is a node-local multicast address. *)

  method get_is_mc_org_local : unit -> bool
  (** Tests whether [address] is an organization-local multicast address. *)

  method get_is_mc_site_local : unit -> bool
  (** Tests whether [address] is a site-local multicast address. *)

  method get_is_multicast : unit -> bool
  (** Tests whether [address] is a multicast address. *)

  method get_is_site_local : unit -> bool
  (** Tests whether [address] is a site-local address such as 10.0.0.1 (that is,
      the address identifies a host on a local network that can not be reached
      directly from the Internet, but which may have outgoing Internet
      connectivity via a NAT or firewall). *)

  method get_native_size : unit -> Gsize.t
  (** Gets the size of the native raw binary address for [address]. This is the
      size of the data that you get from g_inet_address_to_bytes(). *)

  method get_scope_id : unit -> UInt32.t
  (** Gets the value of [Gio.InetAddress:scope-id]. *)

  method to_string : unit -> string
  (** Converts [address] to string form. *)

  (** {2:conversions Conversions} *)

  method as_inet_address : Raw.Inet_address.t
end

(* High-level class for InetAddress *)
class inet_address (obj : Raw.Inet_address.t) : inet_address_t =
  object (self)
    method equal : inet_address_t -> bool =
      fun other_address ->
        let other_address = other_address#as_inet_address in
        Raw.Inet_address.equal obj other_address

    method get_family : unit -> Enums.socketfamily =
      fun () -> Raw.Inet_address.get_family obj

    method get_flowinfo : unit -> UInt32.t =
      fun () -> Raw.Inet_address.get_flowinfo obj

    method get_is_any : unit -> bool = fun () -> Raw.Inet_address.get_is_any obj

    method get_is_link_local : unit -> bool =
      fun () -> Raw.Inet_address.get_is_link_local obj

    method get_is_loopback : unit -> bool =
      fun () -> Raw.Inet_address.get_is_loopback obj

    method get_is_mc_global : unit -> bool =
      fun () -> Raw.Inet_address.get_is_mc_global obj

    method get_is_mc_link_local : unit -> bool =
      fun () -> Raw.Inet_address.get_is_mc_link_local obj

    method get_is_mc_node_local : unit -> bool =
      fun () -> Raw.Inet_address.get_is_mc_node_local obj

    method get_is_mc_org_local : unit -> bool =
      fun () -> Raw.Inet_address.get_is_mc_org_local obj

    method get_is_mc_site_local : unit -> bool =
      fun () -> Raw.Inet_address.get_is_mc_site_local obj

    method get_is_multicast : unit -> bool =
      fun () -> Raw.Inet_address.get_is_multicast obj

    method get_is_site_local : unit -> bool =
      fun () -> Raw.Inet_address.get_is_site_local obj

    method get_native_size : unit -> Gsize.t =
      fun () -> Raw.Inet_address.get_native_size obj

    method get_scope_id : unit -> UInt32.t =
      fun () -> Raw.Inet_address.get_scope_id obj

    method to_string : unit -> string = fun () -> Raw.Inet_address.to_string obj
    method as_inet_address = obj
  end

let new_any (family : Enums.socketfamily) : inet_address_t =
  let obj_ = Raw.Inet_address.new_any family in
  new inet_address obj_

let new_from_string (string : string) : inet_address_t =
  let obj_ = Raw.Inet_address.new_from_string string in
  new inet_address obj_

let new_loopback (family : Enums.socketfamily) : inet_address_t =
  let obj_ = Raw.Inet_address.new_loopback family in
  new inet_address obj_
