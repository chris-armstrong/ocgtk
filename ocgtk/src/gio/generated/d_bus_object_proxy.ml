(* GENERATED CODE - DO NOT EDIT *)
(* DBusObjectProxy: DBusObjectProxy *)

(** A [GDBusObjectProxy] is an object used to represent a remote object with one
    or more D-Bus interfaces. Normally, you don’t instantiate a
    [GDBusObjectProxy] yourself — typically [Gio.DBusObjectManagerClient] is
    used to obtain it. *)

type t = [ `d_bus_object_proxy | `object_ ] Gobject.obj

external new_ : D_bus_connection.t -> string -> t = "ml_g_dbus_object_proxy_new"
(** Create a new DBusObjectProxy *)

(* Methods *)

external get_connection : t -> D_bus_connection.t
  = "ml_g_dbus_object_proxy_get_connection"
(** Gets the connection that [proxy] is for. *)

(* Properties *)

external get_g_connection : t -> D_bus_connection.t
  = "ml_g_d_bus_object_proxy_get_g_connection"
(** Get property: g-connection *)

external get_g_object_path : t -> string
  = "ml_g_d_bus_object_proxy_get_g_object_path"
(** Get property: g-object-path *)
