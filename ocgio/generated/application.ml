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
  (** Activates the application.

      In essence, this results in the [GApplication::activate] signal being
      emitted in the primary instance.

      The application must be registered before calling this function. *)

  method bind_busy_property : [ `object_ ] Gobject.obj -> string -> unit
  (** Marks [application] as busy (see g_application_mark_busy()) while
      [property] on [object] is [TRUE].

      The binding holds a reference to [application] while it is active, but not
      to [object]. Instead, the binding is destroyed when [object] is finalized.
  *)

  method get_application_id : unit -> string option
  (** Gets the unique identifier for [application]. *)

  method get_dbus_connection :
    unit -> D_bus_connection.d_bus_connection_t option
  (** Gets the [GDBusConnection] being used by the application, or [NULL].

      If [GApplication] is using its D-Bus backend then this function will
      return the [GDBusConnection] being used for uniqueness and communication
      with the desktop environment and other instances of the application.

      If [GApplication] is not using D-Bus then this function will return
      [NULL]. This includes the situation where the D-Bus backend would normally
      be in use but we were unable to connect to the bus.

      This function must not be called before the application has been
      registered. See g_application_get_is_registered(). *)

  method get_dbus_object_path : unit -> string option
  (** Gets the D-Bus object path being used by the application, or [NULL].

      If [GApplication] is using its D-Bus backend then this function will
      return the D-Bus object path that [GApplication] is using. If the
      application is the primary instance then there is an object published at
      this path. If the application is not the primary instance then the result
      of this function is undefined.

      If [GApplication] is not using D-Bus then this function will return
      [NULL]. This includes the situation where the D-Bus backend would normally
      be in use but we were unable to connect to the bus.

      This function must not be called before the application has been
      registered. See g_application_get_is_registered(). *)

  method get_flags : unit -> Enums.applicationflags
  (** Gets the flags for [application].

      See [GApplicationFlags]. *)

  method get_inactivity_timeout : unit -> int
  (** Gets the current inactivity timeout for the application.

      This is the amount of time (in milliseconds) after the last call to
      g_application_release() before the application stops running. *)

  method get_is_busy : unit -> bool
  (** Gets the application's current busy state, as set through
      g_application_mark_busy() or g_application_bind_busy_property(). *)

  method get_is_registered : unit -> bool
  (** Checks if [application] is registered.

      An application is registered if g_application_register() has been
      successfully called. *)

  method get_is_remote : unit -> bool
  (** Checks if [application] is remote.

      If [application] is remote then it means that another instance of
      application already exists (the 'primary' instance). Calls to perform
      actions on [application] will result in the actions being performed by the
      primary instance.

      The value of this property cannot be accessed before
      g_application_register() has been called. See
      g_application_get_is_registered(). *)

  method get_resource_base_path : unit -> string option
  (** Gets the resource base path of [application].

      See g_application_set_resource_base_path() for more information. *)

  method get_version : unit -> string option
  (** Gets the version of [application]. *)

  method hold : unit -> unit
  (** Increases the use count of [application].

      Use this function to indicate that the application has a reason to
      continue to run. For example, g_application_hold() is called by GTK when a
      toplevel window is on the screen.

      To cancel the hold, call g_application_release(). *)

  method mark_busy : unit -> unit
  (** Increases the busy count of [application].

      Use this function to indicate that the application is busy, for instance
      while a long running operation is pending.

      The busy state will be exposed to other processes, so a session shell will
      use that information to indicate the state to the user (e.g. with a
      spinner).

      To cancel the busy indication, use g_application_unmark_busy().

      The application must be registered before calling this function. *)

  method open_ : Raw.File.t array -> int -> string -> unit
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

  method quit : unit -> unit
  (** Immediately quits the application.

      Upon return to the mainloop, g_application_run() will return, calling only
      the 'shutdown' function before doing so.

      The hold count is ignored. Take care if your code has called
      g_application_hold() on the application and is therefore still expecting
      it to exist. (Note that you may have called g_application_hold()
      indirectly, for example through gtk_application_add_window().)

      The result of calling g_application_run() again after it returns is
      unspecified. *)

  method register : Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Attempts registration of the application.

      This is the point at which the application discovers if it is the primary
      instance or merely acting as a remote for an already-existing primary
      instance. This is implemented by attempting to acquire the application
      identifier as a unique bus name on the session bus using GDBus.

      If there is no application ID or if [G_APPLICATION_NON_UNIQUE] was given,
      then this process will always become the primary instance.

      Due to the internal architecture of GDBus, method calls can be dispatched
      at any time (even if a main loop is not running). For this reason, you
      must ensure that any object paths that you wish to register are registered
      before calling this function.

      If the application has already been registered then [TRUE] is returned
      with no work performed.

      The [GApplication::startup] signal is emitted if registration succeeds and
      [application] is the primary instance (including the non-unique case).

      In the event of an error (such as [cancellable] being cancelled, or a
      failure to connect to the session bus), [FALSE] is returned and [error] is
      set appropriately.

      Note: the return value of this function is not an indicator that this
      instance is or is not the primary instance of the application. See
      g_application_get_is_remote() for that. *)

  method release : unit -> unit
  (** Decrease the use count of [application].

      When the use count reaches zero, the application will stop running.

      Never call this function except to cancel the effect of a previous call to
      g_application_hold(). *)

  method run : int -> string array option -> int
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

  method send_notification :
    string option -> Notification.notification_t -> unit
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

  method set_action_group : Action_group.action_group_t option -> unit
  (** This used to be how actions were associated with a [GApplication]. Now
      there is [GActionMap] for that. *)

  method set_application_id : string option -> unit
  (** Sets the unique identifier for [application].

      The application id can only be modified if [application] has not yet been
      registered.

      If non-[NULL], the application id must be valid. See
      g_application_id_is_valid(). *)

  method set_default : unit -> unit
  (** Sets or unsets the default application for the process, as returned by
      g_application_get_default().

      This function does not take its own reference on [application]. If
      [application] is destroyed then the default application will revert back
      to [NULL]. *)

  method set_flags : Enums.applicationflags -> unit
  (** Sets the flags for [application].

      The flags can only be modified if [application] has not yet been
      registered.

      See [GApplicationFlags]. *)

  method set_inactivity_timeout : int -> unit
  (** Sets the current inactivity timeout for the application.

      This is the amount of time (in milliseconds) after the last call to
      g_application_release() before the application stops running.

      This call has no side effects of its own. The value set here is only used
      for next time g_application_release() drops the use count to zero. Any
      timeouts currently in progress are not impacted. *)

  method set_option_context_description : string option -> unit
  (** Adds a description to the [application] option context.

      See g_option_context_set_description() for more information. *)

  method set_option_context_parameter_string : string option -> unit
  (** Sets the parameter string to be used by the commandline handling of
      [application].

      This function registers the argument to be passed to
      g_option_context_new() when the internal [GOptionContext] of [application]
      is created.

      See g_option_context_new() for more information about [parameter_string].
  *)

  method set_option_context_summary : string option -> unit
  (** Adds a summary to the [application] option context.

      See g_option_context_set_summary() for more information. *)

  method set_resource_base_path : string option -> unit
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

  method set_version : string -> unit
  (** Sets the version number of [application]. This will be used to implement a
      [--version] command line argument

      The application version can only be modified if [application] has not yet
      been registered. *)

  method unbind_busy_property : [ `object_ ] Gobject.obj -> string -> unit
  (** Destroys a binding between [property] and the busy state of [application]
      that was previously created with g_application_bind_busy_property(). *)

  method unmark_busy : unit -> unit
  (** Decreases the busy count of [application].

      When the busy count reaches zero, the new state will be propagated to
      other processes.

      This function must only be called to cancel the effect of a previous call
      to g_application_mark_busy(). *)

  method withdraw_notification : string -> unit
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

  method as_application : Raw.Application.t
end

(* High-level class for Application *)
class application (obj : Raw.Application.t) : application_t =
  object (self)
    inherit Action_group.action_group (Raw.Action_group.from_gobject obj)
    inherit Action_map.action_map (Raw.Action_map.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.Application.on_activate ~after self#as_application ~callback

    method on_command_line ?(after = false) ~callback () =
      Raw.Application.on_command_line ~after self#as_application
        ~callback:(fun ~command_line ->
          callback
            ~command_line:
              (new Application_command_line.application_command_line
                 command_line))

    method on_name_lost ?(after = false) ~callback () =
      Raw.Application.on_name_lost ~after self#as_application ~callback

    method on_shutdown ?(after = false) ~callback () =
      Raw.Application.on_shutdown ~after self#as_application ~callback

    method on_startup ?(after = false) ~callback () =
      Raw.Application.on_startup ~after self#as_application ~callback

    method activate : unit -> unit = fun () -> Raw.Application.activate obj

    method bind_busy_property : [ `object_ ] Gobject.obj -> string -> unit =
      fun object_ property ->
        Raw.Application.bind_busy_property obj object_ property

    method get_application_id : unit -> string option =
      fun () -> Raw.Application.get_application_id obj

    method get_dbus_connection :
        unit -> D_bus_connection.d_bus_connection_t option =
      fun () ->
        Option.map
          (fun ret -> new D_bus_connection.d_bus_connection ret)
          (Raw.Application.get_dbus_connection obj)

    method get_dbus_object_path : unit -> string option =
      fun () -> Raw.Application.get_dbus_object_path obj

    method get_flags : unit -> Enums.applicationflags =
      fun () -> Raw.Application.get_flags obj

    method get_inactivity_timeout : unit -> int =
      fun () -> Raw.Application.get_inactivity_timeout obj

    method get_is_busy : unit -> bool =
      fun () -> Raw.Application.get_is_busy obj

    method get_is_registered : unit -> bool =
      fun () -> Raw.Application.get_is_registered obj

    method get_is_remote : unit -> bool =
      fun () -> Raw.Application.get_is_remote obj

    method get_resource_base_path : unit -> string option =
      fun () -> Raw.Application.get_resource_base_path obj

    method get_version : unit -> string option =
      fun () -> Raw.Application.get_version obj

    method hold : unit -> unit = fun () -> Raw.Application.hold obj
    method mark_busy : unit -> unit = fun () -> Raw.Application.mark_busy obj

    method open_ : Raw.File.t array -> int -> string -> unit =
      fun files n_files hint -> Raw.Application.open_ obj files n_files hint

    method quit : unit -> unit = fun () -> Raw.Application.quit obj

    method register :
        Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Application.register obj cancellable

    method release : unit -> unit = fun () -> Raw.Application.release obj

    method run : int -> string array option -> int =
      fun argc argv -> Raw.Application.run obj argc argv

    method send_notification :
        string option -> Notification.notification_t -> unit =
      fun id notification ->
        let notification = notification#as_notification in
        Raw.Application.send_notification obj id notification

    method set_action_group : Action_group.action_group_t option -> unit =
      fun action_group ->
        let action_group =
          Option.map (fun c -> c#as_action_group) action_group
        in
        Raw.Application.set_action_group obj action_group

    method set_application_id : string option -> unit =
      fun application_id ->
        Raw.Application.set_application_id obj application_id

    method set_default : unit -> unit =
      fun () -> Raw.Application.set_default obj

    method set_flags : Enums.applicationflags -> unit =
      fun flags -> Raw.Application.set_flags obj flags

    method set_inactivity_timeout : int -> unit =
      fun inactivity_timeout ->
        Raw.Application.set_inactivity_timeout obj inactivity_timeout

    method set_option_context_description : string option -> unit =
      fun description ->
        Raw.Application.set_option_context_description obj description

    method set_option_context_parameter_string : string option -> unit =
      fun parameter_string ->
        Raw.Application.set_option_context_parameter_string obj parameter_string

    method set_option_context_summary : string option -> unit =
      fun summary -> Raw.Application.set_option_context_summary obj summary

    method set_resource_base_path : string option -> unit =
      fun resource_path ->
        Raw.Application.set_resource_base_path obj resource_path

    method set_version : string -> unit =
      fun version -> Raw.Application.set_version obj version

    method unbind_busy_property : [ `object_ ] Gobject.obj -> string -> unit =
      fun object_ property ->
        Raw.Application.unbind_busy_property obj object_ property

    method unmark_busy : unit -> unit =
      fun () -> Raw.Application.unmark_busy obj

    method withdraw_notification : string -> unit =
      fun id -> Raw.Application.withdraw_notification obj id

    method as_application = obj
  end

let new_ (application_id : string option) (flags : Enums.applicationflags) :
    application_t =
  let obj_ = Raw.Application.new_ application_id flags in
  new application obj_
