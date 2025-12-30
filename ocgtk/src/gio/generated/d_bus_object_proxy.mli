(* GENERATED CODE - DO NOT EDIT *)
(* DBusObjectProxy: DBusObjectProxy *)

type t = [`d_bus_object_proxy | `object_] Gobject.obj

(** Create a new DBusObjectProxy *)
external new_ : D_bus_connection.t -> string -> t = "ml_g_dbus_object_proxy_new"

(* Methods *)
(** Gets the connection that @proxy is for. *)
external get_connection : t -> D_bus_connection.t = "ml_g_dbus_object_proxy_get_connection"

(* Properties *)

(** Get property: g-connection *)
external get_g_connection : t -> D_bus_connection.t = "ml_gtk_d_bus_object_proxy_get_g_connection"

(** Get property: g-object-path *)
external get_g_object_path : t -> string = "ml_gtk_d_bus_object_proxy_get_g_object_path"

