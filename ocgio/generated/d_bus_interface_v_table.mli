(** Virtual table for handling properties and method calls for a D-Bus
    interface.

    Its methods, signals and properties are on
    {!class-type-d_bus_interface_v_table_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgio.Raw.D_bus_interface_v_table}. *)

(** {1:class Class} *)

class type d_bus_interface_v_table_t = object
  (** {2:conversions Conversions} *)

  method as_d_bus_interface_v_table : Raw.D_bus_interface_v_table.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [DBusInterfaceVTable].}\n\n\
     Virtual table for handling properties and method calls for a D-Bus\n\
     interface.\n\n\
     Since 2.38, if you want to handle getting/setting D-Bus properties\n\
     asynchronously, give [None] as your [get_property ()] or [set_property ()]\n\
     function. The D-Bus call will be directed to your [method_call] function,\n\
     with the provided [interface_name] set to \
     \"org.freedesktop.DBus.Properties\".\n\n\
     Ownership of the \
     {{!Ocgio.D_bus_method_invocation.class-type-d_bus_method_invocation_t}[GDBusMethodInvocation]} \
     object passed to the\n\
     [method_call ()] function is transferred to your handler; you must\n\
     call one of the methods of \
     {{!Ocgio.D_bus_method_invocation.class-type-d_bus_method_invocation_t}[GDBusMethodInvocation]} \
     to return a reply\n\
     (possibly empty), or an error. These functions also take ownership\n\
     of the passed-in invocation object, so unless the invocation\n\
     object has otherwise been referenced, it will be then be freed.\n\
     Calling one of these functions may be done within your\n\
     [method_call ()] implementation but it also can be done at a later\n\
     point to handle the method asynchronously.\n\n\
     The usual checks on the validity of the calls is performed. For\n\
     [Get] calls, an error is automatically returned if the property does\n\
     not exist or the permissions do not allow access. The same checks are\n\
     performed for [Set] calls, and the provided value is also checked for\n\
     being the correct type.\n\n\
     For both [Get] and [Set] calls, the \
     {{!Ocgio.D_bus_method_invocation.class-type-d_bus_method_invocation_t}[GDBusMethodInvocation]}\n\
     passed to the [method_call] handler can be queried with\n\
     {{!Ocgio.D_bus_method_invocation.class-type-d_bus_method_invocation_t.method-get_property_info}[g_dbus_method_invocation_get_property_info \
     ()]} to get a pointer\n\
     to the \
     {{!Ocgio.D_bus_property_info.class-type-d_bus_property_info_t}[GDBusPropertyInfo]} \
     of the property.\n\n\
     If you have readable properties specified in your interface info,\n\
     you must ensure that you either provide a non-[None] [get_property]()\n\
     function or provide implementations of both the [Get] and [GetAll]\n\
     methods on org.freedesktop.DBus.Properties interface in your [method_call]\n\
     function. Note that the required return type of the [Get] call is\n\
     [(v)], not the type of the property. [GetAll] expects a return value\n\
     of type [a{sv}].\n\n\
     If you have writable properties specified in your interface info,\n\
     you must ensure that you either provide a non-[None] [set_property]()\n\
     function or provide an implementation of the [Set] call. If implementing\n\
     the call, you must return the value of type [G_VARIANT_TYPE_UNIT]."]

class d_bus_interface_v_table :
  Raw.D_bus_interface_v_table.t ->
  d_bus_interface_v_table_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_interface_v_table.t}. *)

[@@@ocaml.text
"{1:description Description}\n\n\
 Virtual table for handling properties and method calls for a D-Bus\n\
 interface.\n\n\
 Since 2.38, if you want to handle getting/setting D-Bus properties\n\
 asynchronously, give [None] as your [get_property ()] or [set_property ()]\n\
 function. The D-Bus call will be directed to your [method_call] function,\n\
 with the provided [interface_name] set to \
 \"org.freedesktop.DBus.Properties\".\n\n\
 Ownership of the \
 {{!Ocgio.D_bus_method_invocation.class-type-d_bus_method_invocation_t}[GDBusMethodInvocation]} \
 object passed to the\n\
 [method_call ()] function is transferred to your handler; you must\n\
 call one of the methods of \
 {{!Ocgio.D_bus_method_invocation.class-type-d_bus_method_invocation_t}[GDBusMethodInvocation]} \
 to return a reply\n\
 (possibly empty), or an error. These functions also take ownership\n\
 of the passed-in invocation object, so unless the invocation\n\
 object has otherwise been referenced, it will be then be freed.\n\
 Calling one of these functions may be done within your\n\
 [method_call ()] implementation but it also can be done at a later\n\
 point to handle the method asynchronously.\n\n\
 The usual checks on the validity of the calls is performed. For\n\
 [Get] calls, an error is automatically returned if the property does\n\
 not exist or the permissions do not allow access. The same checks are\n\
 performed for [Set] calls, and the provided value is also checked for\n\
 being the correct type.\n\n\
 For both [Get] and [Set] calls, the \
 {{!Ocgio.D_bus_method_invocation.class-type-d_bus_method_invocation_t}[GDBusMethodInvocation]}\n\
 passed to the [method_call] handler can be queried with\n\
 {{!Ocgio.D_bus_method_invocation.class-type-d_bus_method_invocation_t.method-get_property_info}[g_dbus_method_invocation_get_property_info \
 ()]} to get a pointer\n\
 to the \
 {{!Ocgio.D_bus_property_info.class-type-d_bus_property_info_t}[GDBusPropertyInfo]} \
 of the property.\n\n\
 If you have readable properties specified in your interface info,\n\
 you must ensure that you either provide a non-[None] [get_property]()\n\
 function or provide implementations of both the [Get] and [GetAll]\n\
 methods on org.freedesktop.DBus.Properties interface in your [method_call]\n\
 function. Note that the required return type of the [Get] call is\n\
 [(v)], not the type of the property. [GetAll] expects a return value\n\
 of type [a{sv}].\n\n\
 If you have writable properties specified in your interface info,\n\
 you must ensure that you either provide a non-[None] [set_property]()\n\
 function or provide an implementation of the [Set] call. If implementing\n\
 the call, you must return the value of type [G_VARIANT_TYPE_UNIT]."]

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
