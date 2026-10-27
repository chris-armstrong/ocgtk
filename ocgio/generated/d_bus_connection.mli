(** The [GDBusConnection] type is used for D-Bus connections to remote peers
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

    Its methods, signals and properties are on {!class-type-d_bus_connection_t}.
    The functions it is built on are in {!Ocgio.Raw.D_bus_connection}. *)

(** The methods, signals and properties of a [GDBusConnection]. *)
class type d_bus_connection_t = object
  inherit Async_initable.async_initable_t
  inherit Initable.initable_t

  method call_finish :
    Async_result.async_result_t -> (Gvariant.t, GError.t) result

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

  method close_finish : Async_result.async_result_t -> (bool, GError.t) result

  method close_sync :
    Cancellable.cancellable_t option -> (bool, GError.t) result

  method emit_signal :
    string option ->
    string ->
    string ->
    string ->
    Gvariant.t option ->
    (bool, GError.t) result

  method export_action_group :
    string -> Action_group.action_group_t -> (int, GError.t) result

  method export_menu_model :
    string ->
    Menu_link_iter_and__menu_model.menu_model_t ->
    (int, GError.t) result

  method flush_finish : Async_result.async_result_t -> (bool, GError.t) result

  method flush_sync :
    Cancellable.cancellable_t option -> (bool, GError.t) result

  method get_capabilities : unit -> Enums.dbuscapabilityflags
  method get_exit_on_close : unit -> bool
  method get_flags : unit -> Enums.dbusconnectionflags
  method get_guid : unit -> string
  method get_last_serial : unit -> UInt32.t
  method get_peer_credentials : unit -> Credentials.credentials_t option
  method get_stream : unit -> Io_stream.io_stream_t
  method get_unique_name : unit -> string option
  method is_closed : unit -> bool
  method remove_filter : int -> unit

  method send_message_with_reply_finish :
    Async_result.async_result_t ->
    (D_bus_message.d_bus_message_t, GError.t) result

  method set_exit_on_close : bool -> unit
  method signal_unsubscribe : int -> unit
  method start_message_processing : unit -> unit
  method unexport_action_group : int -> unit
  method unexport_menu_model : int -> unit
  method unregister_object : int -> bool
  method unregister_subtree : int -> bool
  method as_d_bus_connection : Raw.D_bus_connection.t
end

class d_bus_connection : Raw.D_bus_connection.t -> d_bus_connection_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_connection.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GDBusConnection], give one already wrapped. *)

val new_finish :
  Async_result.async_result_t -> (d_bus_connection_t, GError.t) result

val new_for_address_finish :
  Async_result.async_result_t -> (d_bus_connection_t, GError.t) result

val new_for_address_sync :
  string ->
  Enums.dbusconnectionflags ->
  D_bus_auth_observer.d_bus_auth_observer_t option ->
  Cancellable.cancellable_t option ->
  (d_bus_connection_t, GError.t) result

val new_sync :
  Io_stream.io_stream_t ->
  string option ->
  Enums.dbusconnectionflags ->
  D_bus_auth_observer.d_bus_auth_observer_t option ->
  Cancellable.cancellable_t option ->
  (d_bus_connection_t, GError.t) result
