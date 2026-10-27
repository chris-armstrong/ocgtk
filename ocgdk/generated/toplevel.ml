class type toplevel_t = object
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

  method fullscreen_mode : Enums.fullscreenmode
  method set_fullscreen_mode : Enums.fullscreenmode -> unit
  method shortcuts_inhibited : bool
  method as_toplevel : Raw.Toplevel.t
end

(* High-level class for Toplevel *)
class toplevel (obj : Raw.Toplevel.t) : toplevel_t =
  object (self)
    method begin_move :
        App_launch_context_cycle_de440b34.device_t ->
        int ->
        float ->
        float ->
        UInt32.t ->
        unit =
      fun device button x y timestamp ->
        let device = device#as_device in
        Raw.Toplevel.begin_move obj device button x y timestamp

    method begin_resize :
        Enums.surfaceedge ->
        App_launch_context_cycle_de440b34.device_t option ->
        int ->
        float ->
        float ->
        UInt32.t ->
        unit =
      fun edge device button x y timestamp ->
        let device = Option.map (fun c -> c#as_device) device in
        Raw.Toplevel.begin_resize obj edge device button x y timestamp

    method focus : UInt32.t -> unit =
      fun timestamp -> Raw.Toplevel.focus obj timestamp

    method get_capabilities : unit -> Enums.toplevelcapabilities =
      fun () -> Raw.Toplevel.get_capabilities obj

    method get_gravity : unit -> Enums.gravity =
      fun () -> Raw.Toplevel.get_gravity obj

    method get_state : unit -> Enums.toplevelstate =
      fun () -> Raw.Toplevel.get_state obj

    method inhibit_system_shortcuts :
        App_launch_context_cycle_de440b34.event_t option -> unit =
      fun event ->
        let event = Option.map (fun c -> c#as_event) event in
        Raw.Toplevel.inhibit_system_shortcuts obj event

    method lower : unit -> bool = fun () -> Raw.Toplevel.lower obj
    method minimize : unit -> bool = fun () -> Raw.Toplevel.minimize obj

    method present : Raw.Toplevel_layout.t -> unit =
      fun layout -> Raw.Toplevel.present obj layout

    method restore_system_shortcuts : unit -> unit =
      fun () -> Raw.Toplevel.restore_system_shortcuts obj

    method set_decorated : bool -> unit =
      fun decorated -> Raw.Toplevel.set_decorated obj decorated

    method set_deletable : bool -> unit =
      fun deletable -> Raw.Toplevel.set_deletable obj deletable

    method set_gravity : Enums.gravity -> unit =
      fun gravity -> Raw.Toplevel.set_gravity obj gravity

    method set_icon_list : Texture.texture_t list -> unit =
      fun surfaces ->
        let surfaces = (List.map (fun c -> c#as_texture)) surfaces in
        Raw.Toplevel.set_icon_list obj surfaces

    method set_modal : bool -> unit =
      fun modal -> Raw.Toplevel.set_modal obj modal

    method set_startup_id : string -> unit =
      fun startup_id -> Raw.Toplevel.set_startup_id obj startup_id

    method set_title : string -> unit =
      fun title -> Raw.Toplevel.set_title obj title

    method set_transient_for :
        App_launch_context_cycle_de440b34.surface_t -> unit =
      fun parent ->
        let parent = parent#as_surface in
        Raw.Toplevel.set_transient_for obj parent

    method show_window_menu : App_launch_context_cycle_de440b34.event_t -> bool
        =
      fun event ->
        let event = event#as_event in
        Raw.Toplevel.show_window_menu obj event

    method supports_edge_constraints : unit -> bool =
      fun () -> Raw.Toplevel.supports_edge_constraints obj

    method titlebar_gesture : Enums.titlebargesture -> bool =
      fun gesture -> Raw.Toplevel.titlebar_gesture obj gesture

    method fullscreen_mode = Raw.Toplevel.get_fullscreen_mode obj
    method set_fullscreen_mode v = Raw.Toplevel.set_fullscreen_mode obj v
    method shortcuts_inhibited = Raw.Toplevel.get_shortcuts_inhibited obj
    method as_toplevel = obj
  end
