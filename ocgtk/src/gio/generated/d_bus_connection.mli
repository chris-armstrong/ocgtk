(* GENERATED CODE - DO NOT EDIT *)
(* DBusConnection: DBusConnection *)

type t = [`d_bus_connection | `object_] Gobject.obj

(* Methods *)
(** Unregisters a subtree. *)
external unregister_subtree : t -> int -> bool = "ml_g_dbus_connection_unregister_subtree"

(** Unregisters an object. *)
external unregister_object : t -> int -> bool = "ml_g_dbus_connection_unregister_object"

(** Reverses the effect of a previous call to
g_dbus_connection_export_menu_model().

It is an error to call this function with an ID that wasn't returned
from g_dbus_connection_export_menu_model() or to call it with the
same ID more than once. *)
external unexport_menu_model : t -> int -> unit = "ml_g_dbus_connection_unexport_menu_model"

(** Reverses the effect of a previous call to
g_dbus_connection_export_action_group().

It is an error to call this function with an ID that wasn't returned
from g_dbus_connection_export_action_group() or to call it with the
same ID more than once. *)
external unexport_action_group : t -> int -> unit = "ml_g_dbus_connection_unexport_action_group"

(** If @connection was created with
%G_DBUS_CONNECTION_FLAGS_DELAY_MESSAGE_PROCESSING, this method
starts processing messages. Does nothing on if @connection wasn't
created with this flag or if the method has already been called. *)
external start_message_processing : t -> unit = "ml_g_dbus_connection_start_message_processing"

(** Unsubscribes from signals.

Note that there may still be D-Bus traffic to process (relating to this
signal subscription) in the current thread-default #GMainContext after this
function has returned. You should continue to iterate the #GMainContext
until the #GDestroyNotify function passed to
g_dbus_connection_signal_subscribe() is called, in order to avoid memory
leaks through callbacks queued on the #GMainContext after it’s stopped being
iterated.
Alternatively, any idle source with a priority lower than %G_PRIORITY_DEFAULT
that was scheduled after unsubscription, also indicates that all resources
of this subscription are released. *)
external signal_unsubscribe : t -> int -> unit = "ml_g_dbus_connection_signal_unsubscribe"

(** Sets whether the process should be terminated when @connection is
closed by the remote peer. See #GDBusConnection:exit-on-close for
more details.

Note that this function should be used with care. Most modern UNIX
desktops tie the notion of a user session with the session bus, and expect
all of a user's applications to quit when their bus connection goes away.
If you are setting @exit_on_close to %FALSE for the shared session
bus connection, you should make sure that your application exits
when the user session ends. *)
external set_exit_on_close : t -> bool -> unit = "ml_g_dbus_connection_set_exit_on_close"

(** Finishes an operation started with g_dbus_connection_send_message_with_reply().

Note that @error is only set if a local in-process error
occurred. That is to say that the returned #GDBusMessage object may
be of type %G_DBUS_MESSAGE_TYPE_ERROR. Use
g_dbus_message_to_gerror() to transcode this to a #GError.

See this [server][gdbus-server] and [client][gdbus-unix-fd-client]
for an example of how to use this low-level API to send and receive
UNIX file descriptors. *)
external send_message_with_reply_finish : t -> Async_result.t -> (D_bus_message.t, GError.t) result = "ml_g_dbus_connection_send_message_with_reply_finish"

(** Removes a filter.

Note that since filters run in a different thread, there is a race
condition where it is possible that the filter will be running even
after calling g_dbus_connection_remove_filter(), so you cannot just
free data that the filter might be using. Instead, you should pass
a #GDestroyNotify to g_dbus_connection_add_filter(), which will be
called when it is guaranteed that the data is no longer needed. *)
external remove_filter : t -> int -> unit = "ml_g_dbus_connection_remove_filter"

(** Gets whether @connection is closed. *)
external is_closed : t -> bool = "ml_g_dbus_connection_is_closed"

(** Gets the unique name of @connection as assigned by the message
bus. This can also be used to figure out if @connection is a
message bus connection. *)
external get_unique_name : t -> string option = "ml_g_dbus_connection_get_unique_name"

(** Gets the underlying stream used for IO.

While the #GDBusConnection is active, it will interact with this
stream from a worker thread, so it is not safe to interact with
the stream directly. *)
external get_stream : t -> Io_stream.t = "ml_g_dbus_connection_get_stream"

(** Gets the credentials of the authenticated peer. This will always
return %NULL unless @connection acted as a server
(e.g. %G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER was passed)
when set up and the client passed credentials as part of the
authentication process.

In a message bus setup, the message bus is always the server and
each application is a client. So this method will always return
%NULL for message bus clients. *)
external get_peer_credentials : t -> Credentials.t option = "ml_g_dbus_connection_get_peer_credentials"

(** The GUID of the peer performing the role of server when
authenticating. See #GDBusConnection:guid for more details. *)
external get_guid : t -> string = "ml_g_dbus_connection_get_guid"

(** Gets the flags used to construct this connection *)
external get_flags : t -> Gio_enums.dbusconnectionflags = "ml_g_dbus_connection_get_flags"

(** Gets whether the process is terminated when @connection is
closed by the remote peer. See
#GDBusConnection:exit-on-close for more details. *)
external get_exit_on_close : t -> bool = "ml_g_dbus_connection_get_exit_on_close"

(** Gets the capabilities negotiated with the remote peer *)
external get_capabilities : t -> Gio_enums.dbuscapabilityflags = "ml_g_dbus_connection_get_capabilities"

(** Synchronously flushes @connection. The calling thread is blocked
until this is done. See g_dbus_connection_flush() for the
asynchronous version of this method and more details about what it
does. *)
external flush_sync : t -> Cancellable.t option -> (bool, GError.t) result = "ml_g_dbus_connection_flush_sync"

(** Finishes an operation started with g_dbus_connection_flush(). *)
external flush_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_dbus_connection_flush_finish"

(** Exports @menu on @connection at @object_path.

The implemented D-Bus API should be considered private.
It is subject to change in the future.

An object path can only have one menu model exported on it. If this
constraint is violated, the export will fail and 0 will be
returned (with @error set accordingly).

Exporting menus with sections containing more than
%G_MENU_EXPORTER_MAX_SECTION_SIZE items is not supported and results in
undefined behavior.

You can unexport the menu model using
g_dbus_connection_unexport_menu_model() with the return value of
this function. *)
external export_menu_model : t -> string -> Menu_link_iter_and__menu_model.Menu_model.t -> (int, GError.t) result = "ml_g_dbus_connection_export_menu_model"

(** Exports @action_group on @connection at @object_path.

The implemented D-Bus API should be considered private.  It is
subject to change in the future.

A given object path can only have one action group exported on it.
If this constraint is violated, the export will fail and 0 will be
returned (with @error set accordingly).

You can unexport the action group using
g_dbus_connection_unexport_action_group() with the return value of
this function.

The thread default main context is taken at the time of this call.
All incoming action activations and state change requests are
reported from this context.  Any changes on the action group that
cause it to emit signals must also come from this same context.
Since incoming action activations and state change requests are
rather likely to cause changes on the action group, this effectively
limits a given action group to being exported from only one main
context. *)
external export_action_group : t -> string -> Action_group.t -> (int, GError.t) result = "ml_g_dbus_connection_export_action_group"

(** Synchronously closes @connection. The calling thread is blocked
until this is done. See g_dbus_connection_close() for the
asynchronous version of this method and more details about what it
does. *)
external close_sync : t -> Cancellable.t option -> (bool, GError.t) result = "ml_g_dbus_connection_close_sync"

(** Finishes an operation started with g_dbus_connection_close(). *)
external close_finish : t -> Async_result.t -> (bool, GError.t) result = "ml_g_dbus_connection_close_finish"

(* Properties *)

(** Get property: address *)
external get_address : t -> string = "ml_g_d_bus_connection_get_address"

(** Get property: authentication-observer *)
external get_authentication_observer : t -> D_bus_auth_observer.t = "ml_g_d_bus_connection_get_authentication_observer"

(** Get property: closed *)
external get_closed : t -> bool = "ml_g_d_bus_connection_get_closed"

