(** [GInetAddressMask] represents a range of IPv4 or IPv6 addresses described by
    a base address and a length indicating how many bits of the base address are
    relevant for matching purposes. These are often given in string form. For
    example, [10.0.0.0/8], or [fe80::/10].

    Its methods, signals and properties are on
    {!class-type-inet_address_mask_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Inet_address_mask}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [InetAddressMask].}

    [GInetAddressMask] represents a range of IPv4 or IPv6 addresses described by
    a base address and a length indicating how many bits of the base address are
    relevant for matching purposes. These are often given in string form. For
    example, [10.0.0.0/8], or [fe80::/10]. *)
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
(** Wraps a raw handle of {!Ocgio.Raw.Inet_address_mask.t}. *)

(** {1:constructors Constructors} *)

val new_ :
  Inet_address.inet_address_t -> int -> (inet_address_mask_t, GError.t) result
(** Creates a new [GInetAddressMask] representing all addresses whose first
    [length] bits match [addr]. *)

val new_from_string : string -> (inet_address_mask_t, GError.t) result
[@@ocaml.doc
  "Parses [mask_string] as an IP address and (optional) length, and\n\
   creates a new [GInetAddressMask]. The length, if present, is\n\
   delimited by a \"/\". If it is not present, then the length is\n\
   assumed to be the full length of the address."]
