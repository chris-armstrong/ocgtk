(** [GDBusServer] is a helper for listening to and accepting D-Bus connections.
    This can be used to create a new D-Bus server, allowing two peers to use the
    D-Bus protocol for their own specialized communication. A server instance
    provided in this way will not perform message routing or implement the
    {{:https://dbus.freedesktop.org/doc/dbus-specification.html#message-bus-messages}
     [org.freedesktop.DBus] interface}.

    Its methods, signals and properties are on {!class-type-d_bus_server_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_server}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DBusServer].}

    Implements:
    - {{!Ocgio.Initable.class-type-initable_t}Ocgio.Initable}

    [GDBusServer] is a helper for listening to and accepting D-Bus connections.
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
    many use-cases it will be necessary to add a
    {{!Ocgio.D_bus_auth_observer.class-type-d_bus_auth_observer_t}[Gio.DBusAuthObserver]}
    that only accepts connections that have successfully authenticated as the
    same user that is running the [GDBusServer]. Since GLib 2.68 this can be
    achieved more simply by passing the
    [G_DBUS_SERVER_FLAGS_AUTHENTICATION_REQUIRE_SAME_USER] flag to the server.
*)
class type d_bus_server_t = object
  inherit Initable.initable_t

  (** {2:signals Signals} *)

  method on_new_connection :
    ?after:bool ->
    callback:(connection:D_bus_connection.d_bus_connection_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a new authenticated connection has been made. Use
      g_dbus_connection_get_peer_credentials() to figure out what identity (if
      any), was authenticated.

      If you want to accept the connection, take a reference to the [connection]
      object and return [true]. When you are done with the connection call
      g_dbus_connection_close() and give up your reference. Note that the other
      peer may disconnect at any time - a typical thing to do when accepting a
      connection is to listen to the [GDBusConnection::closed] signal.

      If [GDBusServer:flags] contains [G_DBUS_SERVER_FLAGS_RUN_IN_THREAD] then
      the signal is emitted in a new thread dedicated to the connection.
      Otherwise the signal is emitted in the thread-default main context (see
      [GLib.MainContext.push_thread_default]) of the thread that [server] was
      constructed in.

      You are guaranteed that signal handlers for this signal runs before
      incoming messages on [connection] are processed. This means that it's
      suitable to call g_dbus_connection_register_object() or similar from the
      signal handler. *)

  (** {2:methods Methods} *)

  method get_client_address : unit -> string
  (** Gets a
      {{:https://dbus.freedesktop.org/doc/dbus-specification.html#addresses}D-Bus
       address} string that can be used by clients to connect to [server].

      This is valid and non-empty if initializing the [GDBusServer] succeeded.
  *)

  method get_flags : unit -> Enums.dbusserverflags
  (** Gets the flags for [server]. *)

  method get_guid : unit -> string
  (** Gets the GUID for [server], as provided to g_dbus_server_new_sync(). *)

  method is_active : unit -> bool
  (** Gets whether [server] is active. *)

  method start : unit -> unit
  (** Starts [server]. *)

  method stop : unit -> unit
  (** Stops [server]. *)

  (** {2:properties Properties} *)

  method address : string
  (** The D-Bus address to listen on. *)

  method authentication_observer : D_bus_auth_observer.d_bus_auth_observer_t
  (** A [GDBusAuthObserver] object to assist in the authentication process or
      [None]. *)

  (** {2:conversions Conversions} *)

  method as_d_bus_server : Raw.D_bus_server.t
end

class d_bus_server : Raw.D_bus_server.t -> d_bus_server_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_server.t}. *)

(** {1:description Description}

    [GDBusServer] is a helper for listening to and accepting D-Bus connections.
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
    many use-cases it will be necessary to add a
    {{!Ocgio.D_bus_auth_observer.class-type-d_bus_auth_observer_t}[Gio.DBusAuthObserver]}
    that only accepts connections that have successfully authenticated as the
    same user that is running the [GDBusServer]. Since GLib 2.68 this can be
    achieved more simply by passing the
    [G_DBUS_SERVER_FLAGS_AUTHENTICATION_REQUIRE_SAME_USER] flag to the server.
*)

(** {1:constructors Constructors} *)

val new_sync :
  string ->
  Enums.dbusserverflags ->
  string ->
  D_bus_auth_observer.d_bus_auth_observer_t option ->
  Cancellable.cancellable_t option ->
  (d_bus_server_t, GError.t) result
(** Creates a new D-Bus server that listens on the first address in [address]
    that works.

    Once constructed, you can use g_dbus_server_get_client_address() to get a
    D-Bus address string that clients can use to connect.

    To have control over the available authentication mechanisms and the users
    that are authorized to connect, it is strongly recommended to provide a
    non-[None] [GDBusAuthObserver].

    Connect to the [GDBusServer::new]-connection signal to handle incoming
    connections.

    The returned [GDBusServer] isn't active - you have to start it with
    g_dbus_server_start().

    [GDBusServer] is used in this
    {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-peer.c}example}.

    This is a synchronous failable constructor. There is currently no
    asynchronous version. *)
