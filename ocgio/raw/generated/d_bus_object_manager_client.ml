(* GENERATED CODE - DO NOT EDIT *)
(* DBusObjectManagerClient: DBusObjectManagerClient *)

(** [GDBusObjectManagerClient] is used to create, monitor and delete object
    proxies for remote objects exported by a
    {{!Ocgio.Raw.D_bus_object_manager_server}[Gio.DBusObjectManagerServer]} (or
    any code implementing the org.freedesktop.DBus.ObjectManager interface).

    Once an instance of this type has been created, you can connect to the
    {{!Ocgio.Raw.D_bus_object_manager.val-on_object_added}[Gio.DBusObjectManager::object-added]}
    and \[signal@Gio.DBusObjectManager::object-removed signals\] and inspect the
    {{!Ocgio.Raw.D_bus_object_proxy}[Gio.DBusObjectProxy]} objects returned by
    {{!Ocgio.Raw.D_bus_object_manager.val-get_objects}[Gio.DBusObjectManager.get_objects]}.

    If the name for a [GDBusObjectManagerClient] is not owned by anyone at
    object construction time, the default behavior is to request the message bus
    to launch an owner for the name. This behavior can be disabled using the
    [G_DBUS_OBJECT_MANAGER_CLIENT_FLAGS_DO_NOT_AUTO_START] flag. It’s also worth
    noting that this only works if the name of interest is activatable in the
    first place. E.g. in some cases it is not possible to launch an owner for
    the requested name. In this case, [GDBusObjectManagerClient] object
    construction still succeeds but there will be no object proxies (e.g.
    {{!Ocgio.Raw.D_bus_object_manager.val-get_objects}[Gio.DBusObjectManager.get_objects]}
    returns the empty list) and the
    {{!Ocgio.Raw.D_bus_object_manager_client.val-get_name_owner}[Gio.DBusObjectManagerClient:name-owner]}
    property is [None].

    The owner of the requested name can come and go (for example consider a
    system service being restarted) – [GDBusObjectManagerClient] handles this
    case too; simply connect to the [GObject.Object::notify] signal to watch for
    changes on the
    {{!Ocgio.Raw.D_bus_object_manager_client.val-get_name_owner}[Gio.DBusObjectManagerClient:name-owner]}
    property. When the name owner vanishes, the behavior is that
    {{!Ocgio.Raw.D_bus_object_manager_client.val-get_name_owner}[Gio.DBusObjectManagerClient:name-owner]}
    is set to [None] (this includes emission of the [GObject.Object::notify]
    signal) and then
    {{!Ocgio.Raw.D_bus_object_manager.val-on_object_removed}[Gio.DBusObjectManager::object-removed]}
    signals are synthesized for all currently existing object proxies. Since
    {{!Ocgio.Raw.D_bus_object_manager_client.val-get_name_owner}[Gio.DBusObjectManagerClient:name-owner]}
    is [None] when this happens, you can use this information to disambiguate a
    synthesized signal from a genuine signal caused by object removal on the
    remote {{!Ocgio.Raw.D_bus_object_manager}[Gio.DBusObjectManager]}.
    Similarly, when a new name owner appears,
    {{!Ocgio.Raw.D_bus_object_manager.val-on_object_added}[Gio.DBusObjectManager::object-added]}
    signals are synthesized while
    {{!Ocgio.Raw.D_bus_object_manager_client.val-get_name_owner}[Gio.DBusObjectManagerClient:name-owner]}
    is still [None]. Only when all object proxies have been added, the
    {{!Ocgio.Raw.D_bus_object_manager_client.val-get_name_owner}[Gio.DBusObjectManagerClient:name-owner]}
    is set to the new name owner (this includes emission of the
    [GObject.Object::notify] signal). Furthermore, you are guaranteed that
    {{!Ocgio.Raw.D_bus_object_manager_client.val-get_name_owner}[Gio.DBusObjectManagerClient:name-owner]}
    will alternate between a name owner (e.g. [:1.42]) and [None] even in the
    case where the name of interest is atomically replaced

    Ultimately, [GDBusObjectManagerClient] is used to obtain
    {{!Ocgio.Raw.D_bus_proxy}[Gio.DBusProxy]} instances. All signals (including
    the [org.freedesktop.DBus.Properties::PropertiesChanged] signal) delivered
    to {{!Ocgio.Raw.D_bus_proxy}[Gio.DBusProxy]} instances are guaranteed to
    originate from the name owner. This guarantee along with the behavior
    described above, means that certain race conditions including the “half the
    proxy is from the old owner and the other half is from the new owner”
    problem cannot happen.

    To avoid having the application connect to signals on the returned
    {{!Ocgio.Raw.D_bus_object_proxy}[Gio.DBusObjectProxy]} and
    {{!Ocgio.Raw.D_bus_proxy}[Gio.DBusProxy]} objects, the
    {{!Ocgio.Raw.D_bus_object.val-on_interface_added}[Gio.DBusObject::interface-added]},
    {{!Ocgio.Raw.D_bus_object.val-on_interface_removed}[Gio.DBusObject::interface-removed]},
    [Gio.DBusProxy::g-properties-changed] and
    {{!Ocgio.Raw.D_bus_proxy.val-on_g_signal}[Gio.DBusProxy::g-signal]} signals
    are also emitted on the [GDBusObjectManagerClient] instance managing these
    objects. The signals emitted are
    {{!Ocgio.Raw.D_bus_object_manager.val-on_interface_added}[Gio.DBusObjectManager::interface-added]},
    {{!Ocgio.Raw.D_bus_object_manager.val-on_interface_removed}[Gio.DBusObjectManager::interface-removed]},
    [Gio.DBusObjectManagerClient::interface-proxy-properties-changed] and
    {{!Ocgio.Raw.D_bus_object_manager_client.val-on_interface_proxy_signal}[Gio.DBusObjectManagerClient::interface-proxy-signal]}.

    Note that all callbacks and signals are emitted in the thread-default main
    context (see [GLib.MainContext.push_thread_default]) that the
    [GDBusObjectManagerClient] object was constructed in. Additionally, the
    {{!Ocgio.Raw.D_bus_object_proxy}[Gio.DBusObjectProxy]} and
    {{!Ocgio.Raw.D_bus_proxy}[Gio.DBusProxy]} objects originating from the
    [GDBusObjectManagerClient] object will be created in the same context and,
    consequently, will deliver signals in the same main loop.

    The class built on this module is in {!Ocgio.D_bus_object_manager_client}.
*)

type t = [ `d_bus_object_manager_client | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gio_d_bus_object_manager_client_get_type"

external new_finish : Async_result.t -> (t, GError.t) result
  = "ml_g_dbus_object_manager_client_new_finish"
(** Finishes an operation started with g_dbus_object_manager_client_new(). *)

external new_for_bus_finish : Async_result.t -> (t, GError.t) result
  = "ml_g_dbus_object_manager_client_new_for_bus_finish"
(** Finishes an operation started with
    g_dbus_object_manager_client_new_for_bus(). *)

(* Methods *)

external get_name_owner : t -> string option
  = "ml_g_dbus_object_manager_client_get_name_owner"
(** The unique name that owns the name that [manager] is for or [None] if no-one
    currently owns that name. You can connect to the [GObject::notify] signal to
    track changes to the [GDBusObjectManagerClient:name]-owner property. *)

external get_name : t -> string = "ml_g_dbus_object_manager_client_get_name"
(** Gets the name that [manager] is for, or [None] if not a message bus
    connection. *)

external get_flags : t -> Ocgio_enums.dbusobjectmanagerclientflags
  = "ml_g_dbus_object_manager_client_get_flags"
(** Gets the flags that [manager] was constructed with. *)

external get_connection : t -> D_bus_connection.t
  = "ml_g_dbus_object_manager_client_get_connection"
(** Gets the [GDBusConnection] used by [manager]. *)

(* Properties *)

external get_object_path : t -> string
  = "ml_g_d_bus_object_manager_client_get_object_path"
(** The object path the manager is for. *)

let on_interface_proxy_signal ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let object_proxy =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_object_exn v (D_bus_object_proxy.gtype ())
        in
        let interface_proxy =
          let v = Gobject.Closure.nth argv ~pos:2 in
          Gobject.Value.get_object_exn v (D_bus_proxy.gtype ())
        in
        let sender_name =
          let v = Gobject.Closure.nth argv ~pos:3 in
          Gobject.Value.get_string v
        in
        let signal_name =
          let v = Gobject.Closure.nth argv ~pos:4 in
          Gobject.Value.get_string v
        in
        let parameters =
          let v = Gobject.Closure.nth argv ~pos:5 in
          Gobject.Value.get_variant v
        in
        callback ~object_proxy ~interface_proxy ~sender_name ~signal_name
          ~parameters)
  in
  Gobject.Signal.connect obj ~name:"interface-proxy-signal" ~callback:closure
    ~after:(Option.value after ~default:false)
