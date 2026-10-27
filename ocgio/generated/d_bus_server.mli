(** [GDBusServer] is a helper for listening to and accepting D-Bus connections.
    This can be used to create a new D-Bus server, allowing two peers to use the
    D-Bus protocol for their own specialized communication. A server instance
    provided in this way will not perform message routing or implement the
    {{:https://dbus.freedesktop.org/doc/dbus-specification.html#message-bus-messages}
     [org.freedesktop.DBus] interface}.

    To just export an object on a well-known name on a message bus, such as the
    session or system bus, you should instead use [Gio.bus_own_name].

    An example of peer-to-peer communication with GDBus can be found in
    {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-peer.c}gdbus-example-peer.c}.

    Note that a minimal [GDBusServer] will accept connections from any peer. In
    many use-cases it will be necessary to add a [Gio.DBusAuthObserver] that
    only accepts connections that have successfully authenticated as the same
    user that is running the [GDBusServer]. Since GLib 2.68 this can be achieved
    more simply by passing the
    [G_DBUS_SERVER_FLAGS_AUTHENTICATION_REQUIRE_SAME_USER] flag to the server.

    Its methods, signals and properties are on {!class-type-d_bus_server_t}. The
    functions it is built on are in {!Ocgio.Raw.D_bus_server}. *)

(** The methods, signals and properties of a [GDBusServer]. *)
class type d_bus_server_t = object
  inherit Initable.initable_t

  method on_new_connection :
    ?after:bool ->
    callback:(connection:D_bus_connection.d_bus_connection_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method get_client_address : unit -> string
  method get_flags : unit -> Enums.dbusserverflags
  method get_guid : unit -> string
  method is_active : unit -> bool
  method start : unit -> unit
  method stop : unit -> unit
  method address : string
  method authentication_observer : D_bus_auth_observer.d_bus_auth_observer_t
  method as_d_bus_server : Raw.D_bus_server.t
end

class d_bus_server : Raw.D_bus_server.t -> d_bus_server_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_server.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GDBusServer], give one already wrapped. *)

val new_sync :
  string ->
  Enums.dbusserverflags ->
  string ->
  D_bus_auth_observer.d_bus_auth_observer_t option ->
  Cancellable.cancellable_t option ->
  (d_bus_server_t, GError.t) result
