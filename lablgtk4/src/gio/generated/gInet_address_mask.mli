class inet_address_mask : Inet_address_mask.t ->
  object
    method equal : <as_inet_address_mask: Inet_address_mask.t; ..> -> bool
    method get_address : unit -> GInet_address.inet_address
    method get_family : unit -> Gio_enums.socketfamily
    method get_length : unit -> int
    method matches : #GInet_address.inet_address -> bool
    method to_string : unit -> string
    method as_inet_address_mask : Inet_address_mask.t
  end

