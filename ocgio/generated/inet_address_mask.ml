class type inet_address_mask_t = object
  inherit Initable.initable_t

  method equal : inet_address_mask_t -> bool
  (** Tests if [mask] and [mask2] are the same mask. *)

  method get_address : unit -> Inet_address.inet_address_t
  (** Gets [mask]'s base address *)

  method get_family : unit -> Enums.socketfamily
  (** Gets the [GSocketFamily] of [mask]'s address *)

  method get_length : unit -> int
  (** Gets [mask]'s length *)

  method matches : Inet_address.inet_address_t -> bool
  (** Tests if [address] falls within the range described by [mask]. *)

  method to_string : unit -> string
  (** Converts [mask] back to its corresponding string form. *)

  method as_inet_address_mask : Raw.Inet_address_mask.t
end

(* High-level class for InetAddressMask *)
class inet_address_mask (obj : Raw.Inet_address_mask.t) : inet_address_mask_t =
  object (self)
    inherit Initable.initable (Raw.Initable.from_gobject obj)

    method equal : inet_address_mask_t -> bool =
      fun mask2 ->
        let mask2 = mask2#as_inet_address_mask in
        Raw.Inet_address_mask.equal obj mask2

    method get_address : unit -> Inet_address.inet_address_t =
      fun () ->
        new Inet_address.inet_address (Raw.Inet_address_mask.get_address obj)

    method get_family : unit -> Enums.socketfamily =
      fun () -> Raw.Inet_address_mask.get_family obj

    method get_length : unit -> int =
      fun () -> Raw.Inet_address_mask.get_length obj

    method matches : Inet_address.inet_address_t -> bool =
      fun address ->
        let address = address#as_inet_address in
        Raw.Inet_address_mask.matches obj address

    method to_string : unit -> string =
      fun () -> Raw.Inet_address_mask.to_string obj

    method as_inet_address_mask = obj
  end

let new_ (addr : Inet_address.inet_address_t) (length : int) :
    (inet_address_mask_t, GError.t) result =
  let addr = addr#as_inet_address in
  let obj_ = Raw.Inet_address_mask.new_ addr length in
  Result.map (fun obj_ -> new inet_address_mask obj_) obj_

let new_from_string (mask_string : string) :
    (inet_address_mask_t, GError.t) result =
  let obj_ = Raw.Inet_address_mask.new_from_string mask_string in
  Result.map (fun obj_ -> new inet_address_mask obj_) obj_
