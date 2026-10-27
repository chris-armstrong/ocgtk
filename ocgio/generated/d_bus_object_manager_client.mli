(** [GDBusObjectManagerClient] is used to create, monitor and delete object
    proxies for remote objects exported by a [Gio.DBusObjectManagerServer] (or
    any code implementing the org.freedesktop.DBus.ObjectManager interface).

    Once an instance of this type has been created, you can connect to the
    [Gio.DBusObjectManager::object-added] and
    [Gio.DBusObjectManager::object-removed signals] and inspect the
    [Gio.DBusObjectProxy] objects returned by
    [Gio.DBusObjectManager.get_objects].

    If the name for a [GDBusObjectManagerClient] is not owned by anyone at
    object construction time, the default behavior is to request the message bus
    to launch an owner for the name. This behavior can be disabled using the
    [G_DBUS_OBJECT_MANAGER_CLIENT_FLAGS_DO_NOT_AUTO_START] flag. It’s also worth
    noting that this only works if the name of interest is activatable in the
    first place. E.g. in some cases it is not possible to launch an owner for
    the requested name. In this case, [GDBusObjectManagerClient] object
    construction still succeeds but there will be no object proxies (e.g.
    [Gio.DBusObjectManager.get_objects] returns the empty list) and the
    [Gio.DBusObjectManagerClient:name-owner] property is [NULL].

    The owner of the requested name can come and go (for example consider a
    system service being restarted) – [GDBusObjectManagerClient] handles this
    case too; simply connect to the [GObject.Object::notify] signal to watch for
    changes on the [Gio.DBusObjectManagerClient:name-owner] property. When the
    name owner vanishes, the behavior is that
    [Gio.DBusObjectManagerClient:name-owner] is set to [NULL] (this includes
    emission of the [GObject.Object::notify] signal) and then
    [Gio.DBusObjectManager::object-removed] signals are synthesized for all
    currently existing object proxies. Since
    [Gio.DBusObjectManagerClient:name-owner] is [NULL] when this happens, you
    can use this information to disambiguate a synthesized signal from a genuine
    signal caused by object removal on the remote [Gio.DBusObjectManager].
    Similarly, when a new name owner appears,
    [Gio.DBusObjectManager::object-added] signals are synthesized while
    [Gio.DBusObjectManagerClient:name-owner] is still [NULL]. Only when all
    object proxies have been added, the [Gio.DBusObjectManagerClient:name-owner]
    is set to the new name owner (this includes emission of the
    [GObject.Object::notify] signal). Furthermore, you are guaranteed that
    [Gio.DBusObjectManagerClient:name-owner] will alternate between a name owner
    (e.g. [:1.42]) and [NULL] even in the case where the name of interest is
    atomically replaced

    Ultimately, [GDBusObjectManagerClient] is used to obtain [Gio.DBusProxy]
    instances. All signals (including the
    [org.freedesktop.DBus.Properties::PropertiesChanged] signal) delivered to
    [Gio.DBusProxy] instances are guaranteed to originate from the name owner.
    This guarantee along with the behavior described above, means that certain
    race conditions including the “half the proxy is from the old owner and the
    other half is from the new owner” problem cannot happen.

    To avoid having the application connect to signals on the returned
    [Gio.DBusObjectProxy] and [Gio.DBusProxy] objects, the
    [Gio.DBusObject::interface-added], [Gio.DBusObject::interface-removed],
    [Gio.DBusProxy::g-properties-changed] and [Gio.DBusProxy::g-signal] signals
    are also emitted on the [GDBusObjectManagerClient] instance managing these
    objects. The signals emitted are [Gio.DBusObjectManager::interface-added],
    [Gio.DBusObjectManager::interface-removed],
    [Gio.DBusObjectManagerClient::interface-proxy-properties-changed] and
    [Gio.DBusObjectManagerClient::interface-proxy-signal].

    Note that all callbacks and signals are emitted in the thread-default main
    context (see [GLib.MainContext.push_thread_default]) that the
    [GDBusObjectManagerClient] object was constructed in. Additionally, the
    [Gio.DBusObjectProxy] and [Gio.DBusProxy] objects originating from the
    [GDBusObjectManagerClient] object will be created in the same context and,
    consequently, will deliver signals in the same main loop.

    Its methods, signals and properties are on
    {!class-type-d_bus_object_manager_client_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_object_manager_client}. *)

(** The methods, signals and properties of a [GDBusObjectManagerClient]. *)
class type d_bus_object_manager_client_t = object
  inherit Async_initable.async_initable_t
  inherit D_bus_object_manager.d_bus_object_manager_t
  inherit Initable.initable_t

  method on_interface_proxy_signal :
    ?after:bool ->
    callback:
      (object_proxy:D_bus_object_proxy.d_bus_object_proxy_t ->
      interface_proxy:D_bus_proxy.d_bus_proxy_t ->
      sender_name:string ->
      signal_name:string ->
      parameters:Gvariant.t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a D-Bus signal is received on [interface_proxy].

      This signal exists purely as a convenience to avoid having to connect
      signals to all interface proxies managed by [manager].

      This signal is emitted in the thread-default main context (see
      [GLib.MainContext.push_thread_default]) that [manager] was constructed in.
  *)

  method get_connection : unit -> D_bus_connection.d_bus_connection_t
  (** Gets the [GDBusConnection] used by [manager]. *)

  method get_flags : unit -> Enums.dbusobjectmanagerclientflags
  (** Gets the flags that [manager] was constructed with. *)

  method get_name : unit -> string
  (** Gets the name that [manager] is for, or [NULL] if not a message bus
      connection. *)

  method get_name_owner : unit -> string option
  (** The unique name that owns the name that [manager] is for or [NULL] if
      no-one currently owns that name. You can connect to the [GObject::notify]
      signal to track changes to the [GDBusObjectManagerClient:name]-owner
      property. *)

  method object_path : string
  method as_d_bus_object_manager_client : Raw.D_bus_object_manager_client.t
end

class d_bus_object_manager_client :
  Raw.D_bus_object_manager_client.t ->
  d_bus_object_manager_client_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_object_manager_client.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GDBusObjectManagerClient], give one already wrapped.
*)

(** {2:constructors Constructors} *)

val new_finish :
  Async_result.async_result_t ->
  (d_bus_object_manager_client_t, GError.t) result
(** Finishes an operation started with g_dbus_object_manager_client_new(). *)

val new_for_bus_finish :
  Async_result.async_result_t ->
  (d_bus_object_manager_client_t, GError.t) result
(** Finishes an operation started with
    g_dbus_object_manager_client_new_for_bus(). *)
