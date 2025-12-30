(* GENERATED CODE - DO NOT EDIT *)
(* DBusObjectManager: DBusObjectManager *)

type t = [`d_bus_object_manager] Gobject.obj

(* Methods *)
(** Gets the object path that @manager is for. *)
external get_object_path : t -> string = "ml_g_dbus_object_manager_get_object_path"

(** Gets the #GDBusObject at @object_path, if any. *)
external get_object : t -> string -> D_bus_interface_and__d_bus_object.D_bus_object.t option = "ml_g_dbus_object_manager_get_object"

(** Gets the interface proxy for @interface_name at @object_path, if
any. *)
external get_interface : t -> string -> string -> D_bus_interface_and__d_bus_object.D_bus_interface.t option = "ml_g_dbus_object_manager_get_interface"

