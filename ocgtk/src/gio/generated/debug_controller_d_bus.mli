(* GENERATED CODE - DO NOT EDIT *)
(* DebugControllerDBus: DebugControllerDBus *)

[@@@ocaml.text
"[GDebugControllerDBus] is an implementation of [Gio.DebugController]\n\
 which exposes debug settings as a D-Bus object.\n\n\
 It is a [Gio.Initable] object, and will register an object at\n\
 [/org/gtk/Debugging] on the bus given as\n\
 [Gio.DebugControllerDBus:connection] once it’s initialized. The\n\
 object will be unregistered when the last reference to the\n\
 [GDebugControllerDBus] is dropped.\n\n\
 This D-Bus object can be used by remote processes to enable or disable debug\n\
 output in this process. Remote processes calling\n\
 [org.gtk.Debugging.SetDebugEnabled()] will affect the value of\n\
 [Gio.DebugController:debug-enabled] and, by default,\n\
 [GLib.log_get_debug_enabled].\n\n\
 By default, no processes are allowed to call [SetDebugEnabled()] unless a\n\
 [Gio.DebugControllerDBus::authorize] signal handler is installed. This\n\
 is because the process may be privileged, or might expose sensitive\n\
 information in its debug output. You may want to restrict the ability to\n\
 enable debug output to privileged users or processes.\n\n\
 One option is to install a D-Bus security policy which restricts access to\n\
 [SetDebugEnabled()], installing something like the following in\n\
 [$datadir/dbus-1/system.d/]:\n\n\
 {[\n\
 <?xml version=\"1.0\"?> <!--*-nxml-*-->\n\
 <!DOCTYPE busconfig PUBLIC \"-//freedesktop//DTD D-BUS Bus Configuration \
 1.0//EN\"\n\
\     \"http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd\">\n\
 <busconfig>\n\
\  <policy user=\"root\">\n\
\    <allow send_destination=\"com.example.MyService\" \
 send_interface=\"org.gtk.Debugging\"/>\n\
\  </policy>\n\
\  <policy context=\"default\">\n\
\    <deny send_destination=\"com.example.MyService\" \
 send_interface=\"org.gtk.Debugging\"/>\n\
\  </policy>\n\
 </busconfig>\n\
 ]}\n\n\
 This will prevent the [SetDebugEnabled()] method from being called by all\n\
 except root. It will not prevent the [DebugEnabled] property from being read,\n\
 as it’s accessed through the [org.freedesktop.DBus.Properties] interface.\n\n\
 Another option is to use polkit to allow or deny requests on a case-by-case\n\
 basis, allowing for the possibility of dynamic authorisation. To do this,\n\
 connect to the [Gio.DebugControllerDBus::authorize] signal and query\n\
 polkit in it:\n\n\
 {[\n\
\  g_autoptr(GError) child_error = NULL;\n\
\  g_autoptr(GDBusConnection) connection = g_bus_get_sync (G_BUS_TYPE_SYSTEM, \
 NULL, NULL);\n\
\  gulong debug_controller_authorize_id = 0;\n\n\
\  // Set up the debug controller.\n\
\  debug_controller = G_DEBUG_CONTROLLER (g_debug_controller_dbus_new \
 (priv->connection, NULL, &child_error));\n\
\  if (debug_controller == NULL)\n\
\    {\n\
\      g_error (\"Could not register debug controller on bus: %s\",\n\
\               child_error->message);\n\
\    }\n\n\
\  debug_controller_authorize_id = g_signal_connect (debug_controller,\n\
\                                                    \"authorize\",\n\
\                                                    G_CALLBACK \
 (debug_controller_authorize_cb),\n\
\                                                    self);\n\n\
\  static gboolean\n\
\  debug_controller_authorize_cb (GDebugControllerDBus  *debug_controller,\n\
\                                 GDBusMethodInvocation *invocation,\n\
\                                 gpointer               user_data)\n\
\  {\n\
\    g_autoptr(PolkitAuthority) authority = NULL;\n\
\    g_autoptr(PolkitSubject) subject = NULL;\n\
\    g_autoptr(PolkitAuthorizationResult) auth_result = NULL;\n\
\    g_autoptr(GError) local_error = NULL;\n\
\    GDBusMessage *message;\n\
\    GDBusMessageFlags message_flags;\n\
\    PolkitCheckAuthorizationFlags flags = \
 POLKIT_CHECK_AUTHORIZATION_FLAGS_NONE;\n\n\
\    message = g_dbus_method_invocation_get_message (invocation);\n\
\    message_flags = g_dbus_message_get_flags (message);\n\n\
\    authority = polkit_authority_get_sync (NULL, &local_error);\n\
\    if (authority == NULL)\n\
\      {\n\
\        g_warning (\"Failed to get polkit authority: %s\", \
 local_error->message);\n\
\        return FALSE;\n\
\      }\n\n\
\    if (message_flags & G_DBUS_MESSAGE_FLAGS_ALLOW_INTERACTIVE_AUTHORIZATION)\n\
\      flags |= POLKIT_CHECK_AUTHORIZATION_FLAGS_ALLOW_USER_INTERACTION;\n\n\
\    subject = polkit_system_bus_name_new (g_dbus_method_invocation_get_sender \
 (invocation));\n\n\
\    auth_result = polkit_authority_check_authorization_sync (authority,\n\
\                                                             subject,\n\
\                                                             \
 \"com.example.MyService.set-debug-enabled\",\n\
\                                                             NULL,\n\
\                                                             flags,\n\
\                                                             NULL,\n\
\                                                             &local_error);\n\
\    if (auth_result == NULL)\n\
\      {\n\
\        g_warning (\"Failed to get check polkit authorization: %s\", \
 local_error->message);\n\
\        return FALSE;\n\
\      }\n\n\
\    return polkit_authorization_result_get_is_authorized (auth_result);\n\
\  }\n\
 ]}"]

type t = [ `debug_controller_d_bus | `object_ ] Gobject.obj

external new_ :
  D_bus_connection.t -> Cancellable.t option -> (t, GError.t) result
  = "ml_g_debug_controller_dbus_new"
(** Create a new DebugControllerDBus *)

(* Methods *)

external stop : t -> unit = "ml_g_debug_controller_dbus_stop"
(** Stop the debug controller, unregistering its object from the bus.

    Any pending method calls to the object will complete successfully, but new
    ones will return an error. This method will block until all pending
    [GDebugControllerDBus::authorize] signals have been handled. This is
    expected to not take long, as it will just be waiting for threads to join.
    If any [GDebugControllerDBus::authorize] signal handlers are still executing
    in other threads, this will block until after they have returned.

    This method will be called automatically when the final reference to the
    [GDebugControllerDBus] is dropped. You may want to call it explicitly to
    know when the controller has been fully removed from the bus, or to break
    reference count cycles.

    Calling this method from within a [GDebugControllerDBus::authorize] signal
    handler will cause a deadlock and must not be done. *)

(* Properties *)

external get_connection : t -> D_bus_connection.t
  = "ml_g_debug_controller_d_bus_get_connection"
(** Get property: connection *)

val on_authorize :
  ?after:bool ->
  t ->
  callback:(invocation:D_bus_method_invocation.t -> bool) ->
  Gobject.Signal.handler_id
