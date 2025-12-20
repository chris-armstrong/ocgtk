(* High-level class for InetAddress *)
class inet_address (obj : Inet_address.t) = object (self)

  method equal : 'p1. (<as_inet_address: Inet_address.t; ..> as 'p1) -> bool =
    fun other_address ->
      let other_address = other_address#as_inet_address in
      (Inet_address.equal obj other_address)

  method get_family : unit -> Gio_enums.socketfamily =
    fun () ->
      (Inet_address.get_family obj)

  method get_is_any : unit -> bool =
    fun () ->
      (Inet_address.get_is_any obj)

  method get_is_link_local : unit -> bool =
    fun () ->
      (Inet_address.get_is_link_local obj)

  method get_is_loopback : unit -> bool =
    fun () ->
      (Inet_address.get_is_loopback obj)

  method get_is_mc_global : unit -> bool =
    fun () ->
      (Inet_address.get_is_mc_global obj)

  method get_is_mc_link_local : unit -> bool =
    fun () ->
      (Inet_address.get_is_mc_link_local obj)

  method get_is_mc_node_local : unit -> bool =
    fun () ->
      (Inet_address.get_is_mc_node_local obj)

  method get_is_mc_org_local : unit -> bool =
    fun () ->
      (Inet_address.get_is_mc_org_local obj)

  method get_is_mc_site_local : unit -> bool =
    fun () ->
      (Inet_address.get_is_mc_site_local obj)

  method get_is_multicast : unit -> bool =
    fun () ->
      (Inet_address.get_is_multicast obj)

  method get_is_site_local : unit -> bool =
    fun () ->
      (Inet_address.get_is_site_local obj)

  method to_string : unit -> string =
    fun () ->
      (Inet_address.to_string obj)

    method as_inet_address = obj
end

