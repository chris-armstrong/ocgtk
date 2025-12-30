class inet_address : Inet_address.t ->
  object
    method equal : <as_inet_address: Inet_address.t; ..> -> bool
    method get_family : unit -> Gio_enums.socketfamily
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
    method to_string : unit -> string
    method as_inet_address : Inet_address.t
  end

