(* GENERATED CODE - DO NOT EDIT *)
(* DBusObjectProxy: DBusObjectProxy *)

(** A [GDBusObjectProxy] is an object used to represent a remote object with one
    or more D-Bus interfaces. Normally, you don’t instantiate a
    [GDBusObjectProxy] yourself — typically [Gio.DBusObjectManagerClient] is
    used to obtain it.

    The class built on this module is in {!Ocgio.D_bus_object_proxy}. *)

type t = [ `d_bus_object_proxy | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_d_bus_object_proxy_get_type"

external new_ : D_bus_connection.t -> string -> t = "ml_g_dbus_object_proxy_new"
(** Creates a new [GDBusObjectProxy] for the given connection and object path.
*)

(* Methods *)

external get_connection : t -> D_bus_connection.t
  = "ml_g_dbus_object_proxy_get_connection"
(** Gets the connection that [proxy] is for. *)

(* Properties *)

external get_g_connection : t -> D_bus_connection.t
  = "ml_g_d_bus_object_proxy_get_g_connection"
(** The connection of the proxy. *)

external get_g_object_path : t -> string
  = "ml_g_d_bus_object_proxy_get_g_object_path"
(** The object path of the proxy. *)
