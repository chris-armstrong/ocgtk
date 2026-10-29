(** [GDBusProxy] is a base class used for proxies to access a D-Bus interface on
    a remote object. A [GDBusProxy] can be constructed for both well-known and
    unique names.

    Its methods, signals and properties are on {!class-type-d_bus_proxy_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_proxy}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DBusProxy].}

    Implements:
    - {{!Ocgio.Async_initable.class-type-async_initable_t}Ocgio.Async_initable}
    - {{!Ocgio.D_bus_interface.class-type-d_bus_interface_t}Ocgio.D_bus_interface}
    - {{!Ocgio.Initable.class-type-initable_t}Ocgio.Initable}

    [GDBusProxy] is a base class used for proxies to access a D-Bus interface on
    a remote object. A [GDBusProxy] can be constructed for both well-known and
    unique names.

    By default, [GDBusProxy] will cache all properties (and listen to changes)
    of the remote object, and proxy all signals that get emitted. This behaviour
    can be changed by passing suitable [Gio.DBusProxyFlags] when the proxy is
    created. If the proxy is for a well-known name, the property cache is
    flushed when the name owner vanishes and reloaded when a name owner appears.

    The unique name owner of the proxy’s name is tracked and can be read from
    [Gio.DBusProxy:g-name-owner]. Connect to the [GObject.Object::notify] signal
    to get notified of changes. Additionally, only signals and property changes
    emitted from the current name owner are considered and calls are always sent
    to the current name owner. This avoids a number of race conditions when the
    name is lost by one owner and claimed by another. However, if no name owner
    currently exists, then calls will be sent to the well-known name which may
    result in the message bus launching an owner (unless
    [G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START] is set).

    If the proxy is for a stateless D-Bus service, where the name owner may be
    started and stopped between calls, the [Gio.DBusProxy:g-name-owner] tracking
    of [GDBusProxy] will cause the proxy to drop signal and property changes
    from the service after it has restarted for the first time. When interacting
    with a stateless D-Bus service, do not use [GDBusProxy] — use direct D-Bus
    method calls and signal connections.

    The generic [Gio.DBusProxy::g-properties-changed] and
    [Gio.DBusProxy::g-signal] signals are not very convenient to work with.
    Therefore, the recommended way of working with proxies is to subclass
    [GDBusProxy], and have more natural properties and signals in your derived
    class. This example shows how this can easily be done using the
    [gdbus-codegen] tool.

    A [GDBusProxy] instance can be used from multiple threads but note that all
    signals (e.g. [Gio.DBusProxy::g-signal],
    [Gio.DBusProxy::g-properties-changed] and [GObject.Object::notify]) are
    emitted in the thread-default main context (see
    [GLib.MainContext.push_thread_default]) of the thread where the instance was
    constructed.

    {b A watch proxy example}

    An example using a proxy for a well-known name can be found in
    {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-watch-proxy.c}
     [gdbus-example-watch-proxy.c]}. *)
class type d_bus_proxy_t = object
  inherit Async_initable.async_initable_t
  inherit D_bus_interface.d_bus_interface_t
  inherit Initable.initable_t

  (** {2:signals Signals} *)

  method on_g_signal :
    ?after:bool ->
    callback:
      (sender_name:string ->
      signal_name:string ->
      parameters:Gvariant.t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a signal from the remote object and interface that [proxy] is
      for, has been received.

      Since 2.72 this signal supports detailed connections. You can connect to
      the detailed signal [g-signal::x] in order to receive callbacks only when
      signal [x] is received from the remote object. *)

  (** {2:methods Methods} *)

  method call_finish :
    Async_result.async_result_t -> (Gvariant.t, GError.t) result
  (** Finishes an operation started with g_dbus_proxy_call(). *)

  method call_sync :
    string ->
    Gvariant.t option ->
    Enums.dbuscallflags ->
    int ->
    Cancellable.cancellable_t option ->
    (Gvariant.t, GError.t) result
  [@@ocaml.doc
    "Synchronously invokes the [method_name] method on [proxy].\n\n\
     If [method_name] contains any dots, then [name] is split into interface and\n\
     method name parts. This allows using [proxy] for invoking methods on\n\
     other interfaces.\n\n\
     If the [GDBusConnection] associated with [proxy] is disconnected then\n\
     the operation will fail with [G_IO_ERROR_CLOSED]. If\n\
     [cancellable] is canceled, the operation will fail with\n\
     [G_IO_ERROR_CANCELLED]. If [parameters] contains a value not\n\
     compatible with the D-Bus protocol, the operation fails with\n\
     [G_IO_ERROR_INVALID_ARGUMENT].\n\n\
     If the [parameters] [GVariant] is floating, it is consumed. This allows\n\
     convenient 'inline' use of g_variant_new(), e.g.:\n\n\
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
     g_dbus_proxy_call() for the asynchronous version of this\n\
     method.\n\n\
     If [proxy] has an expected interface (see\n\
     [GDBusProxy:g]-interface-info) and [method_name] is referenced by it,\n\
     then the return value is checked against the return type."]

  method get_cached_property : string -> Gvariant.t option
  (** Looks up the value for a property from the cache. This call does no
      blocking IO.

      If [proxy] has an expected interface (see [GDBusProxy:g]-interface-info)
      and [property_name] is referenced by it, then [value] is checked against
      the type of the property. *)

  method get_cached_property_names : unit -> string array option
  (** Gets the names of all cached properties on [proxy]. *)

  method get_connection : unit -> D_bus_connection.d_bus_connection_t
  (** Gets the connection [proxy] is for. *)

  method get_default_timeout : unit -> int
  (** Gets the timeout to use if -1 (specifying default timeout) is passed as
      [timeout_msec] in the g_dbus_proxy_call() and g_dbus_proxy_call_sync()
      functions.

      See the [GDBusProxy:g]-default-timeout property for more details. *)

  method get_flags : unit -> Enums.dbusproxyflags
  (** Gets the flags that [proxy] was constructed with. *)

  method get_interface_info : unit -> Raw.D_bus_interface_info.t option
  (** Returns the [GDBusInterfaceInfo], if any, specifying the interface that
      [proxy] conforms to. See the [GDBusProxy:g]-interface-info property for
      more details. *)

  method get_interface_name : unit -> string
  (** Gets the D-Bus interface name [proxy] is for. *)

  method get_name : unit -> string option
  (** Gets the name that [proxy] was constructed for.

      When connected to a message bus, this will usually be non-[None]. However,
      it may be [None] for a proxy that communicates using a peer-to-peer
      pattern. *)

  method get_name_owner : unit -> string option
  (** The unique name that owns the name that [proxy] is for or [None] if no-one
      currently owns that name. You may connect to the [GObject::notify] signal
      to track changes to the [GDBusProxy:g]-name-owner property. *)

  method get_object_path : unit -> string
  (** Gets the object path [proxy] is for. *)

  method set_cached_property : string -> Gvariant.t option -> unit
  [@@ocaml.doc
    "If [value] is not [None], sets the cached value for the property with\n\
     name [property_name] to the value in [value].\n\n\
     If [value] is [None], then the cached value is removed from the\n\
     property cache.\n\n\
     If [proxy] has an expected interface (see\n\
     [GDBusProxy:g]-interface-info) and [property_name] is referenced by\n\
     it, then [value] is checked against the type of the property.\n\n\
     If the [value] [GVariant] is floating, it is consumed. This allows\n\
     convenient 'inline' use of g_variant_new(), e.g.\n\n\
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

  method set_default_timeout : int -> unit
  (** Sets the timeout to use if -1 (specifying default timeout) is passed as
      [timeout_msec] in the g_dbus_proxy_call() and g_dbus_proxy_call_sync()
      functions.

      See the [GDBusProxy:g]-default-timeout property for more details. *)

  method set_interface_info : Raw.D_bus_interface_info.t option -> unit
  (** Ensure that interactions with [proxy] conform to the given interface. See
      the [GDBusProxy:g]-interface-info property for more details. *)

  (** {2:properties Properties} *)

  method g_connection : D_bus_connection.d_bus_connection_t
  (** The [GDBusConnection] the proxy is for. *)

  method g_default_timeout : int
  (** The timeout to use if -1 (specifying default timeout) is passed as
      [timeout_msec] in the g_dbus_proxy_call() and g_dbus_proxy_call_sync()
      functions.

      This allows applications to set a proxy-wide timeout for all remote method
      invocations on the proxy. If this property is -1, the default timeout
      (typically 25 seconds) is used. If set to [G_MAXINT], then no timeout is
      used. *)

  method set_g_default_timeout : int -> unit
  (** The timeout to use if -1 (specifying default timeout) is passed as
      [timeout_msec] in the g_dbus_proxy_call() and g_dbus_proxy_call_sync()
      functions.

      This allows applications to set a proxy-wide timeout for all remote method
      invocations on the proxy. If this property is -1, the default timeout
      (typically 25 seconds) is used. If set to [G_MAXINT], then no timeout is
      used. *)

  method g_flags : Enums.dbusproxyflags
  (** Flags from the [GDBusProxyFlags] enumeration. *)

  method g_interface_info : Raw.D_bus_interface_info.t
  [@@ocaml.doc
    "Ensure that interactions with this proxy conform to the given\n\
     interface. This is mainly to ensure that malformed data received\n\
     from the other peer is ignored. The given [GDBusInterfaceInfo] is\n\
     said to be the \"expected interface\".\n\n\
     The checks performed are:\n\n\
     - When completing a method call, if the type signature of\n\
     the reply message isn't what's expected, the reply is\n\
     discarded and the [GError] is set to [G_IO_ERROR_INVALID_ARGUMENT].\n\n\
     - Received signals that have a type signature mismatch are dropped and\n\
     a warning is logged via g_warning().\n\n\
     - Properties received via the initial [GetAll()] call or via the\n\
     [::PropertiesChanged] signal (on the\n\
     org.freedesktop.DBus.Properties\n\
     interface) or set using g_dbus_proxy_set_cached_property()\n\
     with a type signature mismatch are ignored and a warning is\n\
     logged via g_warning().\n\n\
     Note that these checks are never done on methods, signals and\n\
     properties that are not referenced in the given\n\
     [GDBusInterfaceInfo], since extending a D-Bus interface on the\n\
     service-side is not considered an ABI break."]

  method set_g_interface_info : Raw.D_bus_interface_info.t -> unit
  [@@ocaml.doc
    "Ensure that interactions with this proxy conform to the given\n\
     interface. This is mainly to ensure that malformed data received\n\
     from the other peer is ignored. The given [GDBusInterfaceInfo] is\n\
     said to be the \"expected interface\".\n\n\
     The checks performed are:\n\n\
     - When completing a method call, if the type signature of\n\
     the reply message isn't what's expected, the reply is\n\
     discarded and the [GError] is set to [G_IO_ERROR_INVALID_ARGUMENT].\n\n\
     - Received signals that have a type signature mismatch are dropped and\n\
     a warning is logged via g_warning().\n\n\
     - Properties received via the initial [GetAll()] call or via the\n\
     [::PropertiesChanged] signal (on the\n\
     org.freedesktop.DBus.Properties\n\
     interface) or set using g_dbus_proxy_set_cached_property()\n\
     with a type signature mismatch are ignored and a warning is\n\
     logged via g_warning().\n\n\
     Note that these checks are never done on methods, signals and\n\
     properties that are not referenced in the given\n\
     [GDBusInterfaceInfo], since extending a D-Bus interface on the\n\
     service-side is not considered an ABI break."]

  method g_interface_name : string
  (** The D-Bus interface name the proxy is for. *)

  method g_name : string
  (** The well-known or unique name that the proxy is for. *)

  method g_name_owner : string
  (** The unique name that owns [GDBusProxy:g]-name or [None] if no-one
      currently owns that name. You may connect to [GObject::notify] signal to
      track changes to this property. *)

  method g_object_path : string
  (** The object path the proxy is for. *)

  (** {2:conversions Conversions} *)

  method as_d_bus_proxy : Raw.D_bus_proxy.t
end

class d_bus_proxy : Raw.D_bus_proxy.t -> d_bus_proxy_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_proxy.t}. *)

(** {1:description Description}

    [GDBusProxy] is a base class used for proxies to access a D-Bus interface on
    a remote object. A [GDBusProxy] can be constructed for both well-known and
    unique names.

    By default, [GDBusProxy] will cache all properties (and listen to changes)
    of the remote object, and proxy all signals that get emitted. This behaviour
    can be changed by passing suitable [Gio.DBusProxyFlags] when the proxy is
    created. If the proxy is for a well-known name, the property cache is
    flushed when the name owner vanishes and reloaded when a name owner appears.

    The unique name owner of the proxy’s name is tracked and can be read from
    [Gio.DBusProxy:g-name-owner]. Connect to the [GObject.Object::notify] signal
    to get notified of changes. Additionally, only signals and property changes
    emitted from the current name owner are considered and calls are always sent
    to the current name owner. This avoids a number of race conditions when the
    name is lost by one owner and claimed by another. However, if no name owner
    currently exists, then calls will be sent to the well-known name which may
    result in the message bus launching an owner (unless
    [G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START] is set).

    If the proxy is for a stateless D-Bus service, where the name owner may be
    started and stopped between calls, the [Gio.DBusProxy:g-name-owner] tracking
    of [GDBusProxy] will cause the proxy to drop signal and property changes
    from the service after it has restarted for the first time. When interacting
    with a stateless D-Bus service, do not use [GDBusProxy] — use direct D-Bus
    method calls and signal connections.

    The generic [Gio.DBusProxy::g-properties-changed] and
    [Gio.DBusProxy::g-signal] signals are not very convenient to work with.
    Therefore, the recommended way of working with proxies is to subclass
    [GDBusProxy], and have more natural properties and signals in your derived
    class. This example shows how this can easily be done using the
    [gdbus-codegen] tool.

    A [GDBusProxy] instance can be used from multiple threads but note that all
    signals (e.g. [Gio.DBusProxy::g-signal],
    [Gio.DBusProxy::g-properties-changed] and [GObject.Object::notify]) are
    emitted in the thread-default main context (see
    [GLib.MainContext.push_thread_default]) of the thread where the instance was
    constructed.

    {b A watch proxy example}

    An example using a proxy for a well-known name can be found in
    {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-watch-proxy.c}
     [gdbus-example-watch-proxy.c]}. *)

(** {1:constructors Constructors} *)

val new_finish : Async_result.async_result_t -> (d_bus_proxy_t, GError.t) result
(** Finishes creating a [GDBusProxy]. *)

val new_for_bus_finish :
  Async_result.async_result_t -> (d_bus_proxy_t, GError.t) result
(** Finishes creating a [GDBusProxy]. *)

val new_for_bus_sync :
  Enums.bustype ->
  Enums.dbusproxyflags ->
  Raw.D_bus_interface_info.t option ->
  string ->
  string ->
  string ->
  Cancellable.cancellable_t option ->
  (d_bus_proxy_t, GError.t) result
(** Like g_dbus_proxy_new_sync() but takes a [GBusType] instead of a
    [GDBusConnection].

    [GDBusProxy] is used in this \[example\][Gio.DBusProxy]. *)

val new_sync :
  D_bus_connection.d_bus_connection_t ->
  Enums.dbusproxyflags ->
  Raw.D_bus_interface_info.t option ->
  string option ->
  string ->
  string ->
  Cancellable.cancellable_t option ->
  (d_bus_proxy_t, GError.t) result
(** Creates a proxy for accessing [interface_name] on the remote object at
    [object_path] owned by [name] at [connection] and synchronously loads D-Bus
    properties unless the [G_DBUS_PROXY_FLAGS_DO_NOT_LOAD_PROPERTIES] flag is
    used.

    If the [G_DBUS_PROXY_FLAGS_DO_NOT_CONNECT_SIGNALS] flag is not set, also
    sets up match rules for signals. Connect to the [GDBusProxy::g]-signal
    signal to handle signals from the remote object.

    If both [G_DBUS_PROXY_FLAGS_DO_NOT_LOAD_PROPERTIES] and
    [G_DBUS_PROXY_FLAGS_DO_NOT_CONNECT_SIGNALS] are set, this constructor is
    guaranteed to return immediately without blocking.

    If [name] is a well-known name and the
    [G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START] and
    [G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START_AT_CONSTRUCTION] flags aren't set and
    no name owner currently exists, the message bus will be requested to launch
    a name owner for the name.

    This is a synchronous failable constructor. See g_dbus_proxy_new() and
    g_dbus_proxy_new_finish() for the asynchronous version.

    [GDBusProxy] is used in this \[example\][Gio.DBusProxy]. *)
