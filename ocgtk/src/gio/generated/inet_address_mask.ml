(* GENERATED CODE - DO NOT EDIT *)
(* InetAddressMask: InetAddressMask *)

type t = [`inet_address_mask | `object_] Gobject.obj

(** Create a new InetAddressMask *)
external new_ : Inet_address.t -> int -> (t, GError.t) result = "ml_g_inet_address_mask_new"

(** Create a new InetAddressMask *)
external new_from_string : string -> (t, GError.t) result = "ml_g_inet_address_mask_new_from_string"

(* Methods *)
(** Converts @mask back to its corresponding string form. *)
external to_string : t -> string = "ml_g_inet_address_mask_to_string"

(** Tests if @address falls within the range described by @mask. *)
external matches : t -> Inet_address.t -> bool = "ml_g_inet_address_mask_matches"

(** Gets @mask's length *)
external get_length : t -> int = "ml_g_inet_address_mask_get_length"

(** Gets the #GSocketFamily of @mask's address *)
external get_family : t -> Gio_enums.socketfamily = "ml_g_inet_address_mask_get_family"

(** Gets @mask's base address *)
external get_address : t -> Inet_address.t = "ml_g_inet_address_mask_get_address"

(** Tests if @mask and @mask2 are the same mask. *)
external equal : t -> t -> bool = "ml_g_inet_address_mask_equal"

(* Properties *)

