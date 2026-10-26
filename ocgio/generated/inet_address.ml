class type inet_address_t = object
  method equal : inet_address_t -> bool
  method get_family : unit -> Enums.socketfamily
  method get_flowinfo : unit -> UInt32.t
  method get_is_any : unit -> bool
  method get_is_link_local : unit -> bool
  method get_is_loopback : unit -> bool
  method get_is_mc_global : unit -> bool
  method get_is_mc_link_local : unit -> bool
  method get_is_mc_node_local : unit -> bool
  method get_is_mc_org_local : unit -> bool
  method get_is_mc_site_local : unit -> bool
  method get_is_multicast : unit -> bool
  method get_is_site_local : unit -> bool
  method get_native_size : unit -> Gsize.t
  method get_scope_id : unit -> UInt32.t
  method to_string : unit -> string
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
