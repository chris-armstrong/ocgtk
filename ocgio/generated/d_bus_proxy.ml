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
  (** Emitted when a signal from the remote object and interface that [proxy] is
      for, has been received.

      Since 2.72 this signal supports detailed connections. You can connect to
      the detailed signal [g-signal::x] in order to receive callbacks only when
      signal [x] is received from the remote object. *)

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

      When connected to a message bus, this will usually be non-[NULL]. However,
      it may be [NULL] for a proxy that communicates using a peer-to-peer
      pattern. *)

  method get_name_owner : unit -> string option
  (** The unique name that owns the name that [proxy] is for or [NULL] if no-one
      currently owns that name. You may connect to the [GObject::notify] signal
      to track changes to the [GDBusProxy:g]-name-owner property. *)

  method get_object_path : unit -> string
  (** Gets the object path [proxy] is for. *)

  method set_cached_property : string -> Gvariant.t option -> unit
  [@@ocaml.doc
    "If [value] is not [NULL], sets the cached value for the property with\n\
     name [property_name] to the value in [value].\n\n\
     If [value] is [NULL], then the cached value is removed from the\n\
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
  (** The unique name that owns [GDBusProxy:g]-name or [NULL] if no-one
      currently owns that name. You may connect to [GObject::notify] signal to
      track changes to this property. *)

  method g_object_path : string
  (** The object path the proxy is for. *)

  method as_d_bus_proxy : Raw.D_bus_proxy.t
end

(* High-level class for DBusProxy *)
class d_bus_proxy (obj : Raw.D_bus_proxy.t) : d_bus_proxy_t =
  object (self)
    inherit Async_initable.async_initable (Raw.Async_initable.from_gobject obj)

    inherit
      D_bus_interface_and__d_bus_object.d_bus_interface
        (Raw.D_bus_interface.from_gobject obj)

    inherit Initable.initable (Raw.Initable.from_gobject obj)

    method on_g_signal ?(after = false) ~callback () =
      Raw.D_bus_proxy.on_g_signal ~after self#as_d_bus_proxy ~callback

    method call_finish :
        Async_result.async_result_t -> (Gvariant.t, GError.t) result =
      fun res ->
        let res = res#as_async_result in
        Raw.D_bus_proxy.call_finish obj res

    method call_sync :
        string ->
        Gvariant.t option ->
        Enums.dbuscallflags ->
        int ->
        Cancellable.cancellable_t option ->
        (Gvariant.t, GError.t) result =
      fun method_name parameters flags timeout_msec cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.D_bus_proxy.call_sync obj method_name parameters flags timeout_msec
          cancellable

    method get_cached_property : string -> Gvariant.t option =
      fun property_name -> Raw.D_bus_proxy.get_cached_property obj property_name

    method get_cached_property_names : unit -> string array option =
      fun () -> Raw.D_bus_proxy.get_cached_property_names obj

    method get_connection : unit -> D_bus_connection.d_bus_connection_t =
      fun () ->
        new D_bus_connection.d_bus_connection
          (Raw.D_bus_proxy.get_connection obj)

    method get_default_timeout : unit -> int =
      fun () -> Raw.D_bus_proxy.get_default_timeout obj

    method get_flags : unit -> Enums.dbusproxyflags =
      fun () -> Raw.D_bus_proxy.get_flags obj

    method get_interface_info : unit -> Raw.D_bus_interface_info.t option =
      fun () -> Raw.D_bus_proxy.get_interface_info obj

    method get_interface_name : unit -> string =
      fun () -> Raw.D_bus_proxy.get_interface_name obj

    method get_name : unit -> string option =
      fun () -> Raw.D_bus_proxy.get_name obj

    method get_name_owner : unit -> string option =
      fun () -> Raw.D_bus_proxy.get_name_owner obj

    method get_object_path : unit -> string =
      fun () -> Raw.D_bus_proxy.get_object_path obj

    method set_cached_property : string -> Gvariant.t option -> unit =
      fun property_name value ->
        Raw.D_bus_proxy.set_cached_property obj property_name value

    method set_default_timeout : int -> unit =
      fun timeout_msec -> Raw.D_bus_proxy.set_default_timeout obj timeout_msec

    method set_interface_info : Raw.D_bus_interface_info.t option -> unit =
      fun info -> Raw.D_bus_proxy.set_interface_info obj info

    method g_connection =
      new D_bus_connection.d_bus_connection
        (Raw.D_bus_proxy.get_g_connection obj)

    method g_default_timeout = Raw.D_bus_proxy.get_g_default_timeout obj
    method set_g_default_timeout v = Raw.D_bus_proxy.set_g_default_timeout obj v
    method g_flags = Raw.D_bus_proxy.get_g_flags obj
    method g_interface_info = Raw.D_bus_proxy.get_g_interface_info obj
    method set_g_interface_info v = Raw.D_bus_proxy.set_g_interface_info obj v
    method g_interface_name = Raw.D_bus_proxy.get_g_interface_name obj
    method g_name = Raw.D_bus_proxy.get_g_name obj
    method g_name_owner = Raw.D_bus_proxy.get_g_name_owner obj
    method g_object_path = Raw.D_bus_proxy.get_g_object_path obj
    method as_d_bus_proxy = obj
  end

let new_finish (res : Async_result.async_result_t) :
    (d_bus_proxy_t, GError.t) result =
  let res = res#as_async_result in
  let obj_ = Raw.D_bus_proxy.new_finish res in
  Result.map (fun obj_ -> new d_bus_proxy obj_) obj_

let new_for_bus_finish (res : Async_result.async_result_t) :
    (d_bus_proxy_t, GError.t) result =
  let res = res#as_async_result in
  let obj_ = Raw.D_bus_proxy.new_for_bus_finish res in
  Result.map (fun obj_ -> new d_bus_proxy obj_) obj_

let new_for_bus_sync (bus_type : Enums.bustype) (flags : Enums.dbusproxyflags)
    (info : Raw.D_bus_interface_info.t option) (name : string)
    (object_path : string) (interface_name : string)
    (cancellable : Cancellable.cancellable_t option) :
    (d_bus_proxy_t, GError.t) result =
  let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
  let obj_ =
    Raw.D_bus_proxy.new_for_bus_sync bus_type flags info name object_path
      interface_name cancellable
  in
  Result.map (fun obj_ -> new d_bus_proxy obj_) obj_

let new_sync (connection : D_bus_connection.d_bus_connection_t)
    (flags : Enums.dbusproxyflags) (info : Raw.D_bus_interface_info.t option)
    (name : string option) (object_path : string) (interface_name : string)
    (cancellable : Cancellable.cancellable_t option) :
    (d_bus_proxy_t, GError.t) result =
  let connection = connection#as_d_bus_connection in
  let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
  let obj_ =
    Raw.D_bus_proxy.new_sync connection flags info name object_path
      interface_name cancellable
  in
  Result.map (fun obj_ -> new d_bus_proxy obj_) obj_
