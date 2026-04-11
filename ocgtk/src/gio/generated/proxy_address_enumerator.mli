(* GENERATED CODE - DO NOT EDIT *)
(* ProxyAddressEnumerator: ProxyAddressEnumerator *)

type t =
  [ `proxy_address_enumerator | `socket_address_enumerator | `object_ ]
  Gobject.obj

(* Methods *)
(* Properties *)

external get_default_port : t -> int
  = "ml_g_proxy_address_enumerator_get_default_port"
(** Get property: default-port *)

external get_uri : t -> string = "ml_g_proxy_address_enumerator_get_uri"
(** Get property: uri *)
