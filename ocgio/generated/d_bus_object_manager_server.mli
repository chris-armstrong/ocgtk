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
    {!class-type-d_bus_object_manager_server_t}. The functions it is built on
    are in {!Ocgio.Raw.D_bus_object_manager_server}. *)

(** The methods, signals and properties of a [GDBusObjectManagerServer]. *)
class type d_bus_object_manager_server_t = object
  inherit D_bus_object_manager.d_bus_object_manager_t
  method export : D_bus_object_skeleton.d_bus_object_skeleton_t -> unit
  method export_uniquely : D_bus_object_skeleton.d_bus_object_skeleton_t -> unit
  method get_connection : unit -> D_bus_connection.d_bus_connection_t option
  method is_exported : D_bus_object_skeleton.d_bus_object_skeleton_t -> bool
  method set_connection : D_bus_connection.d_bus_connection_t option -> unit
  method unexport : string -> bool
  method object_path : string
  method as_d_bus_object_manager_server : Raw.D_bus_object_manager_server.t
end

class d_bus_object_manager_server :
  Raw.D_bus_object_manager_server.t ->
  d_bus_object_manager_server_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_object_manager_server.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GDBusObjectManagerServer], give one already wrapped.
*)

val new_ : string -> d_bus_object_manager_server_t
