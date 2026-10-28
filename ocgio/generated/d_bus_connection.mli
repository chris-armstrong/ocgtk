(** The [GDBusConnection] type is used for D-Bus connections to remote peers
    such as a message buses.

    Its methods, signals and properties are on {!class-type-d_bus_connection_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_connection}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DBusConnection].}

    Inherits from: [GObject.Object]

    Implements:
    - {{!Ocgio.Async_initable.class-type-async_initable_t}Ocgio.Async_initable}
    - {{!Ocgio.Initable.class-type-initable_t}Ocgio.Initable}

    The [GDBusConnection] type is used for D-Bus connections to remote peers
    such as a message buses.

    It is a low-level API that offers a lot of flexibility. For instance, it
    lets you establish a connection over any transport that can by represented
    as a [Gio.IOStream].

    This class is rarely used directly in D-Bus clients. If you are writing a
    D-Bus client, it is often easier to use the [Gio.bus_own_name],
    [Gio.bus_watch_name] or [Gio.DBusProxy.new_for_bus] APIs.

    As an exception to the usual GLib rule that a particular object must not be
    used by two threads at the same time, [GDBusConnection]s methods may be
    called from any thread. This is so that [Gio.bus_get] and [Gio.bus_get_sync]
    can safely return the same [GDBusConnection] when called from any thread.

    Most of the ways to obtain a [GDBusConnection] automatically initialize it
    (i.e. connect to D-Bus): for instance, [Gio.DBusConnection.new] and
    [Gio.bus_get], and the synchronous versions of those methods, give you an
    initialized connection. Language bindings for GIO should use
    [Gio.Initable.new] or [Gio.AsyncInitable.new_async], which also initialize
    the connection.

    If you construct an uninitialized [GDBusConnection], such as via
    [GObject.Object.new], you must initialize it via [Gio.Initable.init] or
    [Gio.AsyncInitable.init_async] before using its methods or properties.
    Calling methods or accessing properties on a [GDBusConnection] that has not
    completed initialization successfully is considered to be invalid, and leads
    to undefined behaviour. In particular, if initialization fails with a
    [GError], the only valid thing you can do with that [GDBusConnection] is to
    free it with [GObject.Object.unref].

    {b An example D-Bus server}

    Here is an example for a D-Bus server:
    {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-server.c}gdbus-example-server.c}

    {b An example for exporting a subtree}

    Here is an example for exporting a subtree:
    {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-subtree.c}gdbus-example-subtree.c}

    {b An example for file descriptor passing}

    Here is an example for passing UNIX file descriptors:
    {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-unix-fd-client.c}gdbus-unix-fd-client.c}

    {b An example for exporting a GObject}

    Here is an example for exporting a [GObject]:
    {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-export.c}gdbus-example-export.c}
*)
class type d_bus_connection_t = object
  inherit Async_initable.async_initable_t
  inherit Initable.initable_t

  (** {2:methods Methods} *)

  method call_finish :
    Async_result.async_result_t -> (Gvariant.t, GError.t) result
  (** Finishes an operation started with g_dbus_connection_call(). *)

  method call_sync :
    string option ->
    string ->
    string ->
    string ->
    Gvariant.t option ->
    Gvariant_type.t option ->
    Enums.dbuscallflags ->
    int ->
    Cancellable.cancellable_t option ->
    (Gvariant.t, GError.t) result
  [@@ocaml.doc
    "Synchronously invokes the [method_name] method on the\n\
     [interface_name] D-Bus interface on the remote object at\n\
     [object_path] owned by [bus_name].\n\n\
     If [connection] is closed then the operation will fail with\n\
     [G_IO_ERROR_CLOSED]. If [cancellable] is canceled, the\n\
     operation will fail with [G_IO_ERROR_CANCELLED]. If [parameters]\n\
     contains a value not compatible with the D-Bus protocol, the operation\n\
     fails with [G_IO_ERROR_INVALID_ARGUMENT].\n\n\
     If [reply_type] is non-[NULL] then the reply will be checked for having\n\
     this type and an error will be raised if it does not match.  Said\n\
     another way, if you give a [reply_type] then any non-[NULL] return\n\
     value will be of this type.\n\n\
     If the [parameters] [GVariant] is floating, it is consumed.\n\
     This allows convenient 'inline' use of g_variant_new(), e.g.:\n\n\
     {[\n\
    \ g_dbus_connection_call_sync (connection,\n\
    \                              \"org.freedesktop.StringThings\",\n\
    \                              \"/org/freedesktop/StringThings\",\n\
    \                              \"org.freedesktop.StringThings\",\n\
    \                              \"TwoStrings\",\n\
    \                              g_variant_new (\"(ss)\",\n\
    \                                             \"Thing One\",\n\
    \                                             \"Thing Two\"),\n\
    \                              NULL,\n\
    \                              G_DBUS_CALL_FLAGS_NONE,\n\
    \                              -1,\n\
    \                              NULL,\n\
    \                              &error);\n\
     ]}\n\n\
     The calling thread is blocked until a reply is received. See\n\
     g_dbus_connection_call() for the asynchronous version of\n\
     this method."]

  method close_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes an operation started with g_dbus_connection_close(). *)

  method close_sync :
    Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Synchronously closes [connection]. The calling thread is blocked until
      this is done. See g_dbus_connection_close() for the asynchronous version
      of this method and more details about what it does. *)

  method emit_signal :
    string option ->
    string ->
    string ->
    string ->
    Gvariant.t option ->
    (bool, GError.t) result
  (** Emits a signal.

      If the parameters GVariant is floating, it is consumed.

      This can only fail if [parameters] is not compatible with the D-Bus
      protocol ([G_IO_ERROR_INVALID_ARGUMENT]), or if [connection] has been
      closed ([G_IO_ERROR_CLOSED]). *)

  method export_action_group :
    string -> Action_group.action_group_t -> (int, GError.t) result
  (** Exports [action_group] on [connection] at [object_path].

      The implemented D-Bus API should be considered private. It is subject to
      change in the future.

      A given object path can only have one action group exported on it. If this
      constraint is violated, the export will fail and 0 will be returned (with
      [error] set accordingly).

      You can unexport the action group using
      [Gio.DBusConnection.unexport_action_group] with the return value of this
      function.

      The thread default main context is taken at the time of this call. All
      incoming action activations and state change requests are reported from
      this context. Any changes on the action group that cause it to emit
      signals must also come from this same context. Since incoming action
      activations and state change requests are rather likely to cause changes
      on the action group, this effectively limits a given action group to being
      exported from only one main context. *)

  method export_menu_model :
    string -> Menu_model.menu_model_t -> (int, GError.t) result
  (** Exports [menu] on [connection] at [object_path].

      The implemented D-Bus API should be considered private. It is subject to
      change in the future.

      An object path can only have one menu model exported on it. If this
      constraint is violated, the export will fail and 0 will be returned (with
      [error] set accordingly).

      Exporting menus with sections containing more than
      [G_MENU_EXPORTER_MAX_SECTION_SIZE] items is not supported and results in
      undefined behavior.

      You can unexport the menu model using
      g_dbus_connection_unexport_menu_model() with the return value of this
      function. *)

  method flush_finish : Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes an operation started with g_dbus_connection_flush(). *)

  method flush_sync :
    Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Synchronously flushes [connection]. The calling thread is blocked until
      this is done. See g_dbus_connection_flush() for the asynchronous version
      of this method and more details about what it does. *)

  method get_capabilities : unit -> Enums.dbuscapabilityflags
  (** Gets the capabilities negotiated with the remote peer *)

  method get_exit_on_close : unit -> bool
  (** Gets whether the process is terminated when [connection] is closed by the
      remote peer. See [GDBusConnection:exit]-on-close for more details. *)

  method get_flags : unit -> Enums.dbusconnectionflags
  (** Gets the flags used to construct this connection *)

  method get_guid : unit -> string
  (** The GUID of the peer performing the role of server when authenticating.
      See [GDBusConnection:guid] for more details. *)

  method get_last_serial : unit -> UInt32.t
  (** Retrieves the last serial number assigned to a [GDBusMessage] on the
      current thread. This includes messages sent via both low-level API such as
      g_dbus_connection_send_message() as well as high-level API such as
      g_dbus_connection_emit_signal(), g_dbus_connection_call() or
      g_dbus_proxy_call(). *)

  method get_peer_credentials : unit -> Credentials.credentials_t option
  (** Gets the credentials of the authenticated peer. This will always return
      [NULL] unless [connection] acted as a server (e.g.
      [G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER] was passed) when set up
      and the client passed credentials as part of the authentication process.

      In a message bus setup, the message bus is always the server and each
      application is a client. So this method will always return [NULL] for
      message bus clients. *)

  method get_stream : unit -> Io_stream.io_stream_t
  (** Gets the underlying stream used for IO.

      While the [GDBusConnection] is active, it will interact with this stream
      from a worker thread, so it is not safe to interact with the stream
      directly. *)

  method get_unique_name : unit -> string option
  (** Gets the unique name of [connection] as assigned by the message bus. This
      can also be used to figure out if [connection] is a message bus
      connection. *)

  method is_closed : unit -> bool
  (** Gets whether [connection] is closed. *)

  method remove_filter : int -> unit
  (** Removes a filter.

      Note that since filters run in a different thread, there is a race
      condition where it is possible that the filter will be running even after
      calling g_dbus_connection_remove_filter(), so you cannot just free data
      that the filter might be using. Instead, you should pass a
      [GDestroyNotify] to g_dbus_connection_add_filter(), which will be called
      when it is guaranteed that the data is no longer needed. *)

  method send_message_with_reply_finish :
    Async_result.async_result_t ->
    (D_bus_message.d_bus_message_t, GError.t) result
  (** Finishes an operation started with
      g_dbus_connection_send_message_with_reply().

      Note that [error] is only set if a local in-process error occurred. That
      is to say that the returned [GDBusMessage] object may be of type
      [G_DBUS_MESSAGE_TYPE_ERROR]. Use g_dbus_message_to_gerror() to transcode
      this to a [GError].

      See this \[server\][Gio.DBusConnection] and \[client\][Gio.DBusConnection]
      for an example of how to use this low-level API to send and receive UNIX
      file descriptors. *)

  method set_exit_on_close : bool -> unit
  (** Sets whether the process should be terminated when [connection] is closed
      by the remote peer. See [GDBusConnection:exit]-on-close for more details.

      Note that this function should be used with care. Most modern UNIX
      desktops tie the notion of a user session with the session bus, and expect
      all of a user's applications to quit when their bus connection goes away.
      If you are setting [exit_on_close] to [FALSE] for the shared session bus
      connection, you should make sure that your application exits when the user
      session ends. *)

  method signal_unsubscribe : int -> unit
  (** Unsubscribes from signals.

      Note that there may still be D-Bus traffic to process (relating to this
      signal subscription) in the current thread-default [GMainContext] after
      this function has returned. You should continue to iterate the
      [GMainContext] until the [GDestroyNotify] function passed to
      g_dbus_connection_signal_subscribe() is called, in order to avoid memory
      leaks through callbacks queued on the [GMainContext] after it’s stopped
      being iterated. Alternatively, any idle source with a priority lower than
      [G_PRIORITY_DEFAULT] that was scheduled after unsubscription, also
      indicates that all resources of this subscription are released. *)

  method start_message_processing : unit -> unit
  (** If [connection] was created with
      [G_DBUS_CONNECTION_FLAGS_DELAY_MESSAGE_PROCESSING], this method starts
      processing messages. Does nothing on if [connection] wasn't created with
      this flag or if the method has already been called. *)

  method unexport_action_group : int -> unit
  (** Reverses the effect of a previous call to
      [Gio.DBusConnection.export_action_group].

      It is an error to call this function with an ID that wasn’t returned from
      [Gio.DBusConnection.export_action_group] or to call it with the same ID
      more than once. *)

  method unexport_menu_model : int -> unit
  (** Reverses the effect of a previous call to
      g_dbus_connection_export_menu_model().

      It is an error to call this function with an ID that wasn't returned from
      g_dbus_connection_export_menu_model() or to call it with the same ID more
      than once. *)

  method unregister_object : int -> bool
  (** Unregisters an object. *)

  method unregister_subtree : int -> bool
  (** Unregisters a subtree. *)

  (** {2:conversions Conversions} *)

  method as_d_bus_connection : Raw.D_bus_connection.t
end

class d_bus_connection : Raw.D_bus_connection.t -> d_bus_connection_t
(** Wraps a raw handle of {!Ocgio.Raw.D_bus_connection.t}. *)

(** {1:description Description}

    The [GDBusConnection] type is used for D-Bus connections to remote peers
    such as a message buses.

    It is a low-level API that offers a lot of flexibility. For instance, it
    lets you establish a connection over any transport that can by represented
    as a [Gio.IOStream].

    This class is rarely used directly in D-Bus clients. If you are writing a
    D-Bus client, it is often easier to use the [Gio.bus_own_name],
    [Gio.bus_watch_name] or [Gio.DBusProxy.new_for_bus] APIs.

    As an exception to the usual GLib rule that a particular object must not be
    used by two threads at the same time, [GDBusConnection]s methods may be
    called from any thread. This is so that [Gio.bus_get] and [Gio.bus_get_sync]
    can safely return the same [GDBusConnection] when called from any thread.

    Most of the ways to obtain a [GDBusConnection] automatically initialize it
    (i.e. connect to D-Bus): for instance, [Gio.DBusConnection.new] and
    [Gio.bus_get], and the synchronous versions of those methods, give you an
    initialized connection. Language bindings for GIO should use
    [Gio.Initable.new] or [Gio.AsyncInitable.new_async], which also initialize
    the connection.

    If you construct an uninitialized [GDBusConnection], such as via
    [GObject.Object.new], you must initialize it via [Gio.Initable.init] or
    [Gio.AsyncInitable.init_async] before using its methods or properties.
    Calling methods or accessing properties on a [GDBusConnection] that has not
    completed initialization successfully is considered to be invalid, and leads
    to undefined behaviour. In particular, if initialization fails with a
    [GError], the only valid thing you can do with that [GDBusConnection] is to
    free it with [GObject.Object.unref].

    {b An example D-Bus server}

    Here is an example for a D-Bus server:
    {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-server.c}gdbus-example-server.c}

    {b An example for exporting a subtree}

    Here is an example for exporting a subtree:
    {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-subtree.c}gdbus-example-subtree.c}

    {b An example for file descriptor passing}

    Here is an example for passing UNIX file descriptors:
    {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-unix-fd-client.c}gdbus-unix-fd-client.c}

    {b An example for exporting a GObject}

    Here is an example for exporting a [GObject]:
    {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-export.c}gdbus-example-export.c}
*)

(** {1:constructors Constructors} *)

val new_finish :
  Async_result.async_result_t -> (d_bus_connection_t, GError.t) result
(** Finishes an operation started with g_dbus_connection_new(). *)

val new_for_address_finish :
  Async_result.async_result_t -> (d_bus_connection_t, GError.t) result
(** Finishes an operation started with g_dbus_connection_new_for_address(). *)

val new_for_address_sync :
  string ->
  Enums.dbusconnectionflags ->
  D_bus_auth_observer.d_bus_auth_observer_t option ->
  Cancellable.cancellable_t option ->
  (d_bus_connection_t, GError.t) result
(** Synchronously connects and sets up a D-Bus client connection for exchanging
    D-Bus messages with an endpoint specified by [address] which must be in the
    {{:https://dbus.freedesktop.org/doc/dbus-specification.html#addresses}D-Bus
     address format}.

    This constructor can only be used to initiate client-side connections - use
    g_dbus_connection_new_sync() if you need to act as the server. In
    particular, [flags] cannot contain the
    [G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER],
    [G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_ALLOW_ANONYMOUS] or
    [G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_REQUIRE_SAME_USER] flags.

    This is a synchronous failable constructor. See
    g_dbus_connection_new_for_address() for the asynchronous version.

    If [observer] is not [NULL] it may be used to control the authentication
    process. *)

val new_sync :
  Io_stream.io_stream_t ->
  string option ->
  Enums.dbusconnectionflags ->
  D_bus_auth_observer.d_bus_auth_observer_t option ->
  Cancellable.cancellable_t option ->
  (d_bus_connection_t, GError.t) result
(** Synchronously sets up a D-Bus connection for exchanging D-Bus messages with
    the end represented by [stream].

    If [stream] is a [GSocketConnection], then the corresponding [GSocket] will
    be put into non-blocking mode.

    The D-Bus connection will interact with [stream] from a worker thread. As a
    result, the caller should not interact with [stream] after this method has
    been called, except by calling g_object_unref() on it.

    If [observer] is not [NULL] it may be used to control the authentication
    process.

    This is a synchronous failable constructor. See g_dbus_connection_new() for
    the asynchronous version. *)
