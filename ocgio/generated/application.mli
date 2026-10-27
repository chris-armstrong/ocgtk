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
 {{:https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-dbushooks.c}gapplication-example-dbushooks.c}.\n\n\
 Its methods, signals and properties are on {!class-type-application_t}. The \
 functions it is built on are in {!Ocgio.Raw.Application}."]

(** The methods, signals and properties of a [GApplication]. *)
class type application_t = object
  inherit Action_group.action_group_t
  inherit Action_map.action_map_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_command_line :
    ?after:bool ->
    callback:
      (command_line:Application_command_line.application_command_line_t -> int) ->
    unit ->
    Gobject.Signal.handler_id

  method on_name_lost :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id

  method on_shutdown :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_startup :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method activate : unit -> unit
  method bind_busy_property : [ `object_ ] Gobject.obj -> string -> unit
  method get_application_id : unit -> string option

  method get_dbus_connection :
    unit -> D_bus_connection.d_bus_connection_t option

  method get_dbus_object_path : unit -> string option
  method get_flags : unit -> Enums.applicationflags
  method get_inactivity_timeout : unit -> int
  method get_is_busy : unit -> bool
  method get_is_registered : unit -> bool
  method get_is_remote : unit -> bool
  method get_resource_base_path : unit -> string option
  method get_version : unit -> string option
  method hold : unit -> unit
  method mark_busy : unit -> unit
  method open_ : Raw.File.t array -> int -> string -> unit
  method quit : unit -> unit
  method register : Cancellable.cancellable_t option -> (bool, GError.t) result
  method release : unit -> unit
  method run : int -> string array option -> int

  method send_notification :
    string option -> Notification.notification_t -> unit

  method set_action_group : Action_group.action_group_t option -> unit
  method set_application_id : string option -> unit
  method set_default : unit -> unit
  method set_flags : Enums.applicationflags -> unit
  method set_inactivity_timeout : int -> unit
  method set_option_context_description : string option -> unit
  method set_option_context_parameter_string : string option -> unit
  method set_option_context_summary : string option -> unit
  method set_resource_base_path : string option -> unit
  method set_version : string -> unit
  method unbind_busy_property : [ `object_ ] Gobject.obj -> string -> unit
  method unmark_busy : unit -> unit
  method withdraw_notification : string -> unit
  method as_application : Raw.Application.t
end

class application : Raw.Application.t -> application_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Application.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GApplication], give one already wrapped. *)

val new_ : string option -> Enums.applicationflags -> application_t
