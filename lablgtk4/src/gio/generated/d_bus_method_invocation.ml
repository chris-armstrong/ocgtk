(* GENERATED CODE - DO NOT EDIT *)
(* DBusMethodInvocation: DBusMethodInvocation *)

type t = [`d_bus_method_invocation | `object_] Gobject.obj

(* Methods *)
(** Finishes handling a D-Bus method call by returning an error.

This method will take ownership of @invocation. See
#GDBusInterfaceVTable for more information about the ownership of
@invocation. *)
external return_dbus_error : t -> string -> string -> unit = "ml_g_dbus_method_invocation_return_dbus_error"

(** Gets the bus name that invoked the method. *)
external get_sender : t -> string = "ml_g_dbus_method_invocation_get_sender"

(** Gets information about the property that this method call is for, if
any.

This will only be set in the case of an invocation in response to a
property Get or Set call that has been directed to the method call
handler for an object on account of its property_get() or
property_set() vtable pointers being unset.

See #GDBusInterfaceVTable for more information.

If the call was GetAll, %NULL will be returned. *)
external get_property_info : t -> D_bus_property_info.t option = "ml_g_dbus_method_invocation_get_property_info"

(** Gets the object path the method was invoked on. *)
external get_object_path : t -> string = "ml_g_dbus_method_invocation_get_object_path"

(** Gets the name of the method that was invoked. *)
external get_method_name : t -> string = "ml_g_dbus_method_invocation_get_method_name"

(** Gets information about the method call, if any.

If this method invocation is a property Get, Set or GetAll call that
has been redirected to the method call handler then %NULL will be
returned.  See g_dbus_method_invocation_get_property_info() and
#GDBusInterfaceVTable for more information. *)
external get_method_info : t -> D_bus_method_info.t option = "ml_g_dbus_method_invocation_get_method_info"

(** Gets the #GDBusMessage for the method invocation. This is useful if
you need to use low-level protocol features, such as UNIX file
descriptor passing, that cannot be properly expressed in the
#GVariant API.

See this [server][gdbus-server] and [client][gdbus-unix-fd-client]
for an example of how to use this low-level API to send and receive
UNIX file descriptors. *)
external get_message : t -> D_bus_message.t = "ml_g_dbus_method_invocation_get_message"

(** Gets the name of the D-Bus interface the method was invoked on.

If this method call is a property Get, Set or GetAll call that has
been redirected to the method call handler then
"org.freedesktop.DBus.Properties" will be returned.  See
#GDBusInterfaceVTable for more information. *)
external get_interface_name : t -> string = "ml_g_dbus_method_invocation_get_interface_name"

(** Gets the #GDBusConnection the method was invoked on. *)
external get_connection : t -> D_bus_connection.t = "ml_g_dbus_method_invocation_get_connection"

