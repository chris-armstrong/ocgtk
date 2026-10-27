(* GENERATED CODE - DO NOT EDIT *)
(* DBusServer: DBusServer *)

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

    The class built on this module is in {!Ocgio.D_bus_server}. *)

type t = [ `d_bus_server | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_d_bus_server_get_type"

external new_sync :
  string ->
  Ocgio_enums.dbusserverflags ->
  string ->
  D_bus_auth_observer.t option ->
  Cancellable.t option ->
  (t, GError.t) result = "ml_g_dbus_server_new_sync"
(** Creates a new D-Bus server that listens on the first address in [address]
    that works.

    Once constructed, you can use g_dbus_server_get_client_address() to get a
    D-Bus address string that clients can use to connect.

    To have control over the available authentication mechanisms and the users
    that are authorized to connect, it is strongly recommended to provide a
    non-[NULL] [GDBusAuthObserver].

    Connect to the [GDBusServer::new]-connection signal to handle incoming
    connections.

    The returned [GDBusServer] isn't active - you have to start it with
    g_dbus_server_start().

    [GDBusServer] is used in this
    {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-peer.c}example}.

    This is a synchronous failable constructor. There is currently no
    asynchronous version. *)

(* Methods *)

external stop : t -> unit = "ml_g_dbus_server_stop"
(** Stops [server]. *)

external start : t -> unit = "ml_g_dbus_server_start"
(** Starts [server]. *)

external is_active : t -> bool = "ml_g_dbus_server_is_active"
(** Gets whether [server] is active. *)

external get_guid : t -> string = "ml_g_dbus_server_get_guid"
(** Gets the GUID for [server], as provided to g_dbus_server_new_sync(). *)

external get_flags : t -> Ocgio_enums.dbusserverflags
  = "ml_g_dbus_server_get_flags"
(** Gets the flags for [server]. *)

external get_client_address : t -> string
  = "ml_g_dbus_server_get_client_address"
(** Gets a
    {{:https://dbus.freedesktop.org/doc/dbus-specification.html#addresses}D-Bus
     address} string that can be used by clients to connect to [server].

    This is valid and non-empty if initializing the [GDBusServer] succeeded. *)

(* Properties *)

external get_address : t -> string = "ml_g_d_bus_server_get_address"
(** Get property: address *)

external get_authentication_observer : t -> D_bus_auth_observer.t
  = "ml_g_d_bus_server_get_authentication_observer"
(** Get property: authentication-observer *)

let on_new_connection ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let connection =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_object_exn v (D_bus_connection.gtype ())
        in
        let result = callback ~connection in
        let v = Gobject.Closure.result argv in
        let x = result in
        Gobject.Value.set_boolean v x)
  in
  Gobject.Signal.connect obj ~name:"new-connection" ~callback:closure
    ~after:(Option.value after ~default:false)
