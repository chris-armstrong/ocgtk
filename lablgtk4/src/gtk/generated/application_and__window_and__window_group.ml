(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

module rec Application : sig
  type t = [`application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application] Gobject.obj

  (** Create a new Application *)
  external new_ : string option -> unit -> t = "ml_gtk_application_new"

  (* Properties *)

  (** Get property: register-session *)
  external get_register_session : t -> bool = "ml_gtk_application_get_register_session"

  (** Set property: register-session *)
  external set_register_session : t -> bool -> unit = "ml_gtk_application_set_register_session"

  (** Get property: screensaver-active *)
  external get_screensaver_active : t -> bool = "ml_gtk_application_get_screensaver_active"

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
  external remove_window : t -> Window.t -> unit = "ml_gtk_application_remove_window"

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
  external inhibit : t -> Window.t option -> Gtk_enums.applicationinhibitflags -> string option -> int = "ml_gtk_application_inhibit"

  (** Returns the [class@Gtk.ApplicationWindow] with the given ID.

  The ID of a `GtkApplicationWindow` can be retrieved with
  [method@Gtk.ApplicationWindow.get_id]. *)
  external get_window_by_id : t -> int -> Window.t option = "ml_gtk_application_get_window_by_id"

  (** Gets the “active” window for the application.

  The active window is the one that was most recently focused (within
  the application).  This window may not have the focus at the moment
  if another application has it — this is just the most
  recently-focused window within this application. *)
  external get_active_window : t -> Window.t option = "ml_gtk_application_get_active_window"

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
  external add_window : t -> Window.t -> unit = "ml_gtk_application_add_window"


end = struct
  type t = [`application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application | `application] Gobject.obj

  (** Create a new Application *)
  external new_ : string option -> unit -> t = "ml_gtk_application_new"

  (* Properties *)

  (** Get property: register-session *)
  external get_register_session : t -> bool = "ml_gtk_application_get_register_session"

  (** Set property: register-session *)
  external set_register_session : t -> bool -> unit = "ml_gtk_application_set_register_session"

  (** Get property: screensaver-active *)
  external get_screensaver_active : t -> bool = "ml_gtk_application_get_screensaver_active"

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
  external remove_window : t -> Window.t -> unit = "ml_gtk_application_remove_window"

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
  external inhibit : t -> Window.t option -> Gtk_enums.applicationinhibitflags -> string option -> int = "ml_gtk_application_inhibit"

  (** Returns the [class@Gtk.ApplicationWindow] with the given ID.

  The ID of a `GtkApplicationWindow` can be retrieved with
  [method@Gtk.ApplicationWindow.get_id]. *)
  external get_window_by_id : t -> int -> Window.t option = "ml_gtk_application_get_window_by_id"

  (** Gets the “active” window for the application.

  The active window is the one that was most recently focused (within
  the application).  This window may not have the focus at the moment
  if another application has it — this is just the most
  recently-focused window within this application. *)
  external get_active_window : t -> Window.t option = "ml_gtk_application_get_active_window"

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
  external add_window : t -> Window.t -> unit = "ml_gtk_application_add_window"


end

and Window
 : sig
  type t = [`window | `widget | `initially_unowned] Gobject.obj

  val as_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t

  (** Create a new Window *)
  external new_ : unit -> t = "ml_gtk_window_new"

  (* Properties *)

  (** Get property: decorated *)
  external get_decorated : t -> bool = "ml_gtk_window_get_decorated"

  (** Set property: decorated *)
  external set_decorated : t -> bool -> unit = "ml_gtk_window_set_decorated"

  (** Get property: default-height *)
  external get_default_height : t -> int = "ml_gtk_window_get_default_height"

  (** Set property: default-height *)
  external set_default_height : t -> int -> unit = "ml_gtk_window_set_default_height"

  (** Get property: default-width *)
  external get_default_width : t -> int = "ml_gtk_window_get_default_width"

  (** Set property: default-width *)
  external set_default_width : t -> int -> unit = "ml_gtk_window_set_default_width"

  (** Get property: deletable *)
  external get_deletable : t -> bool = "ml_gtk_window_get_deletable"

  (** Set property: deletable *)
  external set_deletable : t -> bool -> unit = "ml_gtk_window_set_deletable"

  (** Get property: destroy-with-parent *)
  external get_destroy_with_parent : t -> bool = "ml_gtk_window_get_destroy_with_parent"

  (** Set property: destroy-with-parent *)
  external set_destroy_with_parent : t -> bool -> unit = "ml_gtk_window_set_destroy_with_parent"

  (** Get property: focus-visible *)
  external get_focus_visible : t -> bool = "ml_gtk_window_get_focus_visible"

  (** Set property: focus-visible *)
  external set_focus_visible : t -> bool -> unit = "ml_gtk_window_set_focus_visible"

  (** Get property: fullscreened *)
  external get_fullscreened : t -> bool = "ml_gtk_window_get_fullscreened"

  (** Set property: fullscreened *)
  external set_fullscreened : t -> bool -> unit = "ml_gtk_window_set_fullscreened"

  (** Get property: handle-menubar-accel *)
  external get_handle_menubar_accel : t -> bool = "ml_gtk_window_get_handle_menubar_accel"

  (** Set property: handle-menubar-accel *)
  external set_handle_menubar_accel : t -> bool -> unit = "ml_gtk_window_set_handle_menubar_accel"

  (** Get property: hide-on-close *)
  external get_hide_on_close : t -> bool = "ml_gtk_window_get_hide_on_close"

  (** Set property: hide-on-close *)
  external set_hide_on_close : t -> bool -> unit = "ml_gtk_window_set_hide_on_close"

  (** Get property: icon-name *)
  external get_icon_name : t -> string = "ml_gtk_window_get_icon_name"

  (** Set property: icon-name *)
  external set_icon_name : t -> string -> unit = "ml_gtk_window_set_icon_name"

  (** Get property: is-active *)
  external get_is_active : t -> bool = "ml_gtk_window_get_is_active"

  (** Get property: maximized *)
  external get_maximized : t -> bool = "ml_gtk_window_get_maximized"

  (** Set property: maximized *)
  external set_maximized : t -> bool -> unit = "ml_gtk_window_set_maximized"

  (** Get property: mnemonics-visible *)
  external get_mnemonics_visible : t -> bool = "ml_gtk_window_get_mnemonics_visible"

  (** Set property: mnemonics-visible *)
  external set_mnemonics_visible : t -> bool -> unit = "ml_gtk_window_set_mnemonics_visible"

  (** Get property: modal *)
  external get_modal : t -> bool = "ml_gtk_window_get_modal"

  (** Set property: modal *)
  external set_modal : t -> bool -> unit = "ml_gtk_window_set_modal"

  (** Get property: resizable *)
  external get_resizable : t -> bool = "ml_gtk_window_get_resizable"

  (** Set property: resizable *)
  external set_resizable : t -> bool -> unit = "ml_gtk_window_set_resizable"

  (** Get property: startup-id *)
  external get_startup_id : t -> string = "ml_gtk_window_get_startup_id"

  (** Set property: startup-id *)
  external set_startup_id : t -> string -> unit = "ml_gtk_window_set_startup_id"

  (** Get property: suspended *)
  external get_suspended : t -> bool = "ml_gtk_window_get_suspended"

  (** Get property: title *)
  external get_title : t -> string = "ml_gtk_window_get_title"

  (** Set property: title *)
  external set_title : t -> string -> unit = "ml_gtk_window_set_title"

  (** Asks to unminimize the specified @window.

  Note that you shouldn’t assume the window is definitely unminimized
  afterward, because the windowing system might not support this
  functionality; other entities (e.g. the user or the window manager)
  could minimize it again, or there may not be a window manager in
  which case minimization isn’t possible, etc.

  You can track result of this operation via the
  [property@Gdk.Toplevel:state] property. *)
  external unminimize : t -> unit = "ml_gtk_window_unminimize"

  (** Asks to unmaximize @window.

  Note that you shouldn’t assume the window is definitely unmaximized
  afterward, because other entities (e.g. the user or window manager)
  maximize it again, and not all window managers honor requests to
  unmaximize.

  You can track the result of this operation via the
  [property@Gdk.Toplevel:state] property, or by listening to
  notifications on the [property@Gtk.Window:maximized] property. *)
  external unmaximize : t -> unit = "ml_gtk_window_unmaximize"

  (** Asks to remove the fullscreen state for @window, and return to
  its previous state.

  Note that you shouldn’t assume the window is definitely not
  fullscreen afterward, because other entities (e.g. the user or
  window manager) could fullscreen it again, and not all window
  managers honor requests to unfullscreen windows; normally the
  window will end up restored to its normal state. Just don’t
  write code that crashes if not.

  You can track the result of this operation via the
  [property@Gdk.Toplevel:state] property, or by listening to
  notifications of the [property@Gtk.Window:fullscreened] property. *)
  external unfullscreen : t -> unit = "ml_gtk_window_unfullscreen"

  (** Dialog windows should be set transient for the main application
  window they were spawned from. This allows window managers to e.g.
  keep the dialog on top of the main window, or center the dialog
  over the main window. [ctor@Gtk.Dialog.new_with_buttons] and other
  convenience functions in GTK will sometimes call
  gtk_window_set_transient_for() on your behalf.

  Passing %NULL for @parent unsets the current transient window.

  On Windows, this function puts the child window on top of the parent,
  much as the window manager would have done on X. *)
  external set_transient_for : t -> t option -> unit = "ml_gtk_window_set_transient_for"

  (** Sets a custom titlebar for @window.

  A typical widget used here is [class@Gtk.HeaderBar], as it
  provides various features expected of a titlebar while allowing
  the addition of child widgets to it.

  If you set a custom titlebar, GTK will do its best to convince
  the window manager not to put its own titlebar on the window.
  Depending on the system, this function may not work for a window
  that is already visible, so you set the titlebar before calling
  [method@Gtk.Widget.show]. *)
  external set_titlebar : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_window_set_titlebar"

  (** Sets the focus widget.

  If @focus is not the current focus widget, and is focusable,
  sets it as the focus widget for the window. If @focus is %NULL,
  unsets the focus widget for this window. To set the focus to a
  particular widget in the toplevel, it is usually more convenient
  to use [method@Gtk.Widget.grab_focus] instead of this function. *)
  external set_focus : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_window_set_focus"

  (** Sets the default widget.

  The default widget is the widget that is activated when the user
  presses Enter in a dialog (for example). *)
  external set_default_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_window_set_default_widget"

  (** Sets the default size of a window.

  The default size of a window is the size that will be used if no other constraints apply.

  The default size will be updated whenever the window is resized
  to reflect the new size, unless the window is forced to a size,
  like when it is maximized or fullscreened.

  If the window’s minimum size request is larger than
  the default, the default will be ignored.

  Setting the default size to a value <= 0 will cause it to be
  ignored and the natural size request will be used instead. It
  is possible to do this while the window is showing to "reset"
  it to its initial size.

  Unlike [method@Gtk.Widget.set_size_request], which sets a size
  request for a widget and thus would keep users from shrinking
  the window, this function only sets the initial size, just as
  if the user had resized the window themselves. Users can still
  shrink the window again as they normally would. Setting a default
  size of -1 means to use the “natural” default size (the size request
  of the window).

  If you use this function to reestablish a previously saved window size,
  note that the appropriate size to save is the one returned by
  [method@Gtk.Window.get_default_size]. Using the window allocation
  directly will not work in all circumstances and can lead to growing
  or shrinking windows. *)
  external set_default_size : t -> int -> int -> unit = "ml_gtk_window_set_default_size"

  (** Sets the child widget of @window. *)
  external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_window_set_child"

  (** Sets or unsets the `GtkApplication` associated with the window.

  The application will be kept alive for at least as long as it has
  any windows associated with it (see g_application_hold() for a way
  to keep it alive without windows).

  Normally, the connection between the application and the window will
  remain until the window is destroyed, but you can explicitly remove
  it by setting the @application to %NULL.

  This is equivalent to calling [method@Gtk.Application.remove_window]
  and/or [method@Gtk.Application.add_window] on the old/new applications
  as relevant. *)
  external set_application : t -> Application.t option -> unit = "ml_gtk_window_set_application"

  (** Presents a window to the user.

  This may mean raising the window in the stacking order,
  unminimizing it, moving it to the current desktop and/or
  giving it the keyboard focus (possibly dependent on the user’s
  platform, window manager and preferences).

  If @window is hidden, this function also makes it visible. *)
  external present : t -> unit = "ml_gtk_window_present"

  (** Asks to minimize the specified @window.

  Note that you shouldn’t assume the window is definitely minimized
  afterward, because the windowing system might not support this
  functionality; other entities (e.g. the user or the window manager)
  could unminimize it again, or there may not be a window manager in
  which case minimization isn’t possible, etc.

  It’s permitted to call this function before showing a window,
  in which case the window will be minimized before it ever appears
  onscreen.

  You can track result of this operation via the
  [property@Gdk.Toplevel:state] property. *)
  external minimize : t -> unit = "ml_gtk_window_minimize"

  (** Asks to maximize @window, so that it fills the screen.

  Note that you shouldn’t assume the window is definitely maximized
  afterward, because other entities (e.g. the user or window manager)
  could unmaximize it again, and not all window managers support
  maximization.

  It’s permitted to call this function before showing a window,
  in which case the window will be maximized when it appears onscreen
  initially.

  You can track the result of this operation via the
  [property@Gdk.Toplevel:state] property, or by listening to
  notifications on the [property@Gtk.Window:maximized]
  property. *)
  external maximize : t -> unit = "ml_gtk_window_maximize"

  (** Retrieves the current suspended state of @window.

  A window being suspended means it's currently not visible to the user, for
  example by being on a inactive workspace, minimized, obstructed. *)
  external is_suspended : t -> bool = "ml_gtk_window_is_suspended"

  (** Retrieves the current maximized state of @window.

  Note that since maximization is ultimately handled by the window
  manager and happens asynchronously to an application request, you
  shouldn’t assume the return value of this function changing
  immediately (or at all), as an effect of calling
  [method@Gtk.Window.maximize] or [method@Gtk.Window.unmaximize].

  If the window isn't yet mapped, the value returned will whether the
  initial requested state is maximized. *)
  external is_maximized : t -> bool = "ml_gtk_window_is_maximized"

  (** Retrieves the current fullscreen state of @window.

  Note that since fullscreening is ultimately handled by the window
  manager and happens asynchronously to an application request, you
  shouldn’t assume the return value of this function changing
  immediately (or at all), as an effect of calling
  [method@Gtk.Window.fullscreen] or [method@Gtk.Window.unfullscreen].

  If the window isn't yet mapped, the value returned will whether the
  initial requested state is fullscreen. *)
  external is_fullscreen : t -> bool = "ml_gtk_window_is_fullscreen"

  (** Returns whether the window is part of the current active toplevel.

  The active toplevel is the window receiving keystrokes.

  The return value is %TRUE if the window is active toplevel itself.
  You might use this function if you wanted to draw a widget
  differently in an active window from a widget in an inactive window. *)
  external is_active : t -> bool = "ml_gtk_window_is_active"

  (** Returns whether @window has an explicit window group. *)
  external has_group : t -> bool = "ml_gtk_window_has_group"

  (** Fetches the transient parent for this window. *)
  external get_transient_for : t -> t option = "ml_gtk_window_get_transient_for"

  (** Returns the custom titlebar that has been set with
  gtk_window_set_titlebar(). *)
  external get_titlebar : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_window_get_titlebar"

  (** Returns the group for @window.

  If the window has no group, then the default group is returned. *)
  external get_group : t -> Window_group.t = "ml_gtk_window_get_group"

  (** Retrieves the current focused widget within the window.

  Note that this is the widget that would have the focus
  if the toplevel window focused; if the toplevel window
  is not focused then `gtk_widget_has_focus (widget)` will
  not be %TRUE for the widget. *)
  external get_focus : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_window_get_focus"

  (** Returns the default widget for @window. *)
  external get_default_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_window_get_default_widget"

  (** Gets the child widget of @window. *)
  external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_window_get_child"

  (** Gets the `GtkApplication` associated with the window. *)
  external get_application : t -> Application.t option = "ml_gtk_window_get_application"

  (** Asks to place @window in the fullscreen state.

  Note that you shouldn’t assume the window is definitely fullscreen
  afterward, because other entities (e.g. the user or window manager)
  unfullscreen it again, and not all window managers honor requests
  to fullscreen windows.

  You can track the result of this operation via the
  [property@Gdk.Toplevel:state] property, or by listening to
  notifications of the [property@Gtk.Window:fullscreened] property. *)
  external fullscreen : t -> unit = "ml_gtk_window_fullscreen"

  (** Drop the internal reference GTK holds on toplevel windows. *)
  external destroy : t -> unit = "ml_gtk_window_destroy"

  (** Requests that the window is closed.

  This is similar to what happens when a window manager
  close button is clicked.

  This function can be used with close buttons in custom
  titlebars. *)
  external close : t -> unit = "ml_gtk_window_close"


end = struct
  type t = [`window | `widget | `initially_unowned] Gobject.obj

  let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

  (** Create a new Window *)
  external new_ : unit -> t = "ml_gtk_window_new"

  (* Properties *)

  (** Get property: decorated *)
  external get_decorated : t -> bool = "ml_gtk_window_get_decorated"

  (** Set property: decorated *)
  external set_decorated : t -> bool -> unit = "ml_gtk_window_set_decorated"

  (** Get property: default-height *)
  external get_default_height : t -> int = "ml_gtk_window_get_default_height"

  (** Set property: default-height *)
  external set_default_height : t -> int -> unit = "ml_gtk_window_set_default_height"

  (** Get property: default-width *)
  external get_default_width : t -> int = "ml_gtk_window_get_default_width"

  (** Set property: default-width *)
  external set_default_width : t -> int -> unit = "ml_gtk_window_set_default_width"

  (** Get property: deletable *)
  external get_deletable : t -> bool = "ml_gtk_window_get_deletable"

  (** Set property: deletable *)
  external set_deletable : t -> bool -> unit = "ml_gtk_window_set_deletable"

  (** Get property: destroy-with-parent *)
  external get_destroy_with_parent : t -> bool = "ml_gtk_window_get_destroy_with_parent"

  (** Set property: destroy-with-parent *)
  external set_destroy_with_parent : t -> bool -> unit = "ml_gtk_window_set_destroy_with_parent"

  (** Get property: focus-visible *)
  external get_focus_visible : t -> bool = "ml_gtk_window_get_focus_visible"

  (** Set property: focus-visible *)
  external set_focus_visible : t -> bool -> unit = "ml_gtk_window_set_focus_visible"

  (** Get property: fullscreened *)
  external get_fullscreened : t -> bool = "ml_gtk_window_get_fullscreened"

  (** Set property: fullscreened *)
  external set_fullscreened : t -> bool -> unit = "ml_gtk_window_set_fullscreened"

  (** Get property: handle-menubar-accel *)
  external get_handle_menubar_accel : t -> bool = "ml_gtk_window_get_handle_menubar_accel"

  (** Set property: handle-menubar-accel *)
  external set_handle_menubar_accel : t -> bool -> unit = "ml_gtk_window_set_handle_menubar_accel"

  (** Get property: hide-on-close *)
  external get_hide_on_close : t -> bool = "ml_gtk_window_get_hide_on_close"

  (** Set property: hide-on-close *)
  external set_hide_on_close : t -> bool -> unit = "ml_gtk_window_set_hide_on_close"

  (** Get property: icon-name *)
  external get_icon_name : t -> string = "ml_gtk_window_get_icon_name"

  (** Set property: icon-name *)
  external set_icon_name : t -> string -> unit = "ml_gtk_window_set_icon_name"

  (** Get property: is-active *)
  external get_is_active : t -> bool = "ml_gtk_window_get_is_active"

  (** Get property: maximized *)
  external get_maximized : t -> bool = "ml_gtk_window_get_maximized"

  (** Set property: maximized *)
  external set_maximized : t -> bool -> unit = "ml_gtk_window_set_maximized"

  (** Get property: mnemonics-visible *)
  external get_mnemonics_visible : t -> bool = "ml_gtk_window_get_mnemonics_visible"

  (** Set property: mnemonics-visible *)
  external set_mnemonics_visible : t -> bool -> unit = "ml_gtk_window_set_mnemonics_visible"

  (** Get property: modal *)
  external get_modal : t -> bool = "ml_gtk_window_get_modal"

  (** Set property: modal *)
  external set_modal : t -> bool -> unit = "ml_gtk_window_set_modal"

  (** Get property: resizable *)
  external get_resizable : t -> bool = "ml_gtk_window_get_resizable"

  (** Set property: resizable *)
  external set_resizable : t -> bool -> unit = "ml_gtk_window_set_resizable"

  (** Get property: startup-id *)
  external get_startup_id : t -> string = "ml_gtk_window_get_startup_id"

  (** Set property: startup-id *)
  external set_startup_id : t -> string -> unit = "ml_gtk_window_set_startup_id"

  (** Get property: suspended *)
  external get_suspended : t -> bool = "ml_gtk_window_get_suspended"

  (** Get property: title *)
  external get_title : t -> string = "ml_gtk_window_get_title"

  (** Set property: title *)
  external set_title : t -> string -> unit = "ml_gtk_window_set_title"

  (** Asks to unminimize the specified @window.

  Note that you shouldn’t assume the window is definitely unminimized
  afterward, because the windowing system might not support this
  functionality; other entities (e.g. the user or the window manager)
  could minimize it again, or there may not be a window manager in
  which case minimization isn’t possible, etc.

  You can track result of this operation via the
  [property@Gdk.Toplevel:state] property. *)
  external unminimize : t -> unit = "ml_gtk_window_unminimize"

  (** Asks to unmaximize @window.

  Note that you shouldn’t assume the window is definitely unmaximized
  afterward, because other entities (e.g. the user or window manager)
  maximize it again, and not all window managers honor requests to
  unmaximize.

  You can track the result of this operation via the
  [property@Gdk.Toplevel:state] property, or by listening to
  notifications on the [property@Gtk.Window:maximized] property. *)
  external unmaximize : t -> unit = "ml_gtk_window_unmaximize"

  (** Asks to remove the fullscreen state for @window, and return to
  its previous state.

  Note that you shouldn’t assume the window is definitely not
  fullscreen afterward, because other entities (e.g. the user or
  window manager) could fullscreen it again, and not all window
  managers honor requests to unfullscreen windows; normally the
  window will end up restored to its normal state. Just don’t
  write code that crashes if not.

  You can track the result of this operation via the
  [property@Gdk.Toplevel:state] property, or by listening to
  notifications of the [property@Gtk.Window:fullscreened] property. *)
  external unfullscreen : t -> unit = "ml_gtk_window_unfullscreen"

  (** Dialog windows should be set transient for the main application
  window they were spawned from. This allows window managers to e.g.
  keep the dialog on top of the main window, or center the dialog
  over the main window. [ctor@Gtk.Dialog.new_with_buttons] and other
  convenience functions in GTK will sometimes call
  gtk_window_set_transient_for() on your behalf.

  Passing %NULL for @parent unsets the current transient window.

  On Windows, this function puts the child window on top of the parent,
  much as the window manager would have done on X. *)
  external set_transient_for : t -> t option -> unit = "ml_gtk_window_set_transient_for"

  (** Sets a custom titlebar for @window.

  A typical widget used here is [class@Gtk.HeaderBar], as it
  provides various features expected of a titlebar while allowing
  the addition of child widgets to it.

  If you set a custom titlebar, GTK will do its best to convince
  the window manager not to put its own titlebar on the window.
  Depending on the system, this function may not work for a window
  that is already visible, so you set the titlebar before calling
  [method@Gtk.Widget.show]. *)
  external set_titlebar : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_window_set_titlebar"

  (** Sets the focus widget.

  If @focus is not the current focus widget, and is focusable,
  sets it as the focus widget for the window. If @focus is %NULL,
  unsets the focus widget for this window. To set the focus to a
  particular widget in the toplevel, it is usually more convenient
  to use [method@Gtk.Widget.grab_focus] instead of this function. *)
  external set_focus : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_window_set_focus"

  (** Sets the default widget.

  The default widget is the widget that is activated when the user
  presses Enter in a dialog (for example). *)
  external set_default_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_window_set_default_widget"

  (** Sets the default size of a window.

  The default size of a window is the size that will be used if no other constraints apply.

  The default size will be updated whenever the window is resized
  to reflect the new size, unless the window is forced to a size,
  like when it is maximized or fullscreened.

  If the window’s minimum size request is larger than
  the default, the default will be ignored.

  Setting the default size to a value <= 0 will cause it to be
  ignored and the natural size request will be used instead. It
  is possible to do this while the window is showing to "reset"
  it to its initial size.

  Unlike [method@Gtk.Widget.set_size_request], which sets a size
  request for a widget and thus would keep users from shrinking
  the window, this function only sets the initial size, just as
  if the user had resized the window themselves. Users can still
  shrink the window again as they normally would. Setting a default
  size of -1 means to use the “natural” default size (the size request
  of the window).

  If you use this function to reestablish a previously saved window size,
  note that the appropriate size to save is the one returned by
  [method@Gtk.Window.get_default_size]. Using the window allocation
  directly will not work in all circumstances and can lead to growing
  or shrinking windows. *)
  external set_default_size : t -> int -> int -> unit = "ml_gtk_window_set_default_size"

  (** Sets the child widget of @window. *)
  external set_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option -> unit = "ml_gtk_window_set_child"

  (** Sets or unsets the `GtkApplication` associated with the window.

  The application will be kept alive for at least as long as it has
  any windows associated with it (see g_application_hold() for a way
  to keep it alive without windows).

  Normally, the connection between the application and the window will
  remain until the window is destroyed, but you can explicitly remove
  it by setting the @application to %NULL.

  This is equivalent to calling [method@Gtk.Application.remove_window]
  and/or [method@Gtk.Application.add_window] on the old/new applications
  as relevant. *)
  external set_application : t -> Application.t option -> unit = "ml_gtk_window_set_application"

  (** Presents a window to the user.

  This may mean raising the window in the stacking order,
  unminimizing it, moving it to the current desktop and/or
  giving it the keyboard focus (possibly dependent on the user’s
  platform, window manager and preferences).

  If @window is hidden, this function also makes it visible. *)
  external present : t -> unit = "ml_gtk_window_present"

  (** Asks to minimize the specified @window.

  Note that you shouldn’t assume the window is definitely minimized
  afterward, because the windowing system might not support this
  functionality; other entities (e.g. the user or the window manager)
  could unminimize it again, or there may not be a window manager in
  which case minimization isn’t possible, etc.

  It’s permitted to call this function before showing a window,
  in which case the window will be minimized before it ever appears
  onscreen.

  You can track result of this operation via the
  [property@Gdk.Toplevel:state] property. *)
  external minimize : t -> unit = "ml_gtk_window_minimize"

  (** Asks to maximize @window, so that it fills the screen.

  Note that you shouldn’t assume the window is definitely maximized
  afterward, because other entities (e.g. the user or window manager)
  could unmaximize it again, and not all window managers support
  maximization.

  It’s permitted to call this function before showing a window,
  in which case the window will be maximized when it appears onscreen
  initially.

  You can track the result of this operation via the
  [property@Gdk.Toplevel:state] property, or by listening to
  notifications on the [property@Gtk.Window:maximized]
  property. *)
  external maximize : t -> unit = "ml_gtk_window_maximize"

  (** Retrieves the current suspended state of @window.

  A window being suspended means it's currently not visible to the user, for
  example by being on a inactive workspace, minimized, obstructed. *)
  external is_suspended : t -> bool = "ml_gtk_window_is_suspended"

  (** Retrieves the current maximized state of @window.

  Note that since maximization is ultimately handled by the window
  manager and happens asynchronously to an application request, you
  shouldn’t assume the return value of this function changing
  immediately (or at all), as an effect of calling
  [method@Gtk.Window.maximize] or [method@Gtk.Window.unmaximize].

  If the window isn't yet mapped, the value returned will whether the
  initial requested state is maximized. *)
  external is_maximized : t -> bool = "ml_gtk_window_is_maximized"

  (** Retrieves the current fullscreen state of @window.

  Note that since fullscreening is ultimately handled by the window
  manager and happens asynchronously to an application request, you
  shouldn’t assume the return value of this function changing
  immediately (or at all), as an effect of calling
  [method@Gtk.Window.fullscreen] or [method@Gtk.Window.unfullscreen].

  If the window isn't yet mapped, the value returned will whether the
  initial requested state is fullscreen. *)
  external is_fullscreen : t -> bool = "ml_gtk_window_is_fullscreen"

  (** Returns whether the window is part of the current active toplevel.

  The active toplevel is the window receiving keystrokes.

  The return value is %TRUE if the window is active toplevel itself.
  You might use this function if you wanted to draw a widget
  differently in an active window from a widget in an inactive window. *)
  external is_active : t -> bool = "ml_gtk_window_is_active"

  (** Returns whether @window has an explicit window group. *)
  external has_group : t -> bool = "ml_gtk_window_has_group"

  (** Fetches the transient parent for this window. *)
  external get_transient_for : t -> t option = "ml_gtk_window_get_transient_for"

  (** Returns the custom titlebar that has been set with
  gtk_window_set_titlebar(). *)
  external get_titlebar : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_window_get_titlebar"

  (** Returns the group for @window.

  If the window has no group, then the default group is returned. *)
  external get_group : t -> Window_group.t = "ml_gtk_window_get_group"

  (** Retrieves the current focused widget within the window.

  Note that this is the widget that would have the focus
  if the toplevel window focused; if the toplevel window
  is not focused then `gtk_widget_has_focus (widget)` will
  not be %TRUE for the widget. *)
  external get_focus : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_window_get_focus"

  (** Returns the default widget for @window. *)
  external get_default_widget : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_window_get_default_widget"

  (** Gets the child widget of @window. *)
  external get_child : t -> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t option = "ml_gtk_window_get_child"

  (** Gets the `GtkApplication` associated with the window. *)
  external get_application : t -> Application.t option = "ml_gtk_window_get_application"

  (** Asks to place @window in the fullscreen state.

  Note that you shouldn’t assume the window is definitely fullscreen
  afterward, because other entities (e.g. the user or window manager)
  unfullscreen it again, and not all window managers honor requests
  to fullscreen windows.

  You can track the result of this operation via the
  [property@Gdk.Toplevel:state] property, or by listening to
  notifications of the [property@Gtk.Window:fullscreened] property. *)
  external fullscreen : t -> unit = "ml_gtk_window_fullscreen"

  (** Drop the internal reference GTK holds on toplevel windows. *)
  external destroy : t -> unit = "ml_gtk_window_destroy"

  (** Requests that the window is closed.

  This is similar to what happens when a window manager
  close button is clicked.

  This function can be used with close buttons in custom
  titlebars. *)
  external close : t -> unit = "ml_gtk_window_close"


end

and Window_group
 : sig
  type t = [`window_group | `object_] Gobject.obj

  (** Create a new WindowGroup *)
  external new_ : unit -> t = "ml_gtk_window_group_new"

  (** Removes a window from a `GtkWindowGroup`. *)
  external remove_window : t -> Window.t -> unit = "ml_gtk_window_group_remove_window"

  (** Adds a window to a `GtkWindowGroup`. *)
  external add_window : t -> Window.t -> unit = "ml_gtk_window_group_add_window"


end = struct
  type t = [`window_group | `object_] Gobject.obj

  (** Create a new WindowGroup *)
  external new_ : unit -> t = "ml_gtk_window_group_new"

  (** Removes a window from a `GtkWindowGroup`. *)
  external remove_window : t -> Window.t -> unit = "ml_gtk_window_group_remove_window"

  (** Adds a window to a `GtkWindowGroup`. *)
  external add_window : t -> Window.t -> unit = "ml_gtk_window_group_add_window"


end
