(* GENERATED CODE - DO NOT EDIT *)
(* DBusProxy: DBusProxy *)

(** [GDBusProxy] is a base class used for proxies to access a D-Bus interface on
    a remote object. A [GDBusProxy] can be constructed for both well-known and
    unique names.

    By default, [GDBusProxy] will cache all properties (and listen to changes)
    of the remote object, and proxy all signals that get emitted. This behaviour
    can be changed by passing suitable
    {{!Ocgio.Enums.type-dbusproxyflags}[Gio.DBusProxyFlags]} when the proxy is
    created. If the proxy is for a well-known name, the property cache is
    flushed when the name owner vanishes and reloaded when a name owner appears.

    The unique name owner of the proxy’s name is tracked and can be read from
    {{!Ocgio.Raw.D_bus_proxy.val-get_g_name_owner}[Gio.DBusProxy:g-name-owner]}.
    Connect to the [GObject.Object::notify] signal to get notified of changes.
    Additionally, only signals and property changes emitted from the current
    name owner are considered and calls are always sent to the current name
    owner. This avoids a number of race conditions when the name is lost by one
    owner and claimed by another. However, if no name owner currently exists,
    then calls will be sent to the well-known name which may result in the
    message bus launching an owner (unless
    [G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START] is set).

    If the proxy is for a stateless D-Bus service, where the name owner may be
    started and stopped between calls, the
    {{!Ocgio.Raw.D_bus_proxy.val-get_g_name_owner}[Gio.DBusProxy:g-name-owner]}
    tracking of [GDBusProxy] will cause the proxy to drop signal and property
    changes from the service after it has restarted for the first time. When
    interacting with a stateless D-Bus service, do not use [GDBusProxy] — use
    direct D-Bus method calls and signal connections.

    The generic [Gio.DBusProxy::g-properties-changed] and
    {{!Ocgio.Raw.D_bus_proxy.val-on_g_signal}[Gio.DBusProxy::g-signal]} signals
    are not very convenient to work with. Therefore, the recommended way of
    working with proxies is to subclass [GDBusProxy], and have more natural
    properties and signals in your derived class. This example shows how this
    can easily be done using the [gdbus-codegen] tool.

    A [GDBusProxy] instance can be used from multiple threads but note that all
    signals (e.g.
    {{!Ocgio.Raw.D_bus_proxy.val-on_g_signal}[Gio.DBusProxy::g-signal]},
    [Gio.DBusProxy::g-properties-changed] and [GObject.Object::notify]) are
    emitted in the thread-default main context (see
    [GLib.MainContext.push_thread_default]) of the thread where the instance was
    constructed.

    {b A watch proxy example}

    An example using a proxy for a well-known name can be found in
    {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-watch-proxy.c}
     [gdbus-example-watch-proxy.c]}.

    The class built on this module is in {!Ocgio.D_bus_proxy}. *)

type t = [ `d_bus_proxy | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gio_d_bus_proxy_get_type"

external new_finish : Async_result.t -> (t, GError.t) result
  = "ml_g_dbus_proxy_new_finish"
(** Finishes creating a {{!Ocgio.Raw.D_bus_proxy}[GDBusProxy]}. *)

external new_for_bus_finish : Async_result.t -> (t, GError.t) result
  = "ml_g_dbus_proxy_new_for_bus_finish"
(** Finishes creating a {{!Ocgio.Raw.D_bus_proxy}[GDBusProxy]}. *)

external new_for_bus_sync :
  Ocgio_enums.bustype ->
  Ocgio_enums.dbusproxyflags ->
  D_bus_interface_info.t option ->
  string ->
  string ->
  string ->
  Cancellable.t option ->
  (t, GError.t) result
  = "ml_g_dbus_proxy_new_for_bus_sync_bytecode"
    "ml_g_dbus_proxy_new_for_bus_sync_native"
(** Like {{!Ocgio.Raw.D_bus_proxy.val-new_sync}[g_dbus_proxy_new_sync ()]} but
    takes a {{!Ocgio.Enums.type-bustype}[GBusType]} instead of a
    {{!Ocgio.Raw.D_bus_connection}[GDBusConnection]}.

    {{!Ocgio.Raw.D_bus_proxy}[GDBusProxy]} is used in this
    \[example\]{{!Ocgio.Raw.D_bus_proxy}[Gio.DBusProxy]}. *)

external new_sync :
  D_bus_connection.t ->
  Ocgio_enums.dbusproxyflags ->
  D_bus_interface_info.t option ->
  string option ->
  string ->
  string ->
  Cancellable.t option ->
  (t, GError.t) result
  = "ml_g_dbus_proxy_new_sync_bytecode" "ml_g_dbus_proxy_new_sync_native"
(** Creates a proxy for accessing [interface_name] on the remote object at
    [object_path] owned by [name] at [connection] and synchronously loads D-Bus
    properties unless the
    {{!Ocgio.Enums.type-dbusproxyflags_flag.constructor-DO_NOT_LOAD_PROPERTIES}[G_DBUS_PROXY_FLAGS_DO_NOT_LOAD_PROPERTIES]}
    flag is used.

    If the
    {{!Ocgio.Enums.type-dbusproxyflags_flag.constructor-DO_NOT_CONNECT_SIGNALS}[G_DBUS_PROXY_FLAGS_DO_NOT_CONNECT_SIGNALS]}
    flag is not set, also sets up match rules for signals. Connect to the
    {{!Ocgio.Raw.D_bus_proxy.val-on_g_signal}[GDBusProxy::g-signal]} signal to
    handle signals from the remote object.

    If both
    {{!Ocgio.Enums.type-dbusproxyflags_flag.constructor-DO_NOT_LOAD_PROPERTIES}[G_DBUS_PROXY_FLAGS_DO_NOT_LOAD_PROPERTIES]}
    and
    {{!Ocgio.Enums.type-dbusproxyflags_flag.constructor-DO_NOT_CONNECT_SIGNALS}[G_DBUS_PROXY_FLAGS_DO_NOT_CONNECT_SIGNALS]}
    are set, this constructor is guaranteed to return immediately without
    blocking.

    If [name] is a well-known name and the
    {{!Ocgio.Enums.type-dbusproxyflags_flag.constructor-DO_NOT_AUTO_START}[G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START]}
    and
    {{!Ocgio.Enums.type-dbusproxyflags_flag.constructor-DO_NOT_AUTO_START_AT_CONSTRUCTION}
     [G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START_AT_CONSTRUCTION]} flags aren't set
    and no name owner currently exists, the message bus will be requested to
    launch a name owner for the name.

    This is a synchronous failable constructor. See [g_dbus_proxy_new ()] and
    {{!Ocgio.Raw.D_bus_proxy.val-new_finish}[g_dbus_proxy_new_finish ()]} for
    the asynchronous version.

    {{!Ocgio.Raw.D_bus_proxy}[GDBusProxy]} is used in this
    \[example\]{{!Ocgio.Raw.D_bus_proxy}[Gio.DBusProxy]}. *)

(* Methods *)

external set_interface_info : t -> D_bus_interface_info.t option -> unit
  = "ml_g_dbus_proxy_set_interface_info"
(** Ensure that interactions with [proxy] conform to the given interface. See
    the
    {{!Ocgio.Raw.D_bus_proxy.val-get_g_interface_info}[GDBusProxy:g-interface-info]}
    property for more details. *)

external set_default_timeout : t -> int -> unit
  = "ml_g_dbus_proxy_set_default_timeout"
(** Sets the timeout to use if -1 (specifying default timeout) is passed as
    [timeout_msec] in the [g_dbus_proxy_call ()] and
    {{!Ocgio.Raw.D_bus_proxy.val-call_sync}[g_dbus_proxy_call_sync ()]}
    functions.

    See the
    {{!Ocgio.Raw.D_bus_proxy.val-get_g_default_timeout}[GDBusProxy:g-default-timeout]}
    property for more details. *)

external set_cached_property : t -> string -> Gvariant.t option -> unit
  = "ml_g_dbus_proxy_set_cached_property"
[@@ocaml.doc
  "If [value] is not [None], sets the cached value for the property with\n\
   name [property_name] to the value in [value].\n\n\
   If [value] is [None], then the cached value is removed from the\n\
   property cache.\n\n\
   If [proxy] has an expected interface (see\n\
   {{!Ocgio.Raw.D_bus_proxy.val-get_g_interface_info}[GDBusProxy:g-interface-info]}) \
   and [property_name] is referenced by\n\
   it, then [value] is checked against the type of the property.\n\n\
   If the [value] [GVariant] is floating, it is consumed. This allows\n\
   convenient 'inline' use of [g_variant_new ()], e.g.\n\n\
   {[\n\
  \ g_dbus_proxy_set_cached_property (proxy,\n\
  \                                   \"SomeProperty\",\n\
  \                                   g_variant_new (\"(si)\",\n\
  \                                                 \"A String\",\n\
  \                                                 42));\n\
   ]}\n\n\
   Normally you will not need to use this method since [proxy]\n\
   is tracking changes using the\n\
   [org.freedesktop.DBus.Properties.PropertiesChanged]\n\
   D-Bus signal. However, for performance reasons an object may\n\
   decide to not use this signal for some properties and instead\n\
   use a proprietary out-of-band mechanism to transmit changes.\n\n\
   As a concrete example, consider an object with a property\n\
   [ChatroomParticipants] which is an array of strings. Instead of\n\
   transmitting the same (long) array every time the property changes,\n\
   it is more efficient to only transmit the delta using e.g. signals\n\
   [ChatroomParticipantJoined(String name)] and\n\
   [ChatroomParticipantParted(String name)]."]

external get_object_path : t -> string = "ml_g_dbus_proxy_get_object_path"
(** Gets the object path [proxy] is for. *)

external get_name_owner : t -> string option = "ml_g_dbus_proxy_get_name_owner"
(** The unique name that owns the name that [proxy] is for or [None] if no-one
    currently owns that name. You may connect to the [GObject::notify] signal to
    track changes to the
    {{!Ocgio.Raw.D_bus_proxy.val-get_g_name_owner}[GDBusProxy:g-name-owner]}
    property. *)

external get_name : t -> string option = "ml_g_dbus_proxy_get_name"
(** Gets the name that [proxy] was constructed for.

    When connected to a message bus, this will usually be non-[None]. However,
    it may be [None] for a proxy that communicates using a peer-to-peer pattern.
*)

external get_interface_name : t -> string = "ml_g_dbus_proxy_get_interface_name"
(** Gets the D-Bus interface name [proxy] is for. *)

external get_interface_info : t -> D_bus_interface_info.t option
  = "ml_g_dbus_proxy_get_interface_info"
(** Returns the {{!Ocgio.Raw.D_bus_interface_info}[GDBusInterfaceInfo]}, if any,
    specifying the interface that [proxy] conforms to. See the
    {{!Ocgio.Raw.D_bus_proxy.val-get_g_interface_info}[GDBusProxy:g-interface-info]}
    property for more details. *)

external get_flags : t -> Ocgio_enums.dbusproxyflags
  = "ml_g_dbus_proxy_get_flags"
(** Gets the flags that [proxy] was constructed with. *)

external get_default_timeout : t -> int = "ml_g_dbus_proxy_get_default_timeout"
(** Gets the timeout to use if -1 (specifying default timeout) is passed as
    [timeout_msec] in the [g_dbus_proxy_call ()] and
    {{!Ocgio.Raw.D_bus_proxy.val-call_sync}[g_dbus_proxy_call_sync ()]}
    functions.

    See the
    {{!Ocgio.Raw.D_bus_proxy.val-get_g_default_timeout}[GDBusProxy:g-default-timeout]}
    property for more details. *)

external get_connection : t -> D_bus_connection.t
  = "ml_g_dbus_proxy_get_connection"
(** Gets the connection [proxy] is for. *)

external get_cached_property_names : t -> string array option
  = "ml_g_dbus_proxy_get_cached_property_names"
(** Gets the names of all cached properties on [proxy]. *)

external get_cached_property : t -> string -> Gvariant.t option
  = "ml_g_dbus_proxy_get_cached_property"
(** Looks up the value for a property from the cache. This call does no blocking
    IO.

    If [proxy] has an expected interface (see
    {{!Ocgio.Raw.D_bus_proxy.val-get_g_interface_info}[GDBusProxy:g-interface-info]})
    and [property_name] is referenced by it, then [value] is checked against the
    type of the property. *)

external call_sync :
  t ->
  string ->
  Gvariant.t option ->
  Ocgio_enums.dbuscallflags ->
  int ->
  Cancellable.t option ->
  (Gvariant.t, GError.t) result
  = "ml_g_dbus_proxy_call_sync_bytecode" "ml_g_dbus_proxy_call_sync_native"
[@@ocaml.doc
  "Synchronously invokes the [method_name] method on [proxy].\n\n\
   If [method_name] contains any dots, then [name] is split into interface and\n\
   method name parts. This allows using [proxy] for invoking methods on\n\
   other interfaces.\n\n\
   If the {{!Ocgio.Raw.D_bus_connection}[GDBusConnection]} associated with \
   [proxy] is disconnected then\n\
   the operation will fail with \
   {{!Ocgio.Enums.type-ioerrorenum.constructor-CLOSED}[G_IO_ERROR_CLOSED]}. If\n\
   [cancellable] is canceled, the operation will fail with\n\
   {{!Ocgio.Enums.type-ioerrorenum.constructor-CANCELLED}[G_IO_ERROR_CANCELLED]}. \
   If [parameters] contains a value not\n\
   compatible with the D-Bus protocol, the operation fails with\n\
   {{!Ocgio.Enums.type-ioerrorenum.constructor-INVALID_ARGUMENT}[G_IO_ERROR_INVALID_ARGUMENT]}.\n\n\
   If the [parameters] [GVariant] is floating, it is consumed. This allows\n\
   convenient 'inline' use of [g_variant_new ()], e.g.:\n\n\
   {[\n\
  \ g_dbus_proxy_call_sync (proxy,\n\
  \                         \"TwoStrings\",\n\
  \                         g_variant_new (\"(ss)\",\n\
  \                                        \"Thing One\",\n\
  \                                        \"Thing Two\"),\n\
  \                         G_DBUS_CALL_FLAGS_NONE,\n\
  \                         -1,\n\
  \                         NULL,\n\
  \                         &error);\n\
   ]}\n\n\
   The calling thread is blocked until a reply is received. See\n\
   [g_dbus_proxy_call ()] for the asynchronous version of this\n\
   method.\n\n\
   If [proxy] has an expected interface (see\n\
   {{!Ocgio.Raw.D_bus_proxy.val-get_g_interface_info}[GDBusProxy:g-interface-info]}) \
   and [method_name] is referenced by it,\n\
   then the return value is checked against the return type."]

external call_finish : t -> Async_result.t -> (Gvariant.t, GError.t) result
  = "ml_g_dbus_proxy_call_finish"
(** Finishes an operation started with [g_dbus_proxy_call ()]. *)

(* Properties *)

external get_g_connection : t -> D_bus_connection.t
  = "ml_g_d_bus_proxy_get_g_connection"
(** The {{!Ocgio.Raw.D_bus_connection}[GDBusConnection]} the proxy is for. *)

external get_g_default_timeout : t -> int
  = "ml_g_d_bus_proxy_get_g_default_timeout"
(** The timeout to use if -1 (specifying default timeout) is passed as
    [timeout_msec] in the [g_dbus_proxy_call ()] and
    {{!Ocgio.Raw.D_bus_proxy.val-call_sync}[g_dbus_proxy_call_sync ()]}
    functions.

    This allows applications to set a proxy-wide timeout for all remote method
    invocations on the proxy. If this property is -1, the default timeout
    (typically 25 seconds) is used. If set to [G_MAXINT], then no timeout is
    used. *)

external set_g_default_timeout : t -> int -> unit
  = "ml_g_d_bus_proxy_set_g_default_timeout"
(** The timeout to use if -1 (specifying default timeout) is passed as
    [timeout_msec] in the [g_dbus_proxy_call ()] and
    {{!Ocgio.Raw.D_bus_proxy.val-call_sync}[g_dbus_proxy_call_sync ()]}
    functions.

    This allows applications to set a proxy-wide timeout for all remote method
    invocations on the proxy. If this property is -1, the default timeout
    (typically 25 seconds) is used. If set to [G_MAXINT], then no timeout is
    used. *)

external get_g_flags : t -> Ocgio_enums.dbusproxyflags
  = "ml_g_d_bus_proxy_get_g_flags"
(** Flags from the {{!Ocgio.Enums.type-dbusproxyflags}[GDBusProxyFlags]}
    enumeration. *)

external get_g_interface_info : t -> D_bus_interface_info.t
  = "ml_g_d_bus_proxy_get_g_interface_info"
[@@ocaml.doc
  "Ensure that interactions with this proxy conform to the given\n\
   interface. This is mainly to ensure that malformed data received\n\
   from the other peer is ignored. The given \
   {{!Ocgio.Raw.D_bus_interface_info}[GDBusInterfaceInfo]} is\n\
   said to be the \"expected interface\".\n\n\
   The checks performed are:\n\n\
   - When completing a method call, if the type signature of\n\
   the reply message isn't what's expected, the reply is\n\
   discarded and the [GError] is set to \
   {{!Ocgio.Enums.type-ioerrorenum.constructor-INVALID_ARGUMENT}[G_IO_ERROR_INVALID_ARGUMENT]}.\n\n\
   - Received signals that have a type signature mismatch are dropped and\n\
   a warning is logged via [g_warning ()].\n\n\
   - Properties received via the initial [GetAll()] call or via the\n\
   [::PropertiesChanged] signal (on the\n\
   org.freedesktop.DBus.Properties\n\
   interface) or set using \
   {{!Ocgio.Raw.D_bus_proxy.val-set_cached_property}[g_dbus_proxy_set_cached_property \
   ()]}\n\
   with a type signature mismatch are ignored and a warning is\n\
   logged via [g_warning ()].\n\n\
   Note that these checks are never done on methods, signals and\n\
   properties that are not referenced in the given\n\
   {{!Ocgio.Raw.D_bus_interface_info}[GDBusInterfaceInfo]}, since extending a \
   D-Bus interface on the\n\
   service-side is not considered an ABI break."]

external set_g_interface_info : t -> D_bus_interface_info.t -> unit
  = "ml_g_d_bus_proxy_set_g_interface_info"
[@@ocaml.doc
  "Ensure that interactions with this proxy conform to the given\n\
   interface. This is mainly to ensure that malformed data received\n\
   from the other peer is ignored. The given \
   {{!Ocgio.Raw.D_bus_interface_info}[GDBusInterfaceInfo]} is\n\
   said to be the \"expected interface\".\n\n\
   The checks performed are:\n\n\
   - When completing a method call, if the type signature of\n\
   the reply message isn't what's expected, the reply is\n\
   discarded and the [GError] is set to \
   {{!Ocgio.Enums.type-ioerrorenum.constructor-INVALID_ARGUMENT}[G_IO_ERROR_INVALID_ARGUMENT]}.\n\n\
   - Received signals that have a type signature mismatch are dropped and\n\
   a warning is logged via [g_warning ()].\n\n\
   - Properties received via the initial [GetAll()] call or via the\n\
   [::PropertiesChanged] signal (on the\n\
   org.freedesktop.DBus.Properties\n\
   interface) or set using \
   {{!Ocgio.Raw.D_bus_proxy.val-set_cached_property}[g_dbus_proxy_set_cached_property \
   ()]}\n\
   with a type signature mismatch are ignored and a warning is\n\
   logged via [g_warning ()].\n\n\
   Note that these checks are never done on methods, signals and\n\
   properties that are not referenced in the given\n\
   {{!Ocgio.Raw.D_bus_interface_info}[GDBusInterfaceInfo]}, since extending a \
   D-Bus interface on the\n\
   service-side is not considered an ABI break."]

external get_g_interface_name : t -> string
  = "ml_g_d_bus_proxy_get_g_interface_name"
(** The D-Bus interface name the proxy is for. *)

external get_g_name : t -> string = "ml_g_d_bus_proxy_get_g_name"
(** The well-known or unique name that the proxy is for. *)

external get_g_name_owner : t -> string = "ml_g_d_bus_proxy_get_g_name_owner"
(** The unique name that owns
    {{!Ocgio.Raw.D_bus_proxy.val-get_g_name}[GDBusProxy:g-name]} or [None] if
    no-one currently owns that name. You may connect to [GObject::notify] signal
    to track changes to this property. *)

external get_g_object_path : t -> string = "ml_g_d_bus_proxy_get_g_object_path"
(** The object path the proxy is for. *)

val on_g_signal :
  ?after:bool ->
  t ->
  callback:
    (sender_name:string -> signal_name:string -> parameters:Gvariant.t -> unit) ->
  Gobject.Signal.handler_id
(** Emitted when a signal from the remote object and interface that [proxy] is
    for, has been received.

    Since 2.72 this signal supports detailed connections. You can connect to the
    detailed signal [g-signal::x] in order to receive callbacks only when signal
    [x] is received from the remote object. *)
