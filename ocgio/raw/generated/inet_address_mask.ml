(* GENERATED CODE - DO NOT EDIT *)
(* InetAddressMask: InetAddressMask *)

(** [GInetAddressMask] represents a range of IPv4 or IPv6 addresses described by
    a base address and a length indicating how many bits of the base address are
    relevant for matching purposes. These are often given in string form. For
    example, [10.0.0.0/8], or [fe80::/10].

    The class built on this module is in {!Ocgio.Inet_address_mask}. *)

type t = [ `inet_address_mask | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_inet_address_mask_get_type"

external new_ : Inet_address.t -> int -> (t, GError.t) result
  = "ml_g_inet_address_mask_new"
(** Creates a new {{!Ocgio.Raw.Inet_address_mask}[GInetAddressMask]}
    representing all addresses whose first [length] bits match [addr]. *)

external new_from_string : string -> (t, GError.t) result
  = "ml_g_inet_address_mask_new_from_string"
[@@ocaml.doc
  "Parses [mask_string] as an IP address and (optional) length, and\n\
   creates a new {{!Ocgio.Raw.Inet_address_mask}[GInetAddressMask]}. The \
   length, if present, is\n\
   delimited by a \"/\". If it is not present, then the length is\n\
   assumed to be the full length of the address."]

(* Methods *)

external to_string : t -> string = "ml_g_inet_address_mask_to_string"
(** Converts [mask] back to its corresponding string form. *)

external matches : t -> Inet_address.t -> bool
  = "ml_g_inet_address_mask_matches"
(** Tests if [address] falls within the range described by [mask]. *)

external get_length : t -> int = "ml_g_inet_address_mask_get_length"
(** Gets [mask]'s length *)

external get_family : t -> Ocgio_enums.socketfamily
  = "ml_g_inet_address_mask_get_family"
(** Gets the {{!Ocgio.Enums.type-socketfamily}[GSocketFamily]} of [mask]'s
    address *)

external get_address : t -> Inet_address.t
  = "ml_g_inet_address_mask_get_address"
(** Gets [mask]'s base address *)

external equal : t -> t -> bool = "ml_g_inet_address_mask_equal"
(** Tests if [mask] and [mask2] are the same mask. *)

(* Properties *)
