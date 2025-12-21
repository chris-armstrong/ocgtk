(* High-level class for InetAddressMask *)
class inet_address_mask (obj : Inet_address_mask.t) = object (self)

  method equal : 'p1. (<as_inet_address_mask: Inet_address_mask.t; ..> as 'p1) -> bool =
    fun mask2 ->
      let mask2 = mask2#as_inet_address_mask in
      (Inet_address_mask.equal obj mask2)

  method get_address : unit -> GInet_address.inet_address =
    fun () ->
      new  GInet_address.inet_address(Inet_address_mask.get_address obj)

  method get_family : unit -> Gio_enums.socketfamily =
    fun () ->
      (Inet_address_mask.get_family obj)

  method get_length : unit -> int =
    fun () ->
      (Inet_address_mask.get_length obj)

  method matches : 'p1. (#GInet_address.inet_address as 'p1) -> bool =
    fun address ->
      let address = address#as_inet_address in
      (Inet_address_mask.matches obj address)

  method to_string : unit -> string =
    fun () ->
      (Inet_address_mask.to_string obj)

    method as_inet_address_mask = obj
end

