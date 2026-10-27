(** [GInetAddressMask] represents a range of IPv4 or IPv6 addresses described by
    a base address and a length indicating how many bits of the base address are
    relevant for matching purposes. These are often given in string form. For
    example, [10.0.0.0/8], or [fe80::/10].

    Its methods, signals and properties are on
    {!class-type-inet_address_mask_t}. The functions it is built on are in
    {!Ocgio.Raw.Inet_address_mask}. *)

(** The methods, signals and properties of a [GInetAddressMask]. *)
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

class inet_address_mask : Raw.Inet_address_mask.t -> inet_address_mask_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Inet_address_mask.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GInetAddressMask], give one already wrapped. *)

val new_ :
  Inet_address.inet_address_t -> int -> (inet_address_mask_t, GError.t) result

val new_from_string : string -> (inet_address_mask_t, GError.t) result
