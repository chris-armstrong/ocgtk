(* GENERATED CODE - DO NOT EDIT *)
(* DBusObjectManagerClient: DBusObjectManagerClient *)

type t = [`d_bus_object_manager_client | `object_] Gobject.obj

(* Methods *)
(** The unique name that owns the name that @manager is for or %NULL if
no-one currently owns that name. You can connect to the
#GObject::notify signal to track changes to the
#GDBusObjectManagerClient:name-owner property. *)
external get_name_owner : t -> string option = "ml_g_dbus_object_manager_client_get_name_owner"

(** Gets the name that @manager is for, or %NULL if not a message bus
connection. *)
external get_name : t -> string = "ml_g_dbus_object_manager_client_get_name"

(** Gets the #GDBusConnection used by @manager. *)
external get_connection : t -> D_bus_connection.t = "ml_g_dbus_object_manager_client_get_connection"

(* Properties *)

(** Get property: bus-type *)
external get_bus_type : t -> Gio_enums.bustype = "ml_gtk_d_bus_object_manager_client_get_bus_type"

(** Get property: object-path *)
external get_object_path : t -> string = "ml_gtk_d_bus_object_manager_client_get_object_path"

