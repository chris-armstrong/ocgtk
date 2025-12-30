(* GENERATED CODE - DO NOT EDIT *)
(* DBusServer: DBusServer *)

type t = [`d_bus_server | `object_] Gobject.obj

(* Methods *)
(** Stops @server. *)
external stop : t -> unit = "ml_g_dbus_server_stop"

(** Starts @server. *)
external start : t -> unit = "ml_g_dbus_server_start"

(** Gets whether @server is active. *)
external is_active : t -> bool = "ml_g_dbus_server_is_active"

(** Gets the GUID for @server, as provided to g_dbus_server_new_sync(). *)
external get_guid : t -> string = "ml_g_dbus_server_get_guid"

(** Gets the flags for @server. *)
external get_flags : t -> Gio_enums.dbusserverflags = "ml_g_dbus_server_get_flags"

(** Gets a
[D-Bus address](https://dbus.freedesktop.org/doc/dbus-specification.html#addresses)
string that can be used by clients to connect to @server.

This is valid and non-empty if initializing the #GDBusServer succeeded. *)
external get_client_address : t -> string = "ml_g_dbus_server_get_client_address"

(* Properties *)

(** Get property: active *)
external get_active : t -> bool = "ml_gtk_d_bus_server_get_active"

(** Get property: address *)
external get_address : t -> string = "ml_gtk_d_bus_server_get_address"

(** Get property: authentication-observer *)
external get_authentication_observer : t -> D_bus_auth_observer.t = "ml_gtk_d_bus_server_get_authentication_observer"

