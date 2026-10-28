(** [GDBusObjectManagerServer] is used to export [Gio.DBusObject] instances
    using the standardized [org.freedesktop.DBus.ObjectManager] interface. For
    example, remote D-Bus clients can get all objects and properties in a single
    call. Additionally, any change in the object hierarchy is broadcast using
    signals. This means that D-Bus clients can keep caches up to date by only
    listening to D-Bus signals.

    The recommended path to export an object manager at is the path form of the
    well-known name of a D-Bus service, or below. For example, if a D-Bus
    service is available at the well-known name [net.example.ExampleService1],
    the object manager should typically be exported at
    [/net/example/ExampleService1], or below (to allow for multiple object
    managers in a service).

    It is supported, but not recommended, to export an object manager at the
    root path, [/].

    See [Gio.DBusObjectManagerClient] for the client-side code that is intended
    to be used with [GDBusObjectManagerServer] or any D-Bus object implementing
    the [org.freedesktop.DBus.ObjectManager] interface.

    Its methods, signals and properties are on
    {!class-type-d_bus_object_manager_server_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_object_manager_server}. *)

(** {b The methods, signals and properties of a [DBusObjectManagerServer].}

    [GDBusObjectManagerServer] is used to export [Gio.DBusObject] instances
    using the standardized [org.freedesktop.DBus.ObjectManager] interface. For
    example, remote D-Bus clients can get all objects and properties in a single
    call. Additionally, any change in the object hierarchy is broadcast using
    signals. This means that D-Bus clients can keep caches up to date by only
    listening to D-Bus signals.

    The recommended path to export an object manager at is the path form of the
    well-known name of a D-Bus service, or below. For example, if a D-Bus
    service is available at the well-known name [net.example.ExampleService1],
    the object manager should typically be exported at
    [/net/example/ExampleService1], or below (to allow for multiple object
    managers in a service).

    It is supported, but not recommended, to export an object manager at the
    root path, [/].

    See [Gio.DBusObjectManagerClient] for the client-side code that is intended
    to be used with [GDBusObjectManagerServer] or any D-Bus object implementing
    the [org.freedesktop.DBus.ObjectManager] interface. *)
class type d_bus_object_manager_server_t = object
  inherit D_bus_object_manager.d_bus_object_manager_t

  method export : D_bus_object_skeleton.d_bus_object_skeleton_t -> unit
  (** Exports [object] on [manager].

      If there is already a [GDBusObject] exported at the object path, then the
      old object is removed.

      The object path for [object] must be in the hierarchy rooted by the object
      path for [manager].

      Note that [manager] will take a reference on [object] for as long as it is
      exported. *)

  method export_uniquely : D_bus_object_skeleton.d_bus_object_skeleton_t -> unit
  (** Like g_dbus_object_manager_server_export() but appends a string of the
      form _N (with N being a natural number) to [object]'s object path if an
      object with the given path already exists. As such, the
      [GDBusObjectProxy:g]-object-path property of [object] may be modified. *)

  method get_connection : unit -> D_bus_connection.d_bus_connection_t option
  (** Gets the [GDBusConnection] used by [manager]. *)

  method is_exported : D_bus_object_skeleton.d_bus_object_skeleton_t -> bool
  (** Returns whether [object] is currently exported on [manager]. *)

  method set_connection : D_bus_connection.d_bus_connection_t option -> unit
  (** Exports all objects managed by [manager] on [connection]. If [connection]
      is [NULL], stops exporting objects. *)

  method unexport : string -> bool
  (** If [manager] has an object at [path], removes the object. Otherwise does
      nothing.

      Note that [object_path] must be in the hierarchy rooted by the object path
      for [manager]. *)

  method object_path : string
  (** The object path to register the manager object at. *)

  method as_d_bus_object_manager_server : Raw.D_bus_object_manager_server.t
end

class d_bus_object_manager_server :
  Raw.D_bus_object_manager_server.t ->
  d_bus_object_manager_server_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_object_manager_server.t}. *)

(** {2:constructors Constructors} *)

val new_ : string -> d_bus_object_manager_server_t
(** Creates a new [GDBusObjectManagerServer] object.

    The returned server isn't yet exported on any connection. To do so, use
    g_dbus_object_manager_server_set_connection(). Normally you want to export
    all of your objects before doing so to avoid InterfacesAdded signals being
    emitted. *)
