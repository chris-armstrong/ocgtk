(* GENERATED CODE - DO NOT EDIT *)
(* DBusInterfaceSkeleton: DBusInterfaceSkeleton *)

type t = [`d_bus_interface_skeleton | `object_] Gobject.obj

(* Methods *)
(** Stops exporting @interface_ on @connection.

To stop exporting on all connections the interface is exported on,
use g_dbus_interface_skeleton_unexport(). *)
external unexport_from_connection : t -> D_bus_connection.t -> unit = "ml_g_dbus_interface_skeleton_unexport_from_connection"

(** Stops exporting @interface_ on all connections it is exported on.

To unexport @interface_ from only a single connection, use
g_dbus_interface_skeleton_unexport_from_connection() *)
external unexport : t -> unit = "ml_g_dbus_interface_skeleton_unexport"

(** Checks if @interface_ is exported on @connection. *)
external has_connection : t -> D_bus_connection.t -> bool = "ml_g_dbus_interface_skeleton_has_connection"

(** Gets the object path that @interface_ is exported on, if any. *)
external get_object_path : t -> string option = "ml_g_dbus_interface_skeleton_get_object_path"

(** Gets D-Bus introspection information for the D-Bus interface
implemented by @interface_. *)
external get_info : t -> D_bus_interface_info.t = "ml_g_dbus_interface_skeleton_get_info"

(** Gets the first connection that @interface_ is exported on, if any. *)
external get_connection : t -> D_bus_connection.t option = "ml_g_dbus_interface_skeleton_get_connection"

(** If @interface_ has outstanding changes, request for these changes to be
emitted immediately.

For example, an exported D-Bus interface may queue up property
changes and emit the
`org.freedesktop.DBus.Properties.PropertiesChanged`
signal later (e.g. in an idle handler). This technique is useful
for collapsing multiple property changes into one. *)
external flush : t -> unit = "ml_g_dbus_interface_skeleton_flush"

(** Exports @interface_ at @object_path on @connection.

This can be called multiple times to export the same @interface_
onto multiple connections however the @object_path provided must be
the same for all connections.

Use g_dbus_interface_skeleton_unexport() to unexport the object. *)
external export : t -> D_bus_connection.t -> string -> (bool, GError.t) result = "ml_g_dbus_interface_skeleton_export"

(* Properties *)

