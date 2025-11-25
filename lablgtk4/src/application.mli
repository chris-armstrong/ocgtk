(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Application *)

type t = Gtk.widget

(** Create a new Application *)
external new_ : string option -> unit -> t = "ml_gtk_application_new"

(* Properties *)

(** Removes an inhibitor that has been previously established.

See [method@Gtk.Application.inhibit].

Inhibitors are also cleared when the application exits. *)
external uninhibit : t -> int -> unit = "ml_gtk_application_uninhibit"

(** Remove a window from `application`.

If `window` belongs to `application` then this call is equivalent to
setting the [property@Gtk.Window:application] property of `window` to
`NULL`.

The application may stop running as a result of a call to this
function, if `window` was the last window of the `application`. *)
external remove_window : t -> Gtk.widget -> unit = "ml_gtk_application_remove_window"

(** Lists the detailed action names which have associated accelerators.

See [method@Gtk.Application.set_accels_for_action]. *)
external list_action_descriptions : t -> unit = "ml_gtk_application_list_action_descriptions"

(** Inform the session manager that certain types of actions should be
inhibited.

This is not guaranteed to work on all platforms and for all types of
actions.

Applications should invoke this method when they begin an operation
that should not be interrupted, such as creating a CD or DVD. The
types of actions that may be blocked are specified by the `flags`
parameter. When the application completes the operation it should
call [method@Gtk.Application.uninhibit] to remove the inhibitor. Note
that an application can have multiple inhibitors, and all of them must
be individually removed. Inhibitors are also cleared when the
application exits.

Applications should not expect that they will always be able to block
the action. In most cases, users will be given the option to force
the action to take place.

The `reason` message should be short and to the point.

If `window` is given, the session manager may point the user to
this window to find out more about why the action is inhibited. *)
external inhibit : t -> Gtk.widget option -> Gtk_enums.applicationinhibitflags -> string option -> int = "ml_gtk_application_inhibit"

(** Returns the [class@Gtk.ApplicationWindow] with the given ID.

The ID of a `GtkApplicationWindow` can be retrieved with
[method@Gtk.ApplicationWindow.get_id]. *)
external get_window_by_id : t -> int -> Gtk.widget option = "ml_gtk_application_get_window_by_id"

(** Gets the “active” window for the application.

The active window is the one that was most recently focused (within
the application).  This window may not have the focus at the moment
if another application has it — this is just the most
recently-focused window within this application. *)
external get_active_window : t -> Gtk.widget option = "ml_gtk_application_get_active_window"

(** Returns the list of actions (possibly empty) that `accel` maps to.

Each item in the list is a detailed action name in the usual form.

This might be useful to discover if an accel already exists in
order to prevent installation of a conflicting accelerator (from
an accelerator editor or a plugin system, for example). Note that
having more than one action per accelerator may not be a bad thing
and might make sense in cases where the actions never appear in the
same context.

In case there are no actions for a given accelerator, an empty array
is returned. `NULL` is never returned.

It is a programmer error to pass an invalid accelerator string.

If you are unsure, check it with [func@Gtk.accelerator_parse] first. *)
external get_actions_for_accel : t -> string -> unit = "ml_gtk_application_get_actions_for_accel"

(** Gets the accelerators that are currently associated with
the given action. *)
external get_accels_for_action : t -> string -> unit = "ml_gtk_application_get_accels_for_action"

(** Adds a window to `application`.

This call can only happen after the `application` has started;
typically, you should add new application windows in response
to the emission of the `GApplication::activate` signal.

This call is equivalent to setting the [property@Gtk.Window:application]
property of `window` to `application`.

Normally, the connection between the application and the window
will remain until the window is destroyed, but you can explicitly
remove it with [method@Gtk.Application.remove_window].

GTK will keep the `application` running as long as it has
any windows. *)
external add_window : t -> Gtk.widget -> unit = "ml_gtk_application_add_window"

