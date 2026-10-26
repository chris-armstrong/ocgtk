class type inet_address_mask_t = object
  inherit Initable.initable_t
  method equal : inet_address_mask_t -> bool
  method get_address : unit -> Inet_address.inet_address_t
  method get_family : unit -> Enums.socketfamily
  method get_length : unit -> int
  method matches : Inet_address.inet_address_t -> bool
  method to_string : unit -> string
  method as_inet_address_mask : Raw.Inet_address_mask.t
end

class inet_address_mask : Raw.Inet_address_mask.t -> inet_address_mask_t

val new_ :
  Inet_address.inet_address_t -> int -> (inet_address_mask_t, GError.t) result

val new_from_string : string -> (inet_address_mask_t, GError.t) result
