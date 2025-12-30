(* GENERATED CODE - DO NOT EDIT *)
(* Application: Application *)

type t = [`application | `object_] Gobject.obj

(** Create a new Application *)
external new_ : string option -> Gio_enums.applicationflags -> t = "ml_g_application_new"

(* Methods *)
(** Withdraws a notification that was sent with
g_application_send_notification().

This call does nothing if a notification with @id doesn't exist or
the notification was never sent.

This function works even for notifications sent in previous
executions of this application, as long @id is the same as it was for
the sent notification.

Note that notifications are dismissed when the user clicks on one
of the buttons in a notification or triggers its default action, so
there is no need to explicitly withdraw the notification in that case. *)
external withdraw_notification : t -> string -> unit = "ml_g_application_withdraw_notification"

(** Decreases the busy count of @application.

When the busy count reaches zero, the new state will be propagated
to other processes.

This function must only be called to cancel the effect of a previous
call to g_application_mark_busy(). *)
external unmark_busy : t -> unit = "ml_g_application_unmark_busy"

(** Sets the version number of @application. This will be used to implement
a `--version` command line argument

The application version can only be modified if @application has not yet
been registered. *)
external set_version : t -> string -> unit = "ml_g_application_set_version"

(** Sets (or unsets) the base resource path of @application.

The path is used to automatically load various [application
resources][gresource] such as menu layouts and action descriptions.
The various types of resources will be found at fixed names relative
to the given base path.

By default, the resource base path is determined from the application
ID by prefixing '/' and replacing each '.' with '/'.  This is done at
the time that the #GApplication object is constructed.  Changes to
the application ID after that point will not have an impact on the
resource base path.

As an example, if the application has an ID of "org.example.app" then
the default resource base path will be "/org/example/app".  If this
is a #GtkApplication (and you have not manually changed the path)
then Gtk will then search for the menus of the application at
"/org/example/app/gtk/menus.ui".

See #GResource for more information about adding resources to your
application.

You can disable automatic resource loading functionality by setting
the path to %NULL.

Changing the resource base path once the application is running is
not recommended.  The point at which the resource path is consulted
for forming paths for various purposes is unspecified.  When writing
a sub-class of #GApplication you should either set the
#GApplication:resource-base-path property at construction time, or call
this function during the instance initialization. Alternatively, you
can call this function in the #GApplicationClass.startup virtual function,
before chaining up to the parent implementation. *)
external set_resource_base_path : t -> string option -> unit = "ml_g_application_set_resource_base_path"

(** Adds a summary to the @application option context.

See g_option_context_set_summary() for more information. *)
external set_option_context_summary : t -> string option -> unit = "ml_g_application_set_option_context_summary"

(** Sets the parameter string to be used by the commandline handling of @application.

This function registers the argument to be passed to g_option_context_new()
when the internal #GOptionContext of @application is created.

See g_option_context_new() for more information about @parameter_string. *)
external set_option_context_parameter_string : t -> string option -> unit = "ml_g_application_set_option_context_parameter_string"

(** Adds a description to the @application option context.

See g_option_context_set_description() for more information. *)
external set_option_context_description : t -> string option -> unit = "ml_g_application_set_option_context_description"

(** Sets the current inactivity timeout for the application.

This is the amount of time (in milliseconds) after the last call to
g_application_release() before the application stops running.

This call has no side effects of its own.  The value set here is only
used for next time g_application_release() drops the use count to
zero.  Any timeouts currently in progress are not impacted. *)
external set_inactivity_timeout : t -> int -> unit = "ml_g_application_set_inactivity_timeout"

(** Sets the flags for @application.

The flags can only be modified if @application has not yet been
registered.

See #GApplicationFlags. *)
external set_flags : t -> Gio_enums.applicationflags -> unit = "ml_g_application_set_flags"

(** Sets or unsets the default application for the process, as returned
by g_application_get_default().

This function does not take its own reference on @application.  If
@application is destroyed then the default application will revert
back to %NULL. *)
external set_default : t -> unit = "ml_g_application_set_default"

(** Sets the unique identifier for @application.

The application id can only be modified if @application has not yet
been registered.

If non-%NULL, the application id must be valid.  See
g_application_id_is_valid(). *)
external set_application_id : t -> string option -> unit = "ml_g_application_set_application_id"

(** This used to be how actions were associated with a #GApplication.
Now there is #GActionMap for that. *)
external set_action_group : t -> Action_group.t option -> unit = "ml_g_application_set_action_group"

(** Sends a notification on behalf of @application to the desktop shell.
There is no guarantee that the notification is displayed immediately,
or even at all.

Notifications may persist after the application exits. It will be
D-Bus-activated when the notification or one of its actions is
activated.

Modifying @notification after this call has no effect. However, the
object can be reused for a later call to this function.

@id may be any string that uniquely identifies the event for the
application. It does not need to be in any special format. For
example, "new-message" might be appropriate for a notification about
new messages.

If a previous notification was sent with the same @id, it will be
replaced with @notification and shown again as if it was a new
notification. This works even for notifications sent from a previous
execution of the application, as long as @id is the same string.

@id may be %NULL, but it is impossible to replace or withdraw
notifications without an id.

If @notification is no longer relevant, it can be withdrawn with
g_application_withdraw_notification().

It is an error to call this function if @application has no
application ID. *)
external send_notification : t -> string option -> Notification.t -> unit = "ml_g_application_send_notification"

(** Decrease the use count of @application.

When the use count reaches zero, the application will stop running.

Never call this function except to cancel the effect of a previous
call to g_application_hold(). *)
external release : t -> unit = "ml_g_application_release"

(** Attempts registration of the application.

This is the point at which the application discovers if it is the
primary instance or merely acting as a remote for an already-existing
primary instance.  This is implemented by attempting to acquire the
application identifier as a unique bus name on the session bus using
GDBus.

If there is no application ID or if %G_APPLICATION_NON_UNIQUE was
given, then this process will always become the primary instance.

Due to the internal architecture of GDBus, method calls can be
dispatched at any time (even if a main loop is not running).  For
this reason, you must ensure that any object paths that you wish to
register are registered before calling this function.

If the application has already been registered then %TRUE is
returned with no work performed.

The #GApplication::startup signal is emitted if registration succeeds
and @application is the primary instance (including the non-unique
case).

In the event of an error (such as @cancellable being cancelled, or a
failure to connect to the session bus), %FALSE is returned and @error
is set appropriately.

Note: the return value of this function is not an indicator that this
instance is or is not the primary instance of the application.  See
g_application_get_is_remote() for that. *)
external register : t -> Cancellable.t option -> (bool, GError.t) result = "ml_g_application_register"

(** Immediately quits the application.

Upon return to the mainloop, g_application_run() will return,
calling only the 'shutdown' function before doing so.

The hold count is ignored.
Take care if your code has called g_application_hold() on the application and
is therefore still expecting it to exist.
(Note that you may have called g_application_hold() indirectly, for example
through gtk_application_add_window().)

The result of calling g_application_run() again after it returns is
unspecified. *)
external quit : t -> unit = "ml_g_application_quit"

(** Increases the busy count of @application.

Use this function to indicate that the application is busy, for instance
while a long running operation is pending.

The busy state will be exposed to other processes, so a session shell will
use that information to indicate the state to the user (e.g. with a
spinner).

To cancel the busy indication, use g_application_unmark_busy().

The application must be registered before calling this function. *)
external mark_busy : t -> unit = "ml_g_application_mark_busy"

(** Increases the use count of @application.

Use this function to indicate that the application has a reason to
continue to run.  For example, g_application_hold() is called by GTK
when a toplevel window is on the screen.

To cancel the hold, call g_application_release(). *)
external hold : t -> unit = "ml_g_application_hold"

(** Gets the version of @application. *)
external get_version : t -> string option = "ml_g_application_get_version"

(** Gets the resource base path of @application.

See g_application_set_resource_base_path() for more information. *)
external get_resource_base_path : t -> string option = "ml_g_application_get_resource_base_path"

(** Checks if @application is remote.

If @application is remote then it means that another instance of
application already exists (the 'primary' instance).  Calls to
perform actions on @application will result in the actions being
performed by the primary instance.

The value of this property cannot be accessed before
g_application_register() has been called.  See
g_application_get_is_registered(). *)
external get_is_remote : t -> bool = "ml_g_application_get_is_remote"

(** Checks if @application is registered.

An application is registered if g_application_register() has been
successfully called. *)
external get_is_registered : t -> bool = "ml_g_application_get_is_registered"

(** Gets the application's current busy state, as set through
g_application_mark_busy() or g_application_bind_busy_property(). *)
external get_is_busy : t -> bool = "ml_g_application_get_is_busy"

(** Gets the current inactivity timeout for the application.

This is the amount of time (in milliseconds) after the last call to
g_application_release() before the application stops running. *)
external get_inactivity_timeout : t -> int = "ml_g_application_get_inactivity_timeout"

(** Gets the flags for @application.

See #GApplicationFlags. *)
external get_flags : t -> Gio_enums.applicationflags = "ml_g_application_get_flags"

(** Gets the D-Bus object path being used by the application, or %NULL.

If #GApplication is using its D-Bus backend then this function will
return the D-Bus object path that #GApplication is using.  If the
application is the primary instance then there is an object published
at this path.  If the application is not the primary instance then
the result of this function is undefined.

If #GApplication is not using D-Bus then this function will return
%NULL.  This includes the situation where the D-Bus backend would
normally be in use but we were unable to connect to the bus.

This function must not be called before the application has been
registered.  See g_application_get_is_registered(). *)
external get_dbus_object_path : t -> string option = "ml_g_application_get_dbus_object_path"

(** Gets the #GDBusConnection being used by the application, or %NULL.

If #GApplication is using its D-Bus backend then this function will
return the #GDBusConnection being used for uniqueness and
communication with the desktop environment and other instances of the
application.

If #GApplication is not using D-Bus then this function will return
%NULL.  This includes the situation where the D-Bus backend would
normally be in use but we were unable to connect to the bus.

This function must not be called before the application has been
registered.  See g_application_get_is_registered(). *)
external get_dbus_connection : t -> D_bus_connection.t option = "ml_g_application_get_dbus_connection"

(** Gets the unique identifier for @application. *)
external get_application_id : t -> string option = "ml_g_application_get_application_id"

(** Activates the application.

In essence, this results in the #GApplication::activate signal being
emitted in the primary instance.

The application must be registered before calling this function. *)
external activate : t -> unit = "ml_g_application_activate"

(* Properties *)

