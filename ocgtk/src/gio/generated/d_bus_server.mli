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
*)

type t = [ `d_bus_server | `object_ ] Gobject.obj

external new_sync :
  string ->
  Gio_enums.dbusserverflags ->
  string ->
  D_bus_auth_observer.t option ->
  Cancellable.t option ->
  (t, GError.t) result = "ml_g_dbus_server_new_sync"
(** Create a new DBusServer *)

(* Methods *)

external stop : t -> unit = "ml_g_dbus_server_stop"
(** Stops [server]. *)

external start : t -> unit = "ml_g_dbus_server_start"
(** Starts [server]. *)

external is_active : t -> bool = "ml_g_dbus_server_is_active"
(** Gets whether [server] is active. *)

external get_guid : t -> string = "ml_g_dbus_server_get_guid"
(** Gets the GUID for [server], as provided to g_dbus_server_new_sync(). *)

external get_flags : t -> Gio_enums.dbusserverflags
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

val on_new_connection :
  ?after:bool ->
  t ->
  callback:(connection:D_bus_connection.t -> bool) ->
  Gobject.Signal.handler_id
