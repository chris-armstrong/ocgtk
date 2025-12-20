(* GENERATED CODE - DO NOT EDIT *)
(* Resolver: Resolver *)

type t = [`resolver | `object_] Gobject.obj

(* Methods *)
(** Set the timeout applied to all resolver lookups. See #GResolver:timeout. *)
external set_timeout : t -> int -> unit = "ml_g_resolver_set_timeout"

(** Sets @resolver to be the application's default resolver (reffing
@resolver, and unreffing the previous default resolver, if any).
Future calls to g_resolver_get_default() will return this resolver.

This can be used if an application wants to perform any sort of DNS
caching or "pinning"; it can implement its own #GResolver that
calls the original default resolver for DNS operations, and
implements its own cache policies on top of that, and then set
itself as the default resolver for all later code to use. *)
external set_default : t -> unit = "ml_g_resolver_set_default"

(** Synchronously reverse-resolves @address to determine its
associated hostname.

If the DNS resolution fails, @error (if non-%NULL) will be set to
a value from #GResolverError.

If @cancellable is non-%NULL, it can be used to cancel the
operation, in which case @error (if non-%NULL) will be set to
%G_IO_ERROR_CANCELLED. *)
external lookup_by_address : t -> Inet_address.t -> Cancellable.t option -> (string, GError.t) result = "ml_g_resolver_lookup_by_address"

(** Get the timeout applied to all resolver lookups. See #GResolver:timeout. *)
external get_timeout : t -> int = "ml_g_resolver_get_timeout"

(* Properties *)

