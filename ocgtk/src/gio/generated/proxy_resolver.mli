(* GENERATED CODE - DO NOT EDIT *)
(* ProxyResolver: ProxyResolver *)

type t = [`proxy_resolver] Gobject.obj

(* Methods *)
(** Checks if @resolver can be used on this system. (This is used
internally; g_proxy_resolver_get_default() will only return a proxy
resolver that returns %TRUE for this method.) *)
external is_supported : t -> bool = "ml_g_proxy_resolver_is_supported"

