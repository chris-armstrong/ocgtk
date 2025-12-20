(* GENERATED CODE - DO NOT EDIT *)
(* SrvTarget: SrvTarget *)

(** A single target host/port that a network service is running on.

SRV (service) records are used by some network protocols to provide
service-specific aliasing and load-balancing. For example, XMPP
(Jabber) uses SRV records to locate the XMPP server for a domain;
rather than connecting directly to ‘example.com’ or assuming a
specific server hostname like ‘xmpp.example.com’, an XMPP client
would look up the `xmpp-client` SRV record for ‘example.com’, and
then connect to whatever host was pointed to by that record.

You can use [method@Gio.Resolver.lookup_service] or
[method@Gio.Resolver.lookup_service_async] to find the `GSrvTarget`s
for a given service. However, if you are simply planning to connect
to the remote service, you can use [class@Gio.NetworkService]’s
[iface@Gio.SocketConnectable] interface and not need to worry about
`GSrvTarget` at all. *)
type t = [`srv_target] Gobject.obj

(** Create a new SrvTarget *)
external new_ : string -> unit -> unit -> unit -> t = "ml_g_srv_target_new"

(* Methods *)
(** Gets @target's hostname (in ASCII form; if you are going to present
this to the user, you should use g_hostname_is_ascii_encoded() to
check if it contains encoded Unicode segments, and use
g_hostname_to_unicode() to convert it if it does.) *)
external get_hostname : t -> string = "ml_g_srv_target_get_hostname"

(** Frees @target *)
external free : t -> unit = "ml_g_srv_target_free"

(** Copies @target *)
external copy : t -> t = "ml_g_srv_target_copy"

