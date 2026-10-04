(* GENERATED CODE - DO NOT EDIT *)
(* Application: Application *)

[@@@ocaml.text
"[GApplication] is the core class for application support.\n\n\
 A [GApplication] is the foundation of an application. It wraps some\n\
 low-level platform-specific services and is intended to act as the\n\
 foundation for higher-level application classes such as\n\
 [GtkApplication] or [MxApplication]. In general, you should not use\n\
 this class outside of a higher level framework.\n\n\
 [GApplication] provides convenient life-cycle management by maintaining\n\
 a \"use count\" for the primary application instance. The use count can\n\
 be changed using [Gio.Application.hold] and\n\
 [Gio.Application.release]. If it drops to zero, the application\n\
 exits. Higher-level classes such as [GtkApplication] employ the use count\n\
 to ensure that the application stays alive as long as it has any opened\n\
 windows.\n\n\
 Another feature that [GApplication] (optionally) provides is process\n\
 uniqueness. Applications can make use of this functionality by\n\
 providing a unique application ID. If given, only one application\n\
 with this ID can be running at a time per session. The session\n\
 concept is platform-dependent, but corresponds roughly to a graphical\n\
 desktop login. When your application is launched again, its\n\
 arguments are passed through platform communication to the already\n\
 running program. The already running instance of the program is\n\
 called the \"primary instance\"; for non-unique applications this is\n\
 always the current instance. On Linux, the D-Bus session bus\n\
 is used for communication.\n\n\
 The use of [GApplication] differs from some other commonly-used\n\
 uniqueness libraries (such as libunique) in important ways. The\n\
 application is not expected to manually register itself and check\n\
 if it is the primary instance. Instead, the main() function of a\n\
 [GApplication] should do very little more than instantiating the\n\
 application instance, possibly connecting signal handlers, then\n\
 calling [Gio.Application.run]. All checks for uniqueness are done\n\
 internally. If the application is the primary instance then the\n\
 startup signal is emitted and the mainloop runs. If the application\n\
 is not the primary instance then a signal is sent to the primary\n\
 instance and [Gio.Application.run] promptly returns. See the code\n\
 examples below.\n\n\
 If used, the expected form of an application identifier is the\n\
 same as that of a\n\
 {{:https://dbus.freedesktop.org/doc/dbus-specification.html#message-protocol-names-bus}D-Bus \
 well-known bus name}.\n\
 Examples include: [com.example.MyApp], [org.example.internal_apps.Calculator],\n\
 [org._7_zip.Archiver].\n\
 For details on valid application identifiers, see \
 [Gio.Application.id_is_valid].\n\n\
 On Linux, the application identifier is claimed as a well-known bus name\n\
 on the user's session bus. This means that the uniqueness of your\n\
 application is scoped to the current session. It also means that your\n\
 application may provide additional services (through registration of other\n\
 object paths) at that bus name. The registration of these object paths\n\
 should be done with the shared GDBus session bus. Note that due to the\n\
 internal architecture of GDBus, method calls can be dispatched at any time\n\
 (even if a main loop is not running). For this reason, you must ensure that\n\
 any object paths that you wish to register are registered before [GApplication]\n\
 attempts to acquire the bus name of your application (which happens in\n\
 [Gio.Application.register]). Unfortunately, this means that you cannot\n\
 use [Gio.Application:is-remote] to decide if you want to register\n\
 object paths.\n\n\
 [GApplication] also implements the [Gio.ActionGroup] and [Gio.ActionMap]\n\
 interfaces and lets you easily export actions by adding them with\n\
 [Gio.ActionMap.add_action]. When invoking an action by calling\n\
 [Gio.ActionGroup.activate_action] on the application, it is always\n\
 invoked in the primary instance. The actions are also exported on\n\
 the session bus, and GIO provides the [Gio.DBusActionGroup] wrapper to\n\
 conveniently access them remotely. GIO provides a [Gio.DBusMenuModel] wrapper\n\
 for remote access to exported [Gio.MenuModel]s.\n\n\
 Note: Due to the fact that actions are exported on the session bus,\n\
 using [maybe] parameters is not supported, since D-Bus does not support\n\
 [maybe] types.\n\n\
 There is a number of different entry points into a [GApplication]:\n\n\
 - via 'Activate' (i.e. just starting the application)\n\n\
 - via 'Open' (i.e. opening some files)\n\n\
 - by handling a command-line\n\n\
 - via activating an action\n\n\
 The [Gio.Application::startup] signal lets you handle the application\n\
 initialization for all of these in a single place.\n\n\
 Regardless of which of these entry points is used to start the\n\
 application, [GApplication] passes some ‘platform data’ from the\n\
 launching instance to the primary instance, in the form of a\n\
 [GLib.Variant] dictionary mapping strings to variants. To use platform\n\
 data, override the [Gio.Application.before_emit] or\n\
 [Gio.Application.after_emit] virtual functions\n\
 in your [GApplication] subclass. When dealing with\n\
 [Gio.ApplicationCommandLine] objects, the platform data is\n\
 directly available via [Gio.ApplicationCommandLine.get_cwd],\n\
 [Gio.ApplicationCommandLine.get_environ] and\n\
 [Gio.ApplicationCommandLine.get_platform_data].\n\n\
 As the name indicates, the platform data may vary depending on the\n\
 operating system, but it always includes the current directory (key\n\
 [cwd]), and optionally the environment (ie the set of environment\n\
 variables and their values) of the calling process (key [environ]).\n\
 The environment is only added to the platform data if the\n\
 [G_APPLICATION_SEND_ENVIRONMENT] flag is set. [GApplication] subclasses\n\
 can add their own platform data by overriding the\n\
 [Gio.Application.add_platform_data] virtual function. For instance,\n\
 [GtkApplication] adds startup notification data in this way.\n\n\
 To parse commandline arguments you may handle the\n\
 [Gio.Application::command-line] signal or override the\n\
 [Gio.Application.local_command_line] virtual function, to parse them in\n\
 either the primary instance or the local instance, respectively.\n\n\
 For an example of opening files with a [GApplication], see\n\
 {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-open.c}gapplication-example-open.c}.\n\n\
 For an example of using actions with [GApplication], see\n\
 {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-actions.c}gapplication-example-actions.c}.\n\n\
 For an example of using extra D-Bus hooks with [GApplication], see\n\
 {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-dbushooks.c}gapplication-example-dbushooks.c}."]

type t = [ `application | `object_ ] Gobject.obj

external new_ : string option -> Gio_enums.applicationflags -> t
  = "ml_g_application_new"
(** Create a new Application *)

(* Methods *)

external withdraw_notification : t -> string -> unit
  = "ml_g_application_withdraw_notification"
(** Withdraws a notification that was sent with
    g_application_send_notification().

    This call does nothing if a notification with [id] doesn't exist or the
    notification was never sent.

    This function works even for notifications sent in previous executions of
    this application, as long [id] is the same as it was for the sent
    notification.

    Note that notifications are dismissed when the user clicks on one of the
    buttons in a notification or triggers its default action, so there is no
    need to explicitly withdraw the notification in that case. *)

external unmark_busy : t -> unit = "ml_g_application_unmark_busy"
(** Decreases the busy count of [application].

    When the busy count reaches zero, the new state will be propagated to other
    processes.

    This function must only be called to cancel the effect of a previous call to
    g_application_mark_busy(). *)

external unbind_busy_property : t -> [ `object_ ] Gobject.obj -> string -> unit
  = "ml_g_application_unbind_busy_property"
(** Destroys a binding between [property] and the busy state of [application]
    that was previously created with g_application_bind_busy_property(). *)

external set_version : t -> string -> unit = "ml_g_application_set_version"
(** Sets the version number of [application]. This will be used to implement a
    [--version] command line argument

    The application version can only be modified if [application] has not yet
    been registered. *)

external set_resource_base_path : t -> string option -> unit
  = "ml_g_application_set_resource_base_path"
[@@ocaml.doc
  "Sets (or unsets) the base resource path of [application].\n\n\
   The path is used to automatically load various\n\
   \\[application resources\\][Gio.Resource] such as menu layouts and\n\
   action descriptions. The various types of resources will be found at\n\
   fixed names relative to the given base path.\n\n\
   By default, the resource base path is determined from the application\n\
   ID by prefixing '/' and replacing each '.' with '/'.  This is done at\n\
   the time that the [GApplication] object is constructed.  Changes to\n\
   the application ID after that point will not have an impact on the\n\
   resource base path.\n\n\
   As an example, if the application has an ID of \"org.example.app\" then\n\
   the default resource base path will be \"/org/example/app\".  If this\n\
   is a [GtkApplication] (and you have not manually changed the path)\n\
   then Gtk will then search for the menus of the application at\n\
   \"/org/example/app/gtk/menus.ui\".\n\n\
   See [GResource] for more information about adding resources to your\n\
   application.\n\n\
   You can disable automatic resource loading functionality by setting\n\
   the path to [NULL].\n\n\
   Changing the resource base path once the application is running is\n\
   not recommended.  The point at which the resource path is consulted\n\
   for forming paths for various purposes is unspecified.  When writing\n\
   a sub-class of [GApplication] you should either set the\n\
   [GApplication:resource]-base-path property at construction time, or call\n\
   this function during the instance initialization. Alternatively, you\n\
   can call this function in the [GApplicationClass].startup virtual function,\n\
   before chaining up to the parent implementation."]

external set_option_context_summary : t -> string option -> unit
  = "ml_g_application_set_option_context_summary"
(** Adds a summary to the [application] option context.

    See g_option_context_set_summary() for more information. *)

external set_option_context_parameter_string : t -> string option -> unit
  = "ml_g_application_set_option_context_parameter_string"
(** Sets the parameter string to be used by the commandline handling of
    [application].

    This function registers the argument to be passed to g_option_context_new()
    when the internal [GOptionContext] of [application] is created.

    See g_option_context_new() for more information about [parameter_string]. *)

external set_option_context_description : t -> string option -> unit
  = "ml_g_application_set_option_context_description"
(** Adds a description to the [application] option context.

    See g_option_context_set_description() for more information. *)

external set_inactivity_timeout : t -> int -> unit
  = "ml_g_application_set_inactivity_timeout"
(** Sets the current inactivity timeout for the application.

    This is the amount of time (in milliseconds) after the last call to
    g_application_release() before the application stops running.

    This call has no side effects of its own. The value set here is only used
    for next time g_application_release() drops the use count to zero. Any
    timeouts currently in progress are not impacted. *)

external set_flags : t -> Gio_enums.applicationflags -> unit
  = "ml_g_application_set_flags"
(** Sets the flags for [application].

    The flags can only be modified if [application] has not yet been registered.

    See [GApplicationFlags]. *)

external set_default : t -> unit = "ml_g_application_set_default"
(** Sets or unsets the default application for the process, as returned by
    g_application_get_default().

    This function does not take its own reference on [application]. If
    [application] is destroyed then the default application will revert back to
    [NULL]. *)

external set_application_id : t -> string option -> unit
  = "ml_g_application_set_application_id"
(** Sets the unique identifier for [application].

    The application id can only be modified if [application] has not yet been
    registered.

    If non-[NULL], the application id must be valid. See
    g_application_id_is_valid(). *)

external set_action_group : t -> Action_group.t option -> unit
  = "ml_g_application_set_action_group"
(** This used to be how actions were associated with a [GApplication]. Now there
    is [GActionMap] for that. *)

external send_notification : t -> string option -> Notification.t -> unit
  = "ml_g_application_send_notification"
[@@ocaml.doc
  "Sends a notification on behalf of [application] to the desktop shell.\n\
   There is no guarantee that the notification is displayed immediately,\n\
   or even at all.\n\n\
   Notifications may persist after the application exits. It will be\n\
   D-Bus-activated when the notification or one of its actions is\n\
   activated.\n\n\
   Modifying [notification] after this call has no effect. However, the\n\
   object can be reused for a later call to this function.\n\n\
   [id] may be any string that uniquely identifies the event for the\n\
   application. It does not need to be in any special format. For\n\
   example, \"new-message\" might be appropriate for a notification about\n\
   new messages.\n\n\
   If a previous notification was sent with the same [id], it will be\n\
   replaced with [notification] and shown again as if it was a new\n\
   notification. This works even for notifications sent from a previous\n\
   execution of the application, as long as [id] is the same string.\n\n\
   [id] may be [NULL], but it is impossible to replace or withdraw\n\
   notifications without an id.\n\n\
   If [notification] is no longer relevant, it can be withdrawn with\n\
   [Gio.Application.withdraw_notification].\n\n\
   It is an error to call this function if [application] has no\n\
   application ID."]

external run : t -> int -> string array option -> int = "ml_g_application_run"
[@@ocaml.doc
  "Runs the application.\n\n\
   This function is intended to be run from main() and its return value\n\
   is intended to be returned by main(). Although you are expected to pass\n\
   the [argc], [argv] parameters from main() to this function, it is possible\n\
   to pass [NULL] if [argv] is not available or commandline handling is not\n\
   required.  Note that on Windows, [argc] and [argv] are ignored, and\n\
   g_win32_get_command_line() is called internally (for proper support\n\
   of Unicode commandline arguments).\n\n\
   [GApplication] will attempt to parse the commandline arguments.  You\n\
   can add commandline flags to the list of recognised options by way of\n\
   g_application_add_main_option_entries().  After this, the\n\
   [GApplication::handle]-local-options signal is emitted, from which the\n\
   application can inspect the values of its [GOptionEntrys].\n\n\
   [GApplication::handle]-local-options is a good place to handle options\n\
   such as [--version], where an immediate reply from the local process is\n\
   desired (instead of communicating with an already-running instance).\n\
   A [GApplication::handle]-local-options handler can stop further processing\n\
   by returning a non-negative value, which then becomes the exit status of\n\
   the process.\n\n\
   What happens next depends on the flags: if\n\
   [G_APPLICATION_HANDLES_COMMAND_LINE] was specified then the remaining\n\
   commandline arguments are sent to the primary instance, where a\n\
   [GApplication::command]-line signal is emitted.  Otherwise, the\n\
   remaining commandline arguments are assumed to be a list of files.\n\
   If there are no files listed, the application is activated via the\n\
   [GApplication::activate] signal.  If there are one or more files, and\n\
   [G_APPLICATION_HANDLES_OPEN] was specified then the files are opened\n\
   via the [GApplication::open] signal.\n\n\
   If you are interested in doing more complicated local handling of the\n\
   commandline then you should implement your own [GApplication] subclass\n\
   and override local_command_line(). In this case, you most likely want\n\
   to return [TRUE] from your local_command_line() implementation to\n\
   suppress the default handling. See\n\
   \\[gapplication-example-cmdline2.c\\]\\[https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-cmdline2.c\\]\n\
   for an example.\n\n\
   If, after the above is done, the use count of the application is zero\n\
   then the exit status is returned immediately.  If the use count is\n\
   non-zero then the default main context is iterated until the use count\n\
   falls to zero, at which point 0 is returned.\n\n\
   If the [G_APPLICATION_IS_SERVICE] flag is set, then the service will\n\
   run for as much as 10 seconds with a use count of zero while waiting\n\
   for the message that caused the activation to arrive.  After that,\n\
   if the use count falls to zero the application will exit immediately,\n\
   except in the case that g_application_set_inactivity_timeout() is in\n\
   use.\n\n\
   This function sets the prgname (g_set_prgname()), if not already set,\n\
   to the basename of argv\\[0\\].\n\n\
   Much like g_main_loop_run(), this function will acquire the main context\n\
   for the duration that the application is running.\n\n\
   Since 2.40, applications that are not explicitly flagged as services\n\
   or launchers (ie: neither [G_APPLICATION_IS_SERVICE] or\n\
   [G_APPLICATION_IS_LAUNCHER] are given as flags) will check (from the\n\
   default handler for local_command_line) if \"--gapplication-service\"\n\
   was given in the command line.  If this flag is present then normal\n\
   commandline processing is interrupted and the\n\
   [G_APPLICATION_IS_SERVICE] flag is set.  This provides a \"compromise\"\n\
   solution whereby running an application directly from the commandline\n\
   will invoke it in the normal way (which can be useful for debugging)\n\
   while still allowing applications to be D-Bus activated in service\n\
   mode.  The D-Bus service file should invoke the executable with\n\
   \"--gapplication-service\" as the sole commandline argument.  This\n\
   approach is suitable for use by most graphical applications but\n\
   should not be used from applications like editors that need precise\n\
   control over when processes invoked via the commandline will exit and\n\
   what their exit status will be."]

external release : t -> unit = "ml_g_application_release"
(** Decrease the use count of [application].

    When the use count reaches zero, the application will stop running.

    Never call this function except to cancel the effect of a previous call to
    g_application_hold(). *)

external register : t -> Cancellable.t option -> (bool, GError.t) result
  = "ml_g_application_register"
(** Attempts registration of the application.

    This is the point at which the application discovers if it is the primary
    instance or merely acting as a remote for an already-existing primary
    instance. This is implemented by attempting to acquire the application
    identifier as a unique bus name on the session bus using GDBus.

    If there is no application ID or if [G_APPLICATION_NON_UNIQUE] was given,
    then this process will always become the primary instance.

    Due to the internal architecture of GDBus, method calls can be dispatched at
    any time (even if a main loop is not running). For this reason, you must
    ensure that any object paths that you wish to register are registered before
    calling this function.

    If the application has already been registered then [TRUE] is returned with
    no work performed.

    The [GApplication::startup] signal is emitted if registration succeeds and
    [application] is the primary instance (including the non-unique case).

    In the event of an error (such as [cancellable] being cancelled, or a
    failure to connect to the session bus), [FALSE] is returned and [error] is
    set appropriately.

    Note: the return value of this function is not an indicator that this
    instance is or is not the primary instance of the application. See
    g_application_get_is_remote() for that. *)

external quit : t -> unit = "ml_g_application_quit"
(** Immediately quits the application.

    Upon return to the mainloop, g_application_run() will return, calling only
    the 'shutdown' function before doing so.

    The hold count is ignored. Take care if your code has called
    g_application_hold() on the application and is therefore still expecting it
    to exist. (Note that you may have called g_application_hold() indirectly,
    for example through gtk_application_add_window().)

    The result of calling g_application_run() again after it returns is
    unspecified. *)

external open_ :
  t -> App_info_cycle_64c425a0.File.t array -> int -> string -> unit
  = "ml_g_application_open"
[@@ocaml.doc
  "Opens the given files.\n\n\
   In essence, this results in the [GApplication::open] signal being emitted\n\
   in the primary instance.\n\n\
   [n_files] must be greater than zero.\n\n\
   [hint] is simply passed through to the ::open signal.  It is\n\
   intended to be used by applications that have multiple modes for\n\
   opening files (eg: \"view\" vs \"edit\", etc).  Unless you have a need\n\
   for this functionality, you should use \"\".\n\n\
   The application must be registered before calling this function\n\
   and it must have the [G_APPLICATION_HANDLES_OPEN] flag set."]

external mark_busy : t -> unit = "ml_g_application_mark_busy"
(** Increases the busy count of [application].

    Use this function to indicate that the application is busy, for instance
    while a long running operation is pending.

    The busy state will be exposed to other processes, so a session shell will
    use that information to indicate the state to the user (e.g. with a
    spinner).

    To cancel the busy indication, use g_application_unmark_busy().

    The application must be registered before calling this function. *)

external hold : t -> unit = "ml_g_application_hold"
(** Increases the use count of [application].

    Use this function to indicate that the application has a reason to continue
    to run. For example, g_application_hold() is called by GTK when a toplevel
    window is on the screen.

    To cancel the hold, call g_application_release(). *)

external get_version : t -> string option = "ml_g_application_get_version"
(** Gets the version of [application]. *)

external get_resource_base_path : t -> string option
  = "ml_g_application_get_resource_base_path"
(** Gets the resource base path of [application].

    See g_application_set_resource_base_path() for more information. *)

external get_is_remote : t -> bool = "ml_g_application_get_is_remote"
(** Checks if [application] is remote.

    If [application] is remote then it means that another instance of
    application already exists (the 'primary' instance). Calls to perform
    actions on [application] will result in the actions being performed by the
    primary instance.

    The value of this property cannot be accessed before
    g_application_register() has been called. See
    g_application_get_is_registered(). *)

external get_is_registered : t -> bool = "ml_g_application_get_is_registered"
(** Checks if [application] is registered.

    An application is registered if g_application_register() has been
    successfully called. *)

external get_is_busy : t -> bool = "ml_g_application_get_is_busy"
(** Gets the application's current busy state, as set through
    g_application_mark_busy() or g_application_bind_busy_property(). *)

external get_inactivity_timeout : t -> int
  = "ml_g_application_get_inactivity_timeout"
(** Gets the current inactivity timeout for the application.

    This is the amount of time (in milliseconds) after the last call to
    g_application_release() before the application stops running. *)

external get_flags : t -> Gio_enums.applicationflags
  = "ml_g_application_get_flags"
(** Gets the flags for [application].

    See [GApplicationFlags]. *)

external get_dbus_object_path : t -> string option
  = "ml_g_application_get_dbus_object_path"
(** Gets the D-Bus object path being used by the application, or [NULL].

    If [GApplication] is using its D-Bus backend then this function will return
    the D-Bus object path that [GApplication] is using. If the application is
    the primary instance then there is an object published at this path. If the
    application is not the primary instance then the result of this function is
    undefined.

    If [GApplication] is not using D-Bus then this function will return [NULL].
    This includes the situation where the D-Bus backend would normally be in use
    but we were unable to connect to the bus.

    This function must not be called before the application has been registered.
    See g_application_get_is_registered(). *)

external get_dbus_connection : t -> D_bus_connection.t option
  = "ml_g_application_get_dbus_connection"
(** Gets the [GDBusConnection] being used by the application, or [NULL].

    If [GApplication] is using its D-Bus backend then this function will return
    the [GDBusConnection] being used for uniqueness and communication with the
    desktop environment and other instances of the application.

    If [GApplication] is not using D-Bus then this function will return [NULL].
    This includes the situation where the D-Bus backend would normally be in use
    but we were unable to connect to the bus.

    This function must not be called before the application has been registered.
    See g_application_get_is_registered(). *)

external get_application_id : t -> string option
  = "ml_g_application_get_application_id"
(** Gets the unique identifier for [application]. *)

external bind_busy_property : t -> [ `object_ ] Gobject.obj -> string -> unit
  = "ml_g_application_bind_busy_property"
(** Marks [application] as busy (see g_application_mark_busy()) while [property]
    on [object] is [TRUE].

    The binding holds a reference to [application] while it is active, but not
    to [object]. Instead, the binding is destroyed when [object] is finalized.
*)

external activate : t -> unit = "ml_g_application_activate"
(** Activates the application.

    In essence, this results in the [GApplication::activate] signal being
    emitted in the primary instance.

    The application must be registered before calling this function. *)

(* Properties *)

val on_activate :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_command_line :
  ?after:bool ->
  t ->
  callback:(command_line:Application_command_line.t -> int) ->
  Gobject.Signal.handler_id

val on_name_lost :
  ?after:bool -> t -> callback:(unit -> bool) -> Gobject.Signal.handler_id

val on_shutdown :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id

val on_startup :
  ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
