(** A single target host/port that a network service is running on.

    SRV (service) records are used by some network protocols to provide
    service-specific aliasing and load-balancing. For example, XMPP (Jabber)
    uses SRV records to locate the XMPP server for a domain; rather than
    connecting directly to ‘example.com’ or assuming a specific server hostname
    like ‘xmpp.example.com’, an XMPP client would look up the [xmpp-client] SRV
    record for ‘example.com’, and then connect to whatever host was pointed to
    by that record.

    You can use [Gio.Resolver.lookup_service] or
    [Gio.Resolver.lookup_service_async] to find the [GSrvTarget]s for a given
    service. However, if you are simply planning to connect to the remote
    service, you can use [Gio.NetworkService]’s [Gio.SocketConnectable]
    interface and not need to worry about [GSrvTarget] at all.

    Its methods, signals and properties are on {!class-type-srv_target_t}. The
    functions it is built on are in {!Ocgio.Raw.Srv_target}. *)

(** The methods, signals and properties of a [GSrvTarget]. *)
class type srv_target_t = object
  method get_hostname : unit -> string
  method get_port : unit -> UInt16.t
  method get_priority : unit -> UInt16.t
  method get_weight : unit -> UInt16.t
  method as_srv_target : Raw.Srv_target.t
end

class srv_target : Raw.Srv_target.t -> srv_target_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Srv_target.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GSrvTarget], give one already wrapped. *)

val new_ : string -> UInt16.t -> UInt16.t -> UInt16.t -> srv_target_t
