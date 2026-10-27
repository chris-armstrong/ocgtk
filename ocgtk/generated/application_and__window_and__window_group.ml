(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type application_t = object
  inherit Ocgio.Application.application_t

  method on_query_end :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the session manager is about to end the session.

      Applications can connect to this signal and call [Gtk.Application.inhibit]
      with [Gtk.ApplicationInhibitFlags.logout] to delay the end of the session
      until state has been saved. *)

  method on_window_added :
    ?after:bool ->
    callback:(window:window_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a window is added to an application.

      See [Gtk.Application.add_window]. *)

  method on_window_removed :
    ?after:bool ->
    callback:(window:window_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a window is removed from an application.

      This can happen as a side-effect of the window being destroyed or
      explicitly through [Gtk.Application.remove_window]. *)

  method add_window : window_t -> unit
  (** Adds a window to the application.

      This call can only happen after the application has started; typically,
      you should add new application windows in response to the emission of the
      [GIO.Application::activate] signal.

      This call is equivalent to setting the [Gtk.Window:application] property
      of the window to [application].

      Normally, the connection between the application and the window will
      remain until the window is destroyed, but you can explicitly remove it
      with [Gtk.Application.remove_window].

      GTK will keep the application running as long as it has any windows. *)

  method get_accels_for_action : string -> string array
  (** Gets the accelerators that are currently associated with the given action.
  *)

  method get_actions_for_accel : string -> string array
  (** Returns the list of actions (possibly empty) that the accelerator maps to.

      Each item in the list is a detailed action name in the usual form.

      This might be useful to discover if an accel already exists in order to
      prevent installation of a conflicting accelerator (from an accelerator
      editor or a plugin system, for example). Note that having more than one
      action per accelerator may not be a bad thing and might make sense in
      cases where the actions never appear in the same context.

      In case there are no actions for a given accelerator, an empty array is
      returned. [NULL] is never returned.

      It is a programmer error to pass an invalid accelerator string.

      If you are unsure, check it with [Gtk.accelerator_parse] first. *)

  method get_active_window : unit -> window_t option
  (** Gets the “active” window for the application.

      The active window is the one that was most recently focused (within the
      application). This window may not have the focus at the moment if another
      application has it — this is just the most recently-focused window within
      this application. *)

  method get_menu_by_id : string -> Ocgio.Menu.menu_t option
  (** Gets a menu from automatically loaded resources.

      See the section on Automatic resources for more information. *)

  method get_menubar : unit -> Ocgio.Menu_model.menu_model_t option
  (** Returns the menu model for the menu bar of the application. *)

  method get_window_by_id : int -> window_t option
  (** Returns the window with the given ID.

      The ID of a [GtkApplicationWindow] can be retrieved with
      [Gtk.ApplicationWindow.get_id]. *)

  method get_windows : unit -> window_t list
  (** Gets a list of the window associated with the application.

      The list is sorted by most recently focused window, such that the first
      element is the currently focused window. (Useful for choosing a parent for
      a transient window.)

      The list that is returned should not be modified in any way. It will only
      remain valid until the next focus change or window creation or deletion.
  *)

  method inhibit :
    window_t option -> Enums.applicationinhibitflags -> string option -> int
  (** Informs the session manager that certain types of actions should be
      inhibited.

      This is not guaranteed to work on all platforms and for all types of
      actions.

      Applications should invoke this method when they begin an operation that
      should not be interrupted, such as creating a CD or DVD. The types of
      actions that may be blocked are specified by the [flags] parameter. When
      the application completes the operation it should call
      [Gtk.Application.uninhibit] to remove the inhibitor. Note that an
      application can have multiple inhibitors, and all of them must be
      individually removed. Inhibitors are also cleared when the application
      exits.

      Applications should not expect that they will always be able to block the
      action. In most cases, users will be given the option to force the action
      to take place.

      The [reason] message should be short and to the point.

      If a window is given, the session manager may point the user to this
      window to find out more about why the action is inhibited.

      The cookie that is returned by this function should be used as an argument
      to [Gtk.Application.uninhibit] in order to remove the request. *)

  method list_action_descriptions : unit -> string array
  (** Lists the detailed action names which have associated accelerators.

      See [Gtk.Application.set_accels_for_action]. *)

  method remove_window : window_t -> unit
  (** Remove a window from the application.

      If the window belongs to the application then this call is equivalent to
      setting the [Gtk.Window:application] property of the window to [NULL].

      The application may stop running as a result of a call to this function,
      if the window was the last window of the application. *)

  method set_accels_for_action : string -> string array -> unit
  (** Sets zero or more keyboard accelerators that will trigger the given
      action.

      The first item in [accels] will be the primary accelerator, which may be
      displayed in the UI.

      To remove all accelerators for an action, use an empty, zero-terminated
      array for [accels].

      For the [detailed_action_name], see [Gio.Action.parse_detailed_name] and
      \[Gio.Action.print_detailed_name\]. *)

  method set_menubar : Ocgio.Menu_model.menu_model_t option -> unit
  (** Sets or unsets the menubar for windows of the application.

      This is a menubar in the traditional sense.

      This can only be done in the primary instance of the application, after it
      has been registered. [GIO.Application.startup] is a good place to call
      this.

      Depending on the desktop environment, this may appear at the top of each
      window, or at the top of the screen. In some environments, if both the
      application menu and the menubar are set, the application menu will be
      presented as if it were the first item of the menubar. Other environments
      treat the two as completely separate — for example, the application menu
      may be rendered by the desktop shell while the menubar (if set) remains in
      each individual window.

      Use the base [GActionMap] interface to add actions, to respond to the user
      selecting these menu items. *)

  method uninhibit : int -> unit
  (** Removes an inhibitor that has been previously established.

      See [Gtk.Application.inhibit].

      Inhibitors are also cleared when the application exits. *)

  method register_session : bool
  (** Set this property to true to register with the session manager.

      This will make GTK track the session state (such as the
      [Gtk.Application:screensaver-active] property). *)

  method set_register_session : bool -> unit
  (** Set this property to true to register with the session manager.

      This will make GTK track the session state (such as the
      [Gtk.Application:screensaver-active] property). *)

  method screensaver_active : bool
  (** This property is true if GTK believes that the screensaver is currently
      active.

      Tracking the screensaver state is currently only supported on Linux. *)
end

and window_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Native.native_t

  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .root_t

  inherit Shortcut_manager.shortcut_manager_t

  method on_activate_default :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user activates the default widget.

      This is a keybinding signal.

      The keybindings for this signal are all forms of the <kbd>Enter</kbd> key.
  *)

  method on_activate_focus :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user activates the currently focused widget of [window].

      This is a keybinding signal.

      The default binding for this signal is <kbd>␣</kbd>. *)

  method on_close_request :
    ?after:bool -> callback:(unit -> bool) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the user clicks on the close button of the window. *)

  method on_enable_debugging :
    ?after:bool ->
    callback:(toggle:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the user enables or disables interactive debugging.

      When [toggle] is true, interactive debugging is toggled on or off, when it
      is false, the debugger will be pointed at the widget under the pointer.

      This is a keybinding signal.

      The default bindings for this signal are
      <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>I</kbd> and
      <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>D</kbd>. *)

  method on_keys_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the set of accelerators or mnemonics that are associated with
      the window changes. *)

  method close : unit -> unit
  (** Requests that the window is closed.

      This is similar to what happens when a window manager close button is
      clicked.

      This function can be used with close buttons in custom titlebars. *)

  method destroy : unit -> unit
  (** Drops the internal reference GTK holds on toplevel windows. *)

  method fullscreen : unit -> unit
  (** Asks to place the window in the fullscreen state.

      Note that you shouldn’t assume the window is definitely fullscreen
      afterward, because other entities (e.g. the user or window manager)
      unfullscreen it again, and not all window managers honor requests to
      fullscreen windows.

      If a window is not explicitly fullscreened or unfullscreened before it is
      shown, the initial state is at the window managers discretion.

      You can track the result of this operation via the [Gdk.Toplevel:state]
      property, or by listening to notifications of the
      [Gtk.Window:fullscreened] property. *)

  method fullscreen_on_monitor : Ocgdk.Monitor.monitor_t -> unit
  (** Asks to place the window in the fullscreen state on the given monitor.

      Note that you shouldn't assume the window is definitely fullscreen
      afterward, or that the windowing system allows fullscreen windows on any
      given monitor.

      You can track the result of this operation via the [Gdk.Toplevel:state]
      property, or by listening to notifications of the
      [Gtk.Window:fullscreened] property. *)

  method get_application : unit -> application_t option
  (** Gets the application object associated with the window. *)

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Gets the child widget of the window. *)

  method get_decorated : unit -> bool
  (** Returns whether the window has been set to have decorations. *)

  method get_default_widget :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Returns the default widget for [window]. *)

  method get_deletable : unit -> bool
  (** Returns whether the window has been set to have a close button. *)

  method get_destroy_with_parent : unit -> bool
  (** Returns whether the window will be destroyed with its transient parent. *)

  method get_focus_visible : unit -> bool
  (** Gets whether “focus rectangles” are supposed to be visible. *)

  method get_gravity : unit -> Enums.windowgravity
  (** Returns the gravity that is used when changing the window size
      programmatically. *)

  method get_group : unit -> window_group_t
  (** Returns the group for the window.

      If the window has no group, then the default group is returned. *)

  method get_handle_menubar_accel : unit -> bool
  (** Returns whether this window reacts to <kbd>F10</kbd> presses by activating
      a menubar it contains. *)

  method get_hide_on_close : unit -> bool
  (** Returns whether the window will be hidden instead of destroyed when the
      close button is clicked. *)

  method get_icon_name : unit -> string option
  (** Returns the name of the themed icon for the window. *)

  method get_mnemonics_visible : unit -> bool
  (** Gets whether mnemonics are supposed to be visible. *)

  method get_modal : unit -> bool
  (** Returns whether the window is modal. *)

  method get_resizable : unit -> bool
  (** Gets whether the user can resize the window. *)

  method get_title : unit -> string option
  (** Retrieves the title of the window. *)

  method get_titlebar :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option
  (** Returns the titlebar that has been set with [Gtk.Window.set_titlebar]. *)

  method get_transient_for : unit -> window_t option
  (** Fetches the transient parent for this window. *)

  method has_group : unit -> bool
  (** Returns whether the window has an explicit window group. *)

  method is_active : unit -> bool
  (** Returns whether the window is part of the current active toplevel.

      The active toplevel is the window receiving keystrokes.

      The return value is [TRUE] if the window is active toplevel itself. You
      might use this function if you wanted to draw a widget differently in an
      active window from a widget in an inactive window. *)

  method is_fullscreen : unit -> bool
  (** Retrieves the current fullscreen state of the window.

      Note that since fullscreening is ultimately handled by the window manager
      and happens asynchronously to an application request, you shouldn’t assume
      the return value of this function changing immediately (or at all), as an
      effect of calling [Gtk.Window.fullscreen] or [Gtk.Window.unfullscreen].

      If the window isn't yet mapped, the value returned will whether the
      initial requested state is fullscreen. *)

  method is_maximized : unit -> bool
  (** Retrieves the current maximized state of the window.

      Note that since maximization is ultimately handled by the window manager
      and happens asynchronously to an application request, you shouldn’t assume
      the return value of this function changing immediately (or at all), as an
      effect of calling [Gtk.Window.maximize] or [Gtk.Window.unmaximize].

      If the window isn't yet mapped, the value returned will whether the
      initial requested state is maximized. *)

  method is_suspended : unit -> bool
  (** Retrieves the current suspended state of the window.

      A window being suspended means it's currently not visible to the user, for
      example by being on a inactive workspace, minimized, obstructed. *)

  method maximize : unit -> unit
  (** Asks to maximize the window, so that it fills the screen.

      Note that you shouldn’t assume the window is definitely maximized
      afterward, because other entities (e.g. the user or window manager) could
      unmaximize it again, and not all window managers support maximization.

      It’s permitted to call this function before showing a window, in which
      case the window will be maximized when it appears onscreen initially.

      If a window is not explicitly maximized or unmaximized before it is shown,
      the initial state is at the window managers discretion. For example, it
      might decide to maximize a window that almost fills the screen.

      You can track the result of this operation via the [Gdk.Toplevel:state]
      property, or by listening to notifications on the [Gtk.Window:maximized]
      property. *)

  method minimize : unit -> unit
  (** Asks to minimize the window.

      Note that you shouldn’t assume the window is definitely minimized
      afterward, because the windowing system might not support this
      functionality; other entities (e.g. the user or the window manager) could
      unminimize it again, or there may not be a window manager in which case
      minimization isn’t possible, etc.

      It’s permitted to call this function before showing a window, in which
      case the window will be minimized before it ever appears onscreen.

      You can track result of this operation via the [Gdk.Toplevel:state]
      property. *)

  method present : unit -> unit
  (** Presents a window to the user.

      This may mean raising the window in the stacking order, unminimizing it,
      moving it to the current desktop and/or giving it the keyboard focus
      (possibly dependent on the user’s platform, window manager and
      preferences).

      If [window] is hidden, this function also makes it visible. *)

  method present_with_time : UInt32.t -> unit
  (** Presents a window to the user in response to an user interaction.

      See [Gtk.Window.present] for more details.

      The timestamp should be gathered when the window was requested to be shown
      (when clicking a link for example), rather than once the window is ready
      to be shown. *)

  method set_application : application_t option -> unit
  (** Sets or unsets the application object associated with the window.

      The application will be kept alive for at least as long as it has any
      windows associated with it (see [Gio.Application.hold] for a way to keep
      it alive without windows).

      Normally, the connection between the application and the window will
      remain until the window is destroyed, but you can explicitly remove it by
      setting the [application] to [NULL].

      This is equivalent to calling [Gtk.Application.remove_window] and/or
      [Gtk.Application.add_window] on the old/new applications as relevant. *)

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the child widget of the window. *)

  method set_decorated : bool -> unit
  (** Sets whether the window should be decorated.

      By default, windows are decorated with a title bar, resize controls, etc.
      Some window managers allow GTK to disable these decorations, creating a
      borderless window. If you set the decorated property to false using this
      function, GTK will do its best to convince the window manager not to
      decorate the window. Depending on the system, this function may not have
      any effect when called on a window that is already visible, so you should
      call it before calling [Gtk.Widget.show].

      On Windows, this function always works, since there’s no window manager
      policy involved. *)

  method set_default_size : int -> int -> unit
  [@@ocaml.doc
    "Sets the default size of a window.\n\n\
     The default size of a window is the size that will be used\n\
     if no other constraints apply.\n\n\
     The default size will be updated whenever the window is resized\n\
     to reflect the new size, unless the window is forced to a size,\n\
     like when it is maximized or fullscreened.\n\n\
     If the window’s minimum size request is larger than\n\
     the default, the default will be ignored.\n\n\
     Setting the default size to a value <= 0 will cause it to be\n\
     ignored and the natural size request will be used instead. It\n\
     is possible to do this while the window is showing to \"reset\"\n\
     it to its initial size.\n\n\
     Unlike [Gtk.Widget.set_size_request], which sets a size\n\
     request for a widget and thus would keep users from shrinking\n\
     the window, this function only sets the initial size, just as\n\
     if the user had resized the window themselves. Users can still\n\
     shrink the window again as they normally would. Setting a default\n\
     size of -1 means to use the “natural” default size (the size request\n\
     of the window).\n\n\
     If you use this function to reestablish a previously saved window size,\n\
     note that the appropriate size to save is the one returned by\n\
     [Gtk.Window.get_default_size]. Using the window allocation\n\
     directly will not work in all circumstances and can lead to growing\n\
     or shrinking windows."]

  method set_default_widget :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets the default widget.

      The default widget is the widget that is activated when the user presses
      <kbd>Enter</kbd> in a dialog (for example). *)

  method set_deletable : bool -> unit
  (** Sets whether the window should be deletable.

      By default, windows have a close button in the window frame. Some window
      managers allow GTK to disable this button. If you set the deletable
      property to false using this function, GTK will do its best to convince
      the window manager not to show a close button. Depending on the system,
      this function may not have any effect when called on a window that is
      already visible, so you should call it before calling [Gtk.Widget.show].

      On Windows, this function always works, since there’s no window manager
      policy involved. *)

  method set_destroy_with_parent : bool -> unit
  (** Sets whether to destroy the window when the transient parent is destroyed.

      This is useful for dialogs that shouldn’t persist beyond the lifetime of
      the main window they are associated with, for example. *)

  method set_display : Ocgdk.Display.display_t -> unit
  (** Sets the display where the window is displayed.

      If the window is already mapped, it will be unmapped, and then remapped on
      the new display. *)

  method set_focus_visible : bool -> unit
  (** Sets whether “focus rectangles” are supposed to be visible.

      This property is maintained by GTK based on user input, and should not be
      set by applications. *)

  method set_gravity : Enums.windowgravity -> unit
  (** Sets the gravity that is used when changing the window size
      programmatically. *)

  method set_handle_menubar_accel : bool -> unit
  (** Sets whether this window should react to <kbd>F10</kbd> presses by
      activating a menubar it contains. *)

  method set_hide_on_close : bool -> unit
  (** Sets whether clicking the close button will hide the window instead of
      destroying it. *)

  method set_icon_name : string option -> unit
  (** Sets the icon for the window from a named themed icon.

      See the docs for [Gtk.IconTheme] for more details. On some platforms, the
      window icon is not used at all.

      Note that this has nothing to do with the WM_ICON_NAME property which is
      mentioned in the ICCCM. *)

  method set_mnemonics_visible : bool -> unit
  (** Sets whether mnemonics are supposed to be visible.

      This property is maintained by GTK based on user input, and should not be
      set by applications. *)

  method set_modal : bool -> unit
  (** Sets a window modal or non-modal.

      Modal windows prevent interaction with other windows in the same
      application. To keep modal dialogs on top of main application windows, use
      [Gtk.Window.set_transient_for] to make the dialog transient for the
      parent; most window managers will then disallow lowering the dialog below
      the parent. *)

  method set_resizable : bool -> unit
  (** Sets whether the user can resize a window.

      Windows are user resizable by default. *)

  method set_startup_id : string -> unit
  (** Sets the startup notification ID.

      Startup notification identifiers are used by desktop environment to track
      application startup, to provide user feedback and other features. This
      function changes the corresponding property on the underlying
      [GdkSurface].

      Normally, startup identifier is managed automatically and you should only
      use this function in special cases like transferring focus from other
      processes. You should use this function before calling
      [Gtk.Window.present] or any equivalent function generating a window map
      event.

      This function is only useful on Wayland or X11, not with other GDK
      backends. *)

  method set_title : string option -> unit
  (** Sets the title of the window.

      The title of a window will be displayed in its title bar; on the X Window
      System, the title bar is rendered by the window manager so exactly how the
      title appears to users may vary according to a user’s exact configuration.
      The title should help a user distinguish this window from other windows
      they may have open. A good title might include the application name and
      current document filename, for example.

      Passing [NULL] does the same as setting the title to an empty string. *)

  method set_titlebar :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit
  (** Sets a custom titlebar for the window.

      A typical widget used here is [Gtk.HeaderBar], as it provides various
      features expected of a titlebar while allowing the addition of child
      widgets to it.

      If you set a custom titlebar, GTK will do its best to convince the window
      manager not to put its own titlebar on the window. Depending on the
      system, this function may not work for a window that is already visible,
      so you set the titlebar before calling [Gtk.Widget.show]. *)

  method set_transient_for : window_t option -> unit
  (** Sets a transient parent for the window.

      Dialog windows should be set transient for the main application window
      they were spawned from. This allows window managers to e.g. keep the
      dialog on top of the main window, or center the dialog over the main
      window. [Gtk.Dialog.new_with_buttons] and other convenience functions in
      GTK will sometimes call this function on your behalf.

      Passing [NULL] for [parent] unsets the current transient window.

      On Windows, this function puts the child window on top of the parent, much
      as the window manager would have done on X. *)

  method unfullscreen : unit -> unit
  (** Asks to remove the fullscreen state for the window, and return to its
      previous state.

      Note that you shouldn’t assume the window is definitely not fullscreen
      afterward, because other entities (e.g. the user or window manager) could
      fullscreen it again, and not all window managers honor requests to
      unfullscreen windows; normally the window will end up restored to its
      normal state. Just don’t write code that crashes if not.

      If a window is not explicitly fullscreened or unfullscreened before it is
      shown, the initial state is at the window managers discretion.

      You can track the result of this operation via the [Gdk.Toplevel:state]
      property, or by listening to notifications of the
      [Gtk.Window:fullscreened] property. *)

  method unmaximize : unit -> unit
  (** Asks to unmaximize the window.

      Note that you shouldn’t assume the window is definitely unmaximized
      afterward, because other entities (e.g. the user or window manager)
      maximize it again, and not all window managers honor requests to
      unmaximize.

      If a window is not explicitly maximized or unmaximized before it is shown,
      the initial state is at the window managers discretion. For example, it
      might decide to maximize a window that almost fills the screen.

      You can track the result of this operation via the [Gdk.Toplevel:state]
      property, or by listening to notifications on the [Gtk.Window:maximized]
      property. *)

  method unminimize : unit -> unit
  (** Asks to unminimize the window.

      Note that you shouldn’t assume the window is definitely unminimized
      afterward, because the windowing system might not support this
      functionality; other entities (e.g. the user or the window manager) could
      minimize it again, or there may not be a window manager in which case
      minimization isn’t possible, etc.

      You can track result of this operation via the [Gdk.Toplevel:state]
      property. *)

  method default_height : int
  (** The default height of the window. *)

  method set_default_height : int -> unit
  (** The default height of the window. *)

  method default_width : int
  (** The default width of the window. *)

  method set_default_width : int -> unit
  (** The default width of the window. *)

  method as_window : Raw.Window.t
end

and window_group_t = object
  method add_window : window_t -> unit
  (** Adds a window to a [GtkWindowGroup]. *)

  method list_windows : unit -> window_t list
  (** Returns a list of the [GtkWindows] that belong to [window_group]. *)

  method remove_window : window_t -> unit
  (** Removes a window from a [GtkWindowGroup]. *)

  method as_window_group : Raw.Window_group.t
end

class application (obj : Raw.Application.t) : application_t =
  object (self)
    inherit Ocgio.Application.application (obj :> Ocgio.Raw.Application.t)

    method on_query_end ?(after = false) ~callback () =
      Raw.Application.on_query_end ~after self#as_application ~callback

    method on_window_added ?(after = false) ~callback () =
      Raw.Application.on_window_added ~after self#as_application
        ~callback:(fun ~window -> callback ~window:(new window window))

    method on_window_removed ?(after = false) ~callback () =
      Raw.Application.on_window_removed ~after self#as_application
        ~callback:(fun ~window -> callback ~window:(new window window))

    method add_window : window_t -> unit =
      fun window ->
        let window = window#as_window in
        Raw.Application.add_window obj window

    method get_accels_for_action : string -> string array =
      fun detailed_action_name ->
        Raw.Application.get_accels_for_action obj detailed_action_name

    method get_actions_for_accel : string -> string array =
      fun accel -> Raw.Application.get_actions_for_accel obj accel

    method get_active_window : unit -> window_t option =
      fun () ->
        Option.map
          (fun ret -> new window ret)
          (Raw.Application.get_active_window obj)

    method get_menu_by_id : string -> Ocgio.Menu.menu_t option =
      fun id ->
        Option.map
          (fun ret -> new Ocgio.Menu.menu ret)
          (Raw.Application.get_menu_by_id obj id)

    method get_menubar : unit -> Ocgio.Menu_model.menu_model_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgio.Menu_model.menu_model ret)
          (Raw.Application.get_menubar obj)

    method get_window_by_id : int -> window_t option =
      fun id ->
        Option.map
          (fun ret -> new window ret)
          (Raw.Application.get_window_by_id obj id)

    method get_windows : unit -> window_t list =
      fun () ->
        (List.map (fun ret -> new window ret)) (Raw.Application.get_windows obj)

    method inhibit :
        window_t option -> Enums.applicationinhibitflags -> string option -> int
        =
      fun window flags reason ->
        let window = Option.map (fun c -> c#as_window) window in
        Raw.Application.inhibit obj window flags reason

    method list_action_descriptions : unit -> string array =
      fun () -> Raw.Application.list_action_descriptions obj

    method remove_window : window_t -> unit =
      fun window ->
        let window = window#as_window in
        Raw.Application.remove_window obj window

    method set_accels_for_action : string -> string array -> unit =
      fun detailed_action_name accels ->
        Raw.Application.set_accels_for_action obj detailed_action_name accels

    method set_menubar : Ocgio.Menu_model.menu_model_t option -> unit =
      fun menubar ->
        let menubar = Option.map (fun c -> c#as_menu_model) menubar in
        Raw.Application.set_menubar obj menubar

    method uninhibit : int -> unit =
      fun cookie -> Raw.Application.uninhibit obj cookie

    method register_session = Raw.Application.get_register_session obj
    method set_register_session v = Raw.Application.set_register_session obj v
    method screensaver_active = Raw.Application.get_screensaver_active obj
  end

and window (obj : Raw.Window.t) : window_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Native.native (Raw.Native.from_gobject obj)

    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .root
        (Raw.Root.from_gobject obj)

    inherit
      Shortcut_manager.shortcut_manager (Raw.Shortcut_manager.from_gobject obj)

    method on_activate_default ?(after = false) ~callback () =
      Raw.Window.on_activate_default ~after self#as_window ~callback

    method on_activate_focus ?(after = false) ~callback () =
      Raw.Window.on_activate_focus ~after self#as_window ~callback

    method on_close_request ?(after = false) ~callback () =
      Raw.Window.on_close_request ~after self#as_window ~callback

    method on_enable_debugging ?(after = false) ~callback () =
      Raw.Window.on_enable_debugging ~after self#as_window ~callback

    method on_keys_changed ?(after = false) ~callback () =
      Raw.Window.on_keys_changed ~after self#as_window ~callback

    method close : unit -> unit = fun () -> Raw.Window.close obj
    method destroy : unit -> unit = fun () -> Raw.Window.destroy obj
    method fullscreen : unit -> unit = fun () -> Raw.Window.fullscreen obj

    method fullscreen_on_monitor : Ocgdk.Monitor.monitor_t -> unit =
      fun monitor ->
        let monitor = monitor#as_monitor in
        Raw.Window.fullscreen_on_monitor obj monitor

    method get_application : unit -> application_t option =
      fun () ->
        Option.map
          (fun ret -> new application ret)
          (Raw.Window.get_application obj)

    method get_child :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Window.get_child obj)

    method get_decorated : unit -> bool = fun () -> Raw.Window.get_decorated obj

    method get_default_widget :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Window.get_default_widget obj)

    method get_deletable : unit -> bool = fun () -> Raw.Window.get_deletable obj

    method get_destroy_with_parent : unit -> bool =
      fun () -> Raw.Window.get_destroy_with_parent obj

    method get_focus_visible : unit -> bool =
      fun () -> Raw.Window.get_focus_visible obj

    method get_gravity : unit -> Enums.windowgravity =
      fun () -> Raw.Window.get_gravity obj

    method get_group : unit -> window_group_t =
      fun () -> new window_group (Raw.Window.get_group obj)

    method get_handle_menubar_accel : unit -> bool =
      fun () -> Raw.Window.get_handle_menubar_accel obj

    method get_hide_on_close : unit -> bool =
      fun () -> Raw.Window.get_hide_on_close obj

    method get_icon_name : unit -> string option =
      fun () -> Raw.Window.get_icon_name obj

    method get_mnemonics_visible : unit -> bool =
      fun () -> Raw.Window.get_mnemonics_visible obj

    method get_modal : unit -> bool = fun () -> Raw.Window.get_modal obj
    method get_resizable : unit -> bool = fun () -> Raw.Window.get_resizable obj

    method get_title : unit -> string option =
      fun () -> Raw.Window.get_title obj

    method get_titlebar :
        unit ->
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
              .widget
              ret)
          (Raw.Window.get_titlebar obj)

    method get_transient_for : unit -> window_t option =
      fun () ->
        Option.map
          (fun ret -> new window ret)
          (Raw.Window.get_transient_for obj)

    method has_group : unit -> bool = fun () -> Raw.Window.has_group obj
    method is_active : unit -> bool = fun () -> Raw.Window.is_active obj
    method is_fullscreen : unit -> bool = fun () -> Raw.Window.is_fullscreen obj
    method is_maximized : unit -> bool = fun () -> Raw.Window.is_maximized obj
    method is_suspended : unit -> bool = fun () -> Raw.Window.is_suspended obj
    method maximize : unit -> unit = fun () -> Raw.Window.maximize obj
    method minimize : unit -> unit = fun () -> Raw.Window.minimize obj
    method present : unit -> unit = fun () -> Raw.Window.present obj

    method present_with_time : UInt32.t -> unit =
      fun timestamp -> Raw.Window.present_with_time obj timestamp

    method set_application : application_t option -> unit =
      fun application ->
        let application = Option.map (fun c -> c#as_application) application in
        Raw.Window.set_application obj application

    method set_child :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun child ->
        let child = Option.map (fun c -> c#as_widget) child in
        Raw.Window.set_child obj child

    method set_decorated : bool -> unit =
      fun setting -> Raw.Window.set_decorated obj setting

    method set_default_size : int -> int -> unit =
      fun width height -> Raw.Window.set_default_size obj width height

    method set_default_widget :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun default_widget ->
        let default_widget = Option.map (fun c -> c#as_widget) default_widget in
        Raw.Window.set_default_widget obj default_widget

    method set_deletable : bool -> unit =
      fun setting -> Raw.Window.set_deletable obj setting

    method set_destroy_with_parent : bool -> unit =
      fun setting -> Raw.Window.set_destroy_with_parent obj setting

    method set_display : Ocgdk.Display.display_t -> unit =
      fun display ->
        let display = display#as_display in
        Raw.Window.set_display obj display

    method set_focus_visible : bool -> unit =
      fun setting -> Raw.Window.set_focus_visible obj setting

    method set_gravity : Enums.windowgravity -> unit =
      fun gravity -> Raw.Window.set_gravity obj gravity

    method set_handle_menubar_accel : bool -> unit =
      fun handle_menubar_accel ->
        Raw.Window.set_handle_menubar_accel obj handle_menubar_accel

    method set_hide_on_close : bool -> unit =
      fun setting -> Raw.Window.set_hide_on_close obj setting

    method set_icon_name : string option -> unit =
      fun name -> Raw.Window.set_icon_name obj name

    method set_mnemonics_visible : bool -> unit =
      fun setting -> Raw.Window.set_mnemonics_visible obj setting

    method set_modal : bool -> unit =
      fun modal -> Raw.Window.set_modal obj modal

    method set_resizable : bool -> unit =
      fun resizable -> Raw.Window.set_resizable obj resizable

    method set_startup_id : string -> unit =
      fun startup_id -> Raw.Window.set_startup_id obj startup_id

    method set_title : string option -> unit =
      fun title -> Raw.Window.set_title obj title

    method set_titlebar :
        Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
        .widget_t
        option ->
        unit =
      fun titlebar ->
        let titlebar = Option.map (fun c -> c#as_widget) titlebar in
        Raw.Window.set_titlebar obj titlebar

    method set_transient_for : window_t option -> unit =
      fun parent ->
        let parent = Option.map (fun c -> c#as_window) parent in
        Raw.Window.set_transient_for obj parent

    method unfullscreen : unit -> unit = fun () -> Raw.Window.unfullscreen obj
    method unmaximize : unit -> unit = fun () -> Raw.Window.unmaximize obj
    method unminimize : unit -> unit = fun () -> Raw.Window.unminimize obj
    method default_height = Raw.Window.get_default_height obj
    method set_default_height v = Raw.Window.set_default_height obj v
    method default_width = Raw.Window.get_default_width obj
    method set_default_width v = Raw.Window.set_default_width obj v
    method as_window = obj
  end

and window_group (obj : Raw.Window_group.t) : window_group_t =
  object (self)
    method add_window : window_t -> unit =
      fun window ->
        let window = window#as_window in
        Raw.Window_group.add_window obj window

    method list_windows : unit -> window_t list =
      fun () ->
        (List.map (fun ret -> new window ret))
          (Raw.Window_group.list_windows obj)

    method remove_window : window_t -> unit =
      fun window ->
        let window = window#as_window in
        Raw.Window_group.remove_window obj window

    method as_window_group = obj
  end

let new_ () : window_t = new window (Raw.Window.new_ ())

let new_ (application_id : string option) (flags : Ocgio.Enums.applicationflags)
    : application_t =
  let obj_ = Raw.Application.new_ application_id flags in
  new application obj_

let new_ () : window_group_t = new window_group (Raw.Window_group.new_ ())
