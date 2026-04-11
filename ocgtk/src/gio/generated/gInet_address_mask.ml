class type inet_address_mask_t = object
    inherit GInitable.initable_t
    method equal : inet_address_mask_t -> bool
    method get_address : unit -> GInet_address.inet_address_t
    method get_family : unit -> Gio_enums.socketfamily
    method get_length : unit -> int
    method matches : GInet_address.inet_address_t -> bool
    method to_string : unit -> string
    method as_inet_address_mask : Inet_address_mask.t
end

(* High-level class for InetAddressMask *)
class inet_address_mask (obj : Inet_address_mask.t) : inet_address_mask_t = object (self)
  inherit GInitable.initable (Initable.from_gobject obj)

  method equal : inet_address_mask_t -> bool =
    fun mask2 ->
      let mask2 = mask2#as_inet_address_mask in
      (Inet_address_mask.equal obj mask2)

  method get_address : unit -> GInet_address.inet_address_t =
    fun () ->
      new  GInet_address.inet_address(Inet_address_mask.get_address obj)

  method get_family : unit -> Gio_enums.socketfamily =
    fun () ->
      (Inet_address_mask.get_family obj)

  method get_length : unit -> int =
    fun () ->
      (Inet_address_mask.get_length obj)

  method matches : GInet_address.inet_address_t -> bool =
    fun address ->
      let address = address#as_inet_address in
      (Inet_address_mask.matches obj address)

  method to_string : unit -> string =
    fun () ->
      (Inet_address_mask.to_string obj)

    method as_inet_address_mask = obj
end

let new_ (addr : GInet_address.inet_address_t) (length : int) : (inet_address_mask_t, GError.t) result =
  let addr = addr#as_inet_address in
  let obj_ = Inet_address_mask.new_ addr length in
Result.map (fun obj_ ->  new inet_address_mask obj_) obj_

let new_from_string (mask_string : string) : (inet_address_mask_t, GError.t) result =
  let obj_ = Inet_address_mask.new_from_string mask_string in
Result.map (fun obj_ ->  new inet_address_mask obj_) obj_

