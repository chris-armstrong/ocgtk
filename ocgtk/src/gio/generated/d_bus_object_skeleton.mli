(* GENERATED CODE - DO NOT EDIT *)
(* DBusObjectSkeleton: DBusObjectSkeleton *)

type t = [`d_bus_object_skeleton | `object_] Gobject.obj

(** Create a new DBusObjectSkeleton *)
external new_ : string -> t = "ml_g_dbus_object_skeleton_new"

(* Methods *)
(** Sets the object path for @object. *)
external set_object_path : t -> string -> unit = "ml_g_dbus_object_skeleton_set_object_path"

(** Removes the #GDBusInterface with @interface_name from @object.

If no D-Bus interface of the given interface exists, this function
does nothing. *)
external remove_interface_by_name : t -> string -> unit = "ml_g_dbus_object_skeleton_remove_interface_by_name"

(** Removes @interface_ from @object. *)
external remove_interface : t -> D_bus_interface_skeleton.t -> unit = "ml_g_dbus_object_skeleton_remove_interface"

(** This method simply calls g_dbus_interface_skeleton_flush() on all
interfaces belonging to @object. See that method for when flushing
is useful. *)
external flush : t -> unit = "ml_g_dbus_object_skeleton_flush"

(** Adds @interface_ to @object.

If @object already contains a #GDBusInterfaceSkeleton with the same
interface name, it is removed before @interface_ is added.

Note that @object takes its own reference on @interface_ and holds
it until removed. *)
external add_interface : t -> D_bus_interface_skeleton.t -> unit = "ml_g_dbus_object_skeleton_add_interface"

(* Properties *)

(** Get property: g-object-path *)
external get_g_object_path : t -> string = "ml_g_d_bus_object_skeleton_get_g_object_path"

(** Set property: g-object-path *)
external set_g_object_path : t -> string -> unit = "ml_g_d_bus_object_skeleton_set_g_object_path"

