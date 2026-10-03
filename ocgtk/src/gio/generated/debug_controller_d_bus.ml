(* GENERATED CODE - DO NOT EDIT *)
(* DebugControllerDBus: DebugControllerDBus *)

(** [GDebugControllerDBus] is an implementation of [Gio.DebugController] which
    exposes debug settings as a D-Bus object.

    It is a [Gio.Initable] object, and will register an object at
    [/org/gtk/Debugging] on the bus given as
    [Gio.DebugControllerDBus:connection] once it’s initialized. The object will
    be unregistered when the last reference to the [GDebugControllerDBus] is
    dropped.

    This D-Bus object can be used by remote processes to enable or disable debug
    output in this process. Remote processes calling
    [org.gtk.Debugging.SetDebugEnabled()] will affect the value of
    [Gio.DebugController:debug-enabled] and, by default,
    [GLib.log_get_debug_enabled].

    By default, no processes are allowed to call [SetDebugEnabled()] unless a
    [Gio.DebugControllerDBus::authorize] signal handler is installed. This is
    because the process may be privileged, or might expose sensitive information
    in its debug output. You may want to restrict the ability to enable debug
    output to privileged users or processes.

    One option is to install a D-Bus security policy which restricts access to
    [SetDebugEnabled()], installing something like the following in
    [$datadir/dbus-1/system.d/]:

    {[
    <?xml version=”1.0”?> <!--*-nxml-*-->
    <!DOCTYPE busconfig PUBLIC “-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN”
         “http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd”>
    <busconfig>
      <policy user=”root”>
        <allow send_destination=”com.example.MyService” send_interface=”org.gtk.Debugging”/>
      </policy>
      <policy context=”default”>
        <deny send_destination=”com.example.MyService” send_interface=”org.gtk.Debugging”/>
      </policy>
    </busconfig>
    ]}

    This will prevent the [SetDebugEnabled()] method from being called by all
    except root. It will not prevent the [DebugEnabled] property from being
    read, as it’s accessed through the [org.freedesktop.DBus.Properties]
    interface.

    Another option is to use polkit to allow or deny requests on a case-by-case
    basis, allowing for the possibility of dynamic authorisation. To do this,
    connect to the [Gio.DebugControllerDBus::authorize] signal and query polkit
    in it:

    {[
      g_autoptr(GError) child_error = NULL;
      g_autoptr(GDBusConnection) connection = g_bus_get_sync (G_BUS_TYPE_SYSTEM, NULL, NULL);
      gulong debug_controller_authorize_id = 0;

      // Set up the debug controller.
      debug_controller = G_DEBUG_CONTROLLER (g_debug_controller_dbus_new (priv->connection, NULL, &child_error));
      if (debug_controller == NULL)
        {
          g_error (“Could not register debug controller on bus: %s”,
                   child_error->message);
        }

      debug_controller_authorize_id = g_signal_connect (debug_controller,
                                                        “authorize”,
                                                        G_CALLBACK (debug_controller_authorize_cb),
                                                        self);

      static gboolean
      debug_controller_authorize_cb (GDebugControllerDBus  *debug_controller,
                                     GDBusMethodInvocation *invocation,
                                     gpointer               user_data)
      {
        g_autoptr(PolkitAuthority) authority = NULL;
        g_autoptr(PolkitSubject) subject = NULL;
        g_autoptr(PolkitAuthorizationResult) auth_result = NULL;
        g_autoptr(GError) local_error = NULL;
        GDBusMessage *message;
        GDBusMessageFlags message_flags;
        PolkitCheckAuthorizationFlags flags = POLKIT_CHECK_AUTHORIZATION_FLAGS_NONE;

        message = g_dbus_method_invocation_get_message (invocation);
        message_flags = g_dbus_message_get_flags (message);

        authority = polkit_authority_get_sync (NULL, &local_error);
        if (authority == NULL)
          {
            g_warning (“Failed to get polkit authority: %s”, local_error->message);
            return FALSE;
          }

        if (message_flags & G_DBUS_MESSAGE_FLAGS_ALLOW_INTERACTIVE_AUTHORIZATION)
          flags |= POLKIT_CHECK_AUTHORIZATION_FLAGS_ALLOW_USER_INTERACTION;

        subject = polkit_system_bus_name_new (g_dbus_method_invocation_get_sender (invocation));

        auth_result = polkit_authority_check_authorization_sync (authority,
                                                                 subject,
                                                                 “com.example.MyService.set-debug-enabled”,
                                                                 NULL,
                                                                 flags,
                                                                 NULL,
                                                                 &local_error);
        if (auth_result == NULL)
          {
            g_warning (“Failed to get check polkit authorization: %s”, local_error->message);
            return FALSE;
          }

        return polkit_authorization_result_get_is_authorized (auth_result);
      }
    ]} *)

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

let on_authorize ?after obj ~callback =
  let closure =
    Gobject.Closure.create (fun argv ->
        let invocation =
          let v = Gobject.Closure.nth argv ~pos:1 in
          Gobject.Value.get_object_exn v
        in
        let result = callback ~invocation in
        let v = Gobject.Closure.result argv in
        let x = result in
        Gobject.Value.set_boolean v x)
  in
  Gobject.Signal.connect obj ~name:"authorize" ~callback:closure
    ~after:(Option.value after ~default:false)
