(* GENERATED CODE - DO NOT EDIT *)
(* DBusObjectManager: DBusObjectManager *)

type t = [`d_bus_object_manager] Gobject.obj

external from_gobject : 'a Gobject.obj -> t = "ml_gio_d_bus_object_manager_from_gobject"

(* Methods *)
(** Gets all #GDBusObject objects known to @manager. *)
external get_objects : t -> D_bus_interface_and__d_bus_object.D_bus_object.t list = "ml_g_dbus_object_manager_get_objects"

(** Gets the object path that @manager is for. *)
external get_object_path : t -> string = "ml_g_dbus_object_manager_get_object_path"

(** Gets the #GDBusObject at @object_path, if any. *)
external get_object : t -> string -> D_bus_interface_and__d_bus_object.D_bus_object.t option = "ml_g_dbus_object_manager_get_object"

(** Gets the interface proxy for @interface_name at @object_path, if
any. *)
external get_interface : t -> string -> string -> D_bus_interface_and__d_bus_object.D_bus_interface.t option = "ml_g_dbus_object_manager_get_interface"

