(** [GDBusProxy] is a base class used for proxies to access a D-Bus interface on
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
     [gdbus-example-watch-proxy.c]}.

    Its methods, signals and properties are on {!class-type-d_bus_proxy_t}. The
    functions it is built on are in {!Ocgio.Raw.D_bus_proxy}. *)

(** The methods, signals and properties of a [GDBusProxy]. *)
class type d_bus_proxy_t = object
  inherit Async_initable.async_initable_t
  inherit D_bus_interface_and__d_bus_object.d_bus_interface_t
  inherit Initable.initable_t

  method on_g_signal :
    ?after:bool ->
    callback:
      (sender_name:string ->
      signal_name:string ->
      parameters:Gvariant.t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method call_finish :
    Async_result.async_result_t -> (Gvariant.t, GError.t) result

  method call_sync :
    string ->
    Gvariant.t option ->
    Enums.dbuscallflags ->
    int ->
    Cancellable.cancellable_t option ->
    (Gvariant.t, GError.t) result

  method get_cached_property : string -> Gvariant.t option
  method get_cached_property_names : unit -> string array option
  method get_connection : unit -> D_bus_connection.d_bus_connection_t
  method get_default_timeout : unit -> int
  method get_flags : unit -> Enums.dbusproxyflags
  method get_interface_info : unit -> Raw.D_bus_interface_info.t option
  method get_interface_name : unit -> string
  method get_name : unit -> string option
  method get_name_owner : unit -> string option
  method get_object_path : unit -> string
  method set_cached_property : string -> Gvariant.t option -> unit
  method set_default_timeout : int -> unit
  method set_interface_info : Raw.D_bus_interface_info.t option -> unit
  method g_connection : D_bus_connection.d_bus_connection_t
  method g_default_timeout : int
  method set_g_default_timeout : int -> unit
  method g_flags : Enums.dbusproxyflags
  method g_interface_info : Raw.D_bus_interface_info.t
  method set_g_interface_info : Raw.D_bus_interface_info.t -> unit
  method g_interface_name : string
  method g_name : string
  method g_name_owner : string
  method g_object_path : string
  method as_d_bus_proxy : Raw.D_bus_proxy.t
end

class d_bus_proxy : Raw.D_bus_proxy.t -> d_bus_proxy_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_proxy.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GDBusProxy], give one already wrapped. *)

val new_finish : Async_result.async_result_t -> (d_bus_proxy_t, GError.t) result

val new_for_bus_finish :
  Async_result.async_result_t -> (d_bus_proxy_t, GError.t) result

val new_for_bus_sync :
  Enums.bustype ->
  Enums.dbusproxyflags ->
  Raw.D_bus_interface_info.t option ->
  string ->
  string ->
  string ->
  Cancellable.cancellable_t option ->
  (d_bus_proxy_t, GError.t) result

val new_sync :
  D_bus_connection.d_bus_connection_t ->
  Enums.dbusproxyflags ->
  Raw.D_bus_interface_info.t option ->
  string option ->
  string ->
  string ->
  Cancellable.cancellable_t option ->
  (d_bus_proxy_t, GError.t) result
