(** A freestanding toplevel surface.

    Its methods, signals and properties are on {!class-type-toplevel_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Toplevel}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [Toplevel].}

    Requires:
    - {{!Ocgdk.Surface.class-type-surface_t}Ocgdk.Surface}

    A freestanding toplevel surface.

    The [GdkToplevel] interface provides useful APIs for interacting with the
    windowing system, such as controlling maximization and size of the surface,
    setting icons and transient parents for dialogs. *)
class type toplevel_t = object
  (** {2:methods Methods} *)

  method begin_move :
    App_launch_context_cycle_de440b34.device_t ->
    int ->
    float ->
    float ->
    UInt32.t ->
    unit
  (** Begins an interactive move operation.

      You might use this function to implement draggable titlebars. *)

  method begin_resize :
    Enums.surfaceedge ->
    App_launch_context_cycle_de440b34.device_t option ->
    int ->
    float ->
    float ->
    UInt32.t ->
    unit
  (** Begins an interactive resize operation.

      You might use this function to implement a “window resize grip.” *)

  method focus : UInt32.t -> unit
  (** Sets keyboard focus to [surface].

      In most cases, gtk_window_present_with_time() should be used on a
      GtkWindow, rather than calling this function. *)

  method get_capabilities : unit -> Enums.toplevelcapabilities
  (** The capabilities that are available for this toplevel. *)

  method get_gravity : unit -> Enums.gravity
  (** Returns the gravity that is used when changing the toplevel size
      programmatically. *)

  method get_state : unit -> Enums.toplevelstate
  (** Gets the bitwise or of the currently active surface state flags, from the
      [GdkToplevelState] enumeration. *)

  method inhibit_system_shortcuts :
    App_launch_context_cycle_de440b34.event_t option -> unit
  (** Requests that the [toplevel] inhibit the system shortcuts.

      This is asking the desktop environment/windowing system to let all
      keyboard events reach the surface, as long as it is focused, instead of
      triggering system actions.

      If granted, the rerouting remains active until the default shortcuts
      processing is restored with [Gdk.Toplevel.restore_system_shortcuts], or
      the request is revoked by the desktop environment, windowing system or the
      user.

      A typical use case for this API is remote desktop or virtual machine
      viewers which need to inhibit the default system keyboard shortcuts so
      that the remote session or virtual host gets those instead of the local
      environment.

      The windowing system or desktop environment may ask the user to grant or
      deny the request or even choose to ignore the request entirely.

      The caller can be notified whenever the request is granted or revoked by
      listening to the [Gdk.Toplevel:shortcuts-inhibited] property. *)

  method lower : unit -> bool
  (** Asks to lower the [toplevel] below other windows.

      The windowing system may choose to ignore the request. *)

  method minimize : unit -> bool
  (** Asks to minimize the [toplevel].

      The windowing system may choose to ignore the request. *)

  method present : Raw.Toplevel_layout.t -> unit
  (** Present [toplevel] after having processed the [GdkToplevelLayout] rules.

      If the toplevel was previously not showing, it will be showed, otherwise
      it will change layout according to [layout].

      GDK may emit the [Gdk.Toplevel::compute-size] signal to let the user of
      this toplevel compute the preferred size of the toplevel surface.

      Presenting is asynchronous and the specified layout parameters are not
      guaranteed to be respected. *)

  method restore_system_shortcuts : unit -> unit
  (** Restore default system keyboard shortcuts which were previously inhibited.

      This undoes the effect of [Gdk.Toplevel.inhibit_system_shortcuts]. *)

  method set_decorated : bool -> unit
  (** Sets the toplevel to be decorated.

      Setting [decorated] to [FALSE] hints the desktop environment that the
      surface has its own, client-side decorations and does not need to have
      window decorations added. *)

  method set_deletable : bool -> unit
  (** Sets the toplevel to be deletable.

      Setting [deletable] to [TRUE] hints the desktop environment that it should
      offer the user a way to close the surface. *)

  method set_gravity : Enums.gravity -> unit
  (** Sets the gravity that is used when changing the toplevel size
      programmatically. *)

  method set_icon_list : Texture.texture_t list -> unit
  (** Sets a list of icons for the surface.

      One of these will be used to represent the surface in iconic form. The
      icon may be shown in window lists or task bars. Which icon size is shown
      depends on the window manager. The window manager can scale the icon but
      setting several size icons can give better image quality.

      Note that some platforms don't support surface icons. *)

  method set_modal : bool -> unit
  (** Sets the toplevel to be modal.

      The application can use this hint to tell the window manager that a
      certain surface has modal behaviour. The window manager can use this
      information to handle modal surfaces in a special way.

      You should only use this on surfaces for which you have previously called
      [Gdk.Toplevel.set_transient_for]. *)

  method set_startup_id : string -> unit
  (** Sets the startup notification ID.

      When using GTK, typically you should use gtk_window_set_startup_id()
      instead of this low-level function. *)

  method set_title : string -> unit
  (** Sets the title of a toplevel surface.

      The title maybe be displayed in the titlebar, in lists of windows, etc. *)

  method set_transient_for : App_launch_context_cycle_de440b34.surface_t -> unit
  (** Sets a transient-for parent.

      Indicates to the window manager that [surface] is a transient dialog
      associated with the application surface [parent]. This allows the window
      manager to do things like center [surface] on [parent] and keep [surface]
      above [parent].

      See gtk_window_set_transient_for() if you’re using GtkWindow. *)

  method show_window_menu : App_launch_context_cycle_de440b34.event_t -> bool
  (** Asks the windowing system to show the window menu.

      The window menu is the menu shown when right-clicking the titlebar on
      traditional windows managed by the window manager. This is useful for
      windows using client-side decorations, activating it with a right-click on
      the window decorations. *)

  method supports_edge_constraints : unit -> bool
  (** Returns whether the desktop environment supports tiled window states. *)

  method titlebar_gesture : Enums.titlebargesture -> bool
  (** Performs a title bar gesture. *)

  (** {2:properties Properties} *)

  method fullscreen_mode : Enums.fullscreenmode
  (** The fullscreen mode of the surface. *)

  method set_fullscreen_mode : Enums.fullscreenmode -> unit
  (** The fullscreen mode of the surface. *)

  method shortcuts_inhibited : bool
  (** Whether the surface should inhibit keyboard shortcuts. *)

  (** {2:conversions Conversions} *)

  method as_toplevel : Raw.Toplevel.t
end

class toplevel : Raw.Toplevel.t -> toplevel_t
(** Wraps a raw handle of {!Ocgdk.Raw.Toplevel.t}. *)

(** {1:description Description}

    A freestanding toplevel surface.

    The [GdkToplevel] interface provides useful APIs for interacting with the
    windowing system, such as controlling maximization and size of the surface,
    setting icons and transient parents for dialogs. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
