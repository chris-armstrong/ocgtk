(* GENERATED CODE - DO NOT EDIT *)
(* DBusProxy: DBusProxy *)

type t = [`d_bus_proxy | `object_] Gobject.obj

(* Methods *)
(** Ensure that interactions with @proxy conform to the given
interface. See the #GDBusProxy:g-interface-info property for more
details. *)
external set_interface_info : t -> D_bus_interface_info.t option -> unit = "ml_g_dbus_proxy_set_interface_info"

(** Sets the timeout to use if -1 (specifying default timeout) is
passed as @timeout_msec in the g_dbus_proxy_call() and
g_dbus_proxy_call_sync() functions.

See the #GDBusProxy:g-default-timeout property for more details. *)
external set_default_timeout : t -> int -> unit = "ml_g_dbus_proxy_set_default_timeout"

(** Gets the object path @proxy is for. *)
external get_object_path : t -> string = "ml_g_dbus_proxy_get_object_path"

(** The unique name that owns the name that @proxy is for or %NULL if
no-one currently owns that name. You may connect to the
#GObject::notify signal to track changes to the
#GDBusProxy:g-name-owner property. *)
external get_name_owner : t -> string option = "ml_g_dbus_proxy_get_name_owner"

(** Gets the name that @proxy was constructed for.

When connected to a message bus, this will usually be non-%NULL.
However, it may be %NULL for a proxy that communicates using a peer-to-peer
pattern. *)
external get_name : t -> string option = "ml_g_dbus_proxy_get_name"

(** Gets the D-Bus interface name @proxy is for. *)
external get_interface_name : t -> string = "ml_g_dbus_proxy_get_interface_name"

(** Returns the #GDBusInterfaceInfo, if any, specifying the interface
that @proxy conforms to. See the #GDBusProxy:g-interface-info
property for more details. *)
external get_interface_info : t -> D_bus_interface_info.t option = "ml_g_dbus_proxy_get_interface_info"

(** Gets the timeout to use if -1 (specifying default timeout) is
passed as @timeout_msec in the g_dbus_proxy_call() and
g_dbus_proxy_call_sync() functions.

See the #GDBusProxy:g-default-timeout property for more details. *)
external get_default_timeout : t -> int = "ml_g_dbus_proxy_get_default_timeout"

(** Gets the connection @proxy is for. *)
external get_connection : t -> D_bus_connection.t = "ml_g_dbus_proxy_get_connection"

(* Properties *)

(** Get property: g-bus-type *)
external get_g_bus_type : t -> Gio_enums.bustype = "ml_gtk_d_bus_proxy_get_g_bus_type"

(** Get property: g-connection *)
external get_g_connection : t -> D_bus_connection.t = "ml_gtk_d_bus_proxy_get_g_connection"

(** Get property: g-default-timeout *)
external get_g_default_timeout : t -> int = "ml_gtk_d_bus_proxy_get_g_default_timeout"

(** Set property: g-default-timeout *)
external set_g_default_timeout : t -> int -> unit = "ml_gtk_d_bus_proxy_set_g_default_timeout"

(** Get property: g-interface-info *)
external get_g_interface_info : t -> D_bus_interface_info.t = "ml_gtk_d_bus_proxy_get_g_interface_info"

(** Set property: g-interface-info *)
external set_g_interface_info : t -> D_bus_interface_info.t -> unit = "ml_gtk_d_bus_proxy_set_g_interface_info"

(** Get property: g-interface-name *)
external get_g_interface_name : t -> string = "ml_gtk_d_bus_proxy_get_g_interface_name"

(** Get property: g-name *)
external get_g_name : t -> string = "ml_gtk_d_bus_proxy_get_g_name"

(** Get property: g-name-owner *)
external get_g_name_owner : t -> string = "ml_gtk_d_bus_proxy_get_g_name_owner"

(** Get property: g-object-path *)
external get_g_object_path : t -> string = "ml_gtk_d_bus_proxy_get_g_object_path"

