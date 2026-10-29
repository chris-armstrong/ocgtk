(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

(** The layer 1 modules of {!Ocgdk.Raw.App_launch_context},
    {!Ocgdk.Raw.Cairo_context}, {!Ocgdk.Raw.Clipboard}, {!Ocgdk.Raw.Device},
    {!Ocgdk.Raw.Display}, {!Ocgdk.Raw.Draw_context}, {!Ocgdk.Raw.Event},
    {!Ocgdk.Raw.Gl_context}, {!Ocgdk.Raw.Monitor}, {!Ocgdk.Raw.Seat},
    {!Ocgdk.Raw.Surface}, {!Ocgdk.Raw.Vulkan_context}, defined together because
    they refer to each other. Each has a module of its own that re-exports it;
    use that module rather than this one. *)

module rec App_launch_context : sig
  type t = [ `app_launch_context | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gdk_app_launch_context_get_type"

  (* Methods *)

  external set_timestamp : t -> UInt32.t -> unit
    = "ml_gdk_app_launch_context_set_timestamp"
  (** Sets the timestamp of [context].

      The timestamp should ideally be taken from the event that triggered the
      launch.

      Window managers can use this information to avoid moving the focus to the
      newly launched application when the user is busy typing in another window.
      This is also known as 'focus stealing prevention'. *)

  external set_icon_name : t -> string option -> unit
    = "ml_gdk_app_launch_context_set_icon_name"
  (** Sets the icon for applications that are launched with this context.

      The [icon_name] will be interpreted in the same way as the Icon field in
      desktop files. See also
      {{!Ocgdk.Raw.App_launch_context.val-set_icon}[Gdk.AppLaunchContext.set_icon]}.

      If both [icon] and [icon_name] are set, the [icon_name] takes priority. If
      neither [icon] or [icon_name] is set, the icon is taken from either the
      file that is passed to launched application or from the [GAppInfo] for the
      launched application itself. *)

  external set_icon : t -> Ocgio_raw.Icon.t option -> unit
    = "ml_gdk_app_launch_context_set_icon"
  (** Sets the icon for applications that are launched with this context.

      Window Managers can use this information when displaying startup
      notification.

      See also
      {{!Ocgdk.Raw.App_launch_context.val-set_icon_name}[Gdk.AppLaunchContext.set_icon_name]}.
  *)

  external set_desktop : t -> int -> unit
    = "ml_gdk_app_launch_context_set_desktop"
  (** Sets the workspace on which applications will be launched.

      This only works when running under a window manager that supports multiple
      workspaces, as described in the Extended Window Manager Hints.
      Specifically this sets the [_NET_WM_DESKTOP] property described in that
      spec.

      This only works when using the X11 backend.

      When the workspace is not specified or [desktop] is set to -1, it is up to
      the window manager to pick one, typically it will be the current
      workspace. *)

  (* Properties *)

  external get_display : t -> Display.t
    = "ml_gdk_app_launch_context_get_display"
  (** The display that the [GdkAppLaunchContext] is on. *)
end
[@@ocaml.doc
  "Handles launching an application in a graphical context.\n\n\
   It is an implementation of [GAppLaunchContext] that provides startup\n\
   notification and allows to launch applications on a specific workspace.\n\n\
   {b Launching an application}\n\n\
   {[\n\
   GdkAppLaunchContext *context;\n\n\
   context = gdk_display_get_app_launch_context (display);\n\n\
   gdk_app_launch_context_set_timestamp (gdk_event_get_time (event));\n\n\
   if (!g_app_info_launch_default_for_uri (\"http://www.gtk.org\", context, \
   &error))\n\
  \  g_warning (\"Launching failed: %s\\n\", error->message);\n\n\
   g_object_unref (context);\n\
   ]}\n\n\
   The class built on this module is in {!Ocgdk.App_launch_context}."]

(** Represents the platform-specific draw context.

    [GdkCairoContext]s are created for a surface using
    {{!Ocgdk.Raw.Surface.val-create_cairo_context}[Gdk.Surface.create_cairo_context]},
    and the context can then be used to draw on that surface.

    The class built on this module is in {!Ocgdk.Cairo_context}. *)
and Cairo_context : sig
  type t = [ `cairo_context | `draw_context | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gdk_cairo_context_get_type"

  (* Methods *)

  external cairo_create : t -> Occairo_raw.Context.t option
    = "ml_gdk_cairo_context_cairo_create"
  (** Retrieves a Cairo context to be used to draw on the [GdkSurface] of
      [context].

      A call to
      {{!Ocgdk.Raw.Draw_context.val-begin_frame}[Gdk.DrawContext.begin_frame]}
      with this [context] must have been done or this function will return
      [None].

      The returned context is guaranteed to be valid until
      {{!Ocgdk.Raw.Draw_context.val-end_frame}[Gdk.DrawContext.end_frame]} is
      called. *)
end

(** Represents data shared between applications or inside an application.

    To get a [GdkClipboard] object, use
    {{!Ocgdk.Raw.Display.val-get_clipboard}[Gdk.Display.get_clipboard]} or
    {{!Ocgdk.Raw.Display.val-get_primary_clipboard}[Gdk.Display.get_primary_clipboard]}.
    You can find out about the data that is currently available in a clipboard
    using {{!Ocgdk.Raw.Clipboard.val-get_formats}[Gdk.Clipboard.get_formats]}.

    To make text or image data available in a clipboard, use
    [Gdk.Clipboard.set_text] or [Gdk.Clipboard.set_texture]. For other data, you
    can use {{!Ocgdk.Raw.Clipboard.val-set_content}[Gdk.Clipboard.set_content]},
    which takes a {{!Ocgdk.Raw.Content_provider}[Gdk.ContentProvider]} object.

    To read textual or image data from a clipboard, use
    [Gdk.Clipboard.read_text_async] or [Gdk.Clipboard.read_texture_async]. For
    other data, use [Gdk.Clipboard.read_async], which provides a [GInputStream]
    object.

    The class built on this module is in {!Ocgdk.Clipboard}. *)
and Clipboard : sig
  type t = [ `clipboard | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gdk_clipboard_get_type"

  (* Methods *)

  external store_finish :
    t -> Ocgio_raw.Async_result.t -> (bool, GError.t) result
    = "ml_gdk_clipboard_store_finish"
  (** Finishes an asynchronous clipboard store.

      See [Gdk.Clipboard.store_async]. *)

  external set_value : t -> Gobject.Value.t -> unit
    = "ml_gdk_clipboard_set_value"
  (** Sets the [clipboard] to contain the given [value]. *)

  external set_content : t -> Content_provider.t option -> bool
    = "ml_gdk_clipboard_set_content"
  (** Sets a new content provider on [clipboard].

      The clipboard will claim the [GdkDisplay]'s resources and advertise these
      new contents to other applications.

      In the rare case of a failure, this function will return [false]. The
      clipboard will then continue reporting its old contents and ignore
      [provider].

      If the contents are read by either an external application or the
      [clipboard]'s read functions, [clipboard] will select the best format to
      transfer the contents and then request that format from [provider]. *)

  external read_value_finish :
    t -> Ocgio_raw.Async_result.t -> (Gobject.Value.t, GError.t) result
    = "ml_gdk_clipboard_read_value_finish"
  (** Finishes an asynchronous clipboard read.

      See [Gdk.Clipboard.read_value_async]. *)

  external read_texture_finish :
    t -> Ocgio_raw.Async_result.t -> (Texture.t option, GError.t) result
    = "ml_gdk_clipboard_read_texture_finish"
  (** Finishes an asynchronous clipboard read.

      See [Gdk.Clipboard.read_texture_async]. *)

  external read_text_finish :
    t -> Ocgio_raw.Async_result.t -> (string option, GError.t) result
    = "ml_gdk_clipboard_read_text_finish"
  (** Finishes an asynchronous clipboard read.

      See [Gdk.Clipboard.read_text_async]. *)

  external is_local : t -> bool = "ml_gdk_clipboard_is_local"
  (** Returns if the clipboard is local.

      A clipboard is considered local if it was last claimed by the running
      application.

      Note that
      {{!Ocgdk.Raw.Clipboard.val-get_content}[Gdk.Clipboard.get_content]} may
      return [None] even on a local clipboard. In this case the clipboard is
      empty. *)

  external get_formats : t -> Content_formats.t = "ml_gdk_clipboard_get_formats"
  (** Gets the formats that the clipboard can provide its current contents in.
  *)

  external get_display : t -> Display.t = "ml_gdk_clipboard_get_display"
  (** Gets the [GdkDisplay] that the clipboard was created for. *)

  external get_content : t -> Content_provider.t option
    = "ml_gdk_clipboard_get_content"
  (** Returns the [GdkContentProvider] currently set on [clipboard].

      If the [clipboard] is empty or its contents are not owned by the current
      process, [None] will be returned. *)

  (* Properties *)

  val on_changed :
    ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
  (** Emitted when the clipboard changes ownership. *)
end

(** Represents an input device, such as a keyboard, mouse or touchpad.

    See the {{!Ocgdk.Raw.Seat}[Gdk.Seat]} documentation for more information
    about the various kinds of devices, and their relationships.

    The class built on this module is in {!Ocgdk.Device}. *)
and Device : sig
  type t = [ `device | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gdk_device_get_type"

  (* Methods *)

  external has_bidi_layouts : t -> bool = "ml_gdk_device_has_bidi_layouts"
  (** Determines if layouts for both right-to-left and left-to-right languages
      are in use on the keyboard.

      This is only relevant for keyboard devices. *)

  external get_vendor_id : t -> string option = "ml_gdk_device_get_vendor_id"
  [@@ocaml.doc
    "Returns the vendor ID of this device.\n\n\
    \  This ID is retrieved from the device, and does not change.\n\n\
    \  This function, together with \
     {{!Ocgdk.Raw.Device.val-get_product_id}[Gdk.Device.get_product_id]},\n\
    \  can be used to eg. compose [GSettings] paths to store settings\n\
    \  for this device.\n\n\
    \  {[\n\
    \   static GSettings *\n\
    \   get_device_settings (GdkDevice *device)\n\
    \   {\n\
    \     const char *vendor, *product;\n\
    \     GSettings *settings;\n\
    \     GdkDevice *device;\n\
    \     char *path;\n\n\
    \     vendor = gdk_device_get_vendor_id (device);\n\
    \     product = gdk_device_get_product_id (device);\n\n\
    \     path = g_strdup_printf (\"/org/example/app/devices/%s:%s/\", vendor, \
     product);\n\
    \     settings = g_settings_new_with_path (DEVICE_SCHEMA, path);\n\
    \     g_free (path);\n\n\
    \     return settings;\n\
    \   }\n\
    \  ]}"]

  external get_timestamp : t -> UInt32.t = "ml_gdk_device_get_timestamp"
  (** Returns the timestamp of the last activity for this device.

      In practice, this means the timestamp of the last event that was received
      from the OS for this device. (GTK may occasionally produce events for a
      device that are not received from the OS, and will not update the
      timestamp). *)

  external get_surface_at_position : t -> Surface.t option * float * float
    = "ml_gdk_device_get_surface_at_position"
  (** Obtains the surface underneath [device], returning the location of the
      device in [win_x] and [win_y].

      Returns [None] if the surface tree under [device] is not known to GDK (for
      example, belongs to another application). *)

  external get_source : t -> Ocgdk_enums.inputsource
    = "ml_gdk_device_get_source"
  (** Determines the type of the device. *)

  external get_seat : t -> Seat.t = "ml_gdk_device_get_seat"
  (** Returns the [GdkSeat] the device belongs to. *)

  external get_scroll_lock_state : t -> bool
    = "ml_gdk_device_get_scroll_lock_state"
  (** Retrieves whether the Scroll Lock modifier of the keyboard is locked.

      This is only relevant for keyboard devices. *)

  external get_product_id : t -> string option = "ml_gdk_device_get_product_id"
  (** Returns the product ID of this device.

      This ID is retrieved from the device, and does not change. See
      {{!Ocgdk.Raw.Device.val-get_vendor_id}[Gdk.Device.get_vendor_id]} for more
      information. *)

  external get_num_touches : t -> int = "ml_gdk_device_get_num_touches"
  (** Retrieves the number of touch points associated to [device]. *)

  external get_num_lock_state : t -> bool = "ml_gdk_device_get_num_lock_state"
  (** Retrieves whether the Num Lock modifier of the keyboard is locked.

      This is only relevant for keyboard devices. *)

  external get_name : t -> string = "ml_gdk_device_get_name"
  (** The name of the device, suitable for showing in a user interface. *)

  external get_modifier_state : t -> Ocgdk_enums.modifiertype
    = "ml_gdk_device_get_modifier_state"
  (** Retrieves the current modifier state of the keyboard.

      This is only relevant for keyboard devices. *)

  external get_layout_names : t -> string array option
    = "ml_gdk_device_get_layout_names"
  (** Retrieves the names of the layouts of the keyboard.

      This is only relevant for keyboard devices. *)

  external get_has_cursor : t -> bool = "ml_gdk_device_get_has_cursor"
  (** Determines whether the pointer follows device motion.

      This is not meaningful for keyboard devices, which don't have a pointer.
  *)

  external get_display : t -> Display.t = "ml_gdk_device_get_display"
  (** Returns the [GdkDisplay] to which [device] pertains. *)

  external get_direction : t -> Ocpango_enums.direction
    = "ml_gdk_device_get_direction"
  (** Returns the direction of effective layout of the keyboard.

      This is only relevant for keyboard devices.

      The direction of a layout is the direction of the majority of its symbols.
      See [Pango.unichar_direction]. *)

  external get_device_tool : t -> Device_tool.t option
    = "ml_gdk_device_get_device_tool"
  (** Retrieves the current tool for [device]. *)

  external get_caps_lock_state : t -> bool = "ml_gdk_device_get_caps_lock_state"
  (** Retrieves whether the Caps Lock modifier of the keyboard is locked.

      This is only relevant for keyboard devices. *)

  external get_active_layout_index : t -> int
    = "ml_gdk_device_get_active_layout_index"
  (** Retrieves the index of the active layout of the keyboard.

      If there is no valid active layout for the [GdkDevice], this function will
      return -1;

      This is only relevant for keyboard devices. *)

  (* Properties *)

  external get_n_axes : t -> int = "ml_gdk_device_get_n_axes"
  (** Number of axes in the device. *)

  val on_changed :
    ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
  (** Emitted either when the number of either axes or keys changes.

      On X11 this will normally happen when the physical device routing events
      through the logical device changes (for example, user switches from the
      USB mouse to a tablet); in that case the logical device will change to
      reflect the axes and keys on the new physical device. *)

  val on_tool_changed :
    ?after:bool ->
    t ->
    callback:(tool:Device_tool.t -> unit) ->
    Gobject.Signal.handler_id
  (** Emitted on pen/eraser devices whenever tools enter or leave proximity. *)
end

(** A representation of a workstation.

    Their purpose are two-fold:

    - To manage and provide information about input devices (pointers,
      keyboards, etc)
    - To manage and provide information about output devices (monitors,
      projectors, etc)

    Most of the input device handling has been factored out into separate
    {{!Ocgdk.Raw.Seat}[Gdk.Seat]} objects. Every display has a one or more
    seats, which can be accessed with
    {{!Ocgdk.Raw.Display.val-get_default_seat}[Gdk.Display.get_default_seat]}
    and {{!Ocgdk.Raw.Display.val-list_seats}[Gdk.Display.list_seats]}.

    Output devices are represented by {{!Ocgdk.Raw.Monitor}[Gdk.Monitor]}
    objects, which can be accessed with
    {{!Ocgdk.Raw.Display.val-get_monitor_at_surface}[Gdk.Display.get_monitor_at_surface]}
    and similar APIs.

    The class built on this module is in {!Ocgdk.Display}. *)
and Display : sig
  type t = [ `display | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gdk_display_get_type"

  (* Methods *)

  external translate_key :
    t ->
    int ->
    Ocgdk_enums.modifiertype ->
    int ->
    bool * int * int * int * Ocgdk_enums.modifiertype
    = "ml_gdk_display_translate_key"
  (** Translates the contents of a [GdkEventKey] into a keyval, effective group,
      and level.

      Modifiers that affected the translation and are thus unavailable for
      application use are returned in [consumed_modifiers].

      The [effective_group] is the group that was actually used for the
      translation; some keys such as Enter are not affected by the active
      keyboard group. The [level] is derived from [state].

      [consumed_modifiers] gives modifiers that should be masked out from
      [state] when comparing this key press to a keyboard shortcut. For
      instance, on a US keyboard, the [plus] symbol is shifted, so when
      comparing a key press to a [<Control>plus] accelerator [<Shift>] should be
      masked out.

      This function should rarely be needed, since [GdkEventKey] already
      contains the translated keyval. It is exported for the benefit of
      virtualized test environments. *)

  external sync : t -> unit = "ml_gdk_display_sync"
  (** Flushes any requests queued for the windowing system and waits until all
      requests have been handled.

      This is often used for making sure that the display is synchronized with
      the current state of the program. Calling
      {{!Ocgdk.Raw.Display.val-sync}[Gdk.Display.sync]} before
      [GdkX11.Display.error_trap_pop] makes sure that any errors generated from
      earlier requests are handled before the error trap is removed.

      This is most useful for X11. On windowing systems where requests are
      handled synchronously, this function will do nothing. *)

  external supports_shadow_width : t -> bool
    = "ml_gdk_display_supports_shadow_width"
  (** Returns whether it's possible for a surface to draw outside of the window
      area.

      If [true] is returned the application decides if it wants to draw shadows.
      If [false] is returned, the compositor decides if it wants to draw
      shadows. *)

  external supports_input_shapes : t -> bool
    = "ml_gdk_display_supports_input_shapes"
  (** Returns [true] if the display supports input shapes.

      This means that
      {{!Ocgdk.Raw.Surface.val-set_input_region}[Gdk.Surface.set_input_region]}
      can be used to modify the input shape of surfaces on [display].

      On modern displays, this value is always [true]. *)

  external put_event : t -> Event.t -> unit = "ml_gdk_display_put_event"
  (** Adds the given event to the event queue for [display]. *)

  external prepare_gl : t -> (bool, GError.t) result
    = "ml_gdk_display_prepare_gl"
  (** Checks that OpenGL is available for [self] and ensures that it is properly
      initialized. When this fails, an [error] will be set describing the error
      and this function returns [false].

      Note that even if this function succeeds, creating a [GdkGLContext] may
      still fail.

      This function is idempotent. Calling it multiple times will just return
      the same value or error.

      You never need to call this function, GDK will call it automatically as
      needed. But you can use it as a check when setting up code that might make
      use of OpenGL. *)

  external notify_startup_complete : t -> string -> unit
    = "ml_gdk_display_notify_startup_complete"
  (** Indicates to the GUI environment that the application has finished
      loading, using a given identifier.

      GTK will call this function automatically for GtkWindow with custom
      startup-notification identifier unless
      gtk_window_set_auto_startup_notification() is called to disable that
      feature. *)

  external map_keyval : t -> int -> bool * Keymap_key.t array * int
    = "ml_gdk_display_map_keyval"
  (** Obtains a list of keycode/group/level combinations that will generate
      [keyval].

      Groups and levels are two kinds of keyboard mode; in general, the level
      determines whether the top or bottom symbol on a key is used, and the
      group determines whether the left or right symbol is used.

      On US keyboards, the shift key changes the keyboard level, and there are
      no groups. A group switch key might convert a keyboard between Hebrew to
      English modes, for example.

      [GdkEventKey] contains a %group field that indicates the active keyboard
      group. The level is computed from the modifier mask. *)

  external map_keycode : t -> int -> bool * Keymap_key.t array * int array * int
    = "ml_gdk_display_map_keycode"
  (** Returns the keyvals bound to [keycode].

      The Nth [GdkKeymapKey] in [keys] is bound to the Nth keyval in [keyvals].

      When a keycode is pressed by the user, the keyval from this list of
      entries is selected by considering the effective keyboard group and level.
  *)

  external list_seats : t -> Seat.t list = "ml_gdk_display_list_seats"
  (** Returns the list of seats known to [display]. *)

  external is_rgba : t -> bool = "ml_gdk_display_is_rgba"
  (** Returns whether surfaces on this [display] are created with an alpha
      channel.

      Even if a [true] is returned, it is possible that the surface’s alpha
      channel won’t be honored when displaying the surface on the screen: in
      particular, for X an appropriate windowing manager and compositing manager
      must be running to provide appropriate display. Use
      {{!Ocgdk.Raw.Display.val-is_composited}[Gdk.Display.is_composited]} to
      check if that is the case.

      On modern displays, this value is always [true]. *)

  external is_composited : t -> bool = "ml_gdk_display_is_composited"
  (** Returns whether surfaces can reasonably be expected to have their alpha
      channel drawn correctly on the screen.

      Check {{!Ocgdk.Raw.Display.val-is_rgba}[Gdk.Display.is_rgba]} for whether
      the display supports an alpha channel.

      On X11 this function returns whether a compositing manager is compositing
      on [display].

      On modern displays, this value is always [true]. *)

  external is_closed : t -> bool = "ml_gdk_display_is_closed"
  (** Finds out if the display has been closed. *)

  external get_startup_notification_id : t -> string option
    = "ml_gdk_display_get_startup_notification_id"
  (** Gets the startup notification ID for a Wayland display, or [None] if no ID
      has been defined. *)

  external get_setting : t -> string -> Gobject.Value.t -> bool
    = "ml_gdk_display_get_setting"
  (** Retrieves a desktop-wide setting such as double-click time for the
      [display]. *)

  external get_primary_clipboard : t -> Clipboard.t
    = "ml_gdk_display_get_primary_clipboard"
  (** Gets the clipboard used for the primary selection.

      On backends where the primary clipboard is not supported natively, GDK
      emulates this clipboard locally. *)

  external get_name : t -> string = "ml_gdk_display_get_name"
  (** Gets the name of the display. *)

  external get_monitors : t -> Ocgio_raw.List_model.t
    = "ml_gdk_display_get_monitors"
  (** Gets the list of monitors associated with this display.

      Subsequent calls to this function will always return the same list for the
      same display.

      You can listen to the GListModel::items-changed signal on this list to
      monitor changes to the monitor of this display. *)

  external get_monitor_at_surface : t -> Surface.t -> Monitor.t option
    = "ml_gdk_display_get_monitor_at_surface"
  (** Gets the monitor in which the largest area of [surface] resides. *)

  external get_dmabuf_formats : t -> Dmabuf_formats.t
    = "ml_gdk_display_get_dmabuf_formats"
  (** Returns the dma-buf formats that are supported on this display.

      GTK may use OpenGL or Vulkan to support some formats. Calling this
      function will then initialize them if they aren't yet.

      The formats returned by this function can be used for negotiating buffer
      formats with producers such as v4l, pipewire or GStreamer.

      To learn more about dma-bufs, see
      {{!Ocgdk.Raw.Dmabuf_texture_builder}[Gdk.DmabufTextureBuilder]}.

      This function is threadsafe. It can be called from any thread. *)

  external get_default_seat : t -> Seat.t option
    = "ml_gdk_display_get_default_seat"
  (** Returns the default [GdkSeat] for this display.

      Note that a display may not have a seat. In this case, this function will
      return [None]. *)

  external get_clipboard : t -> Clipboard.t = "ml_gdk_display_get_clipboard"
  (** Gets the clipboard used for copy/paste operations. *)

  external get_app_launch_context : t -> App_launch_context.t
    = "ml_gdk_display_get_app_launch_context"
  (** Returns a [GdkAppLaunchContext] suitable for launching applications on the
      given display. *)

  external flush : t -> unit = "ml_gdk_display_flush"
  (** Flushes any requests queued for the windowing system.

      This happens automatically when the main loop blocks waiting for new
      events, but if your application is drawing without returning control to
      the main loop, you may need to call this function explicitly. A common
      case where this function needs to be called is when an application is
      executing drawing commands from a thread other than the thread where the
      main loop is running.

      This is most useful for X11. On windowing systems where requests are
      handled synchronously, this function will do nothing. *)

  external device_is_grabbed : t -> Device.t -> bool
    = "ml_gdk_display_device_is_grabbed"
  (** Returns [true] if there is an ongoing grab on [device] for [display]. *)

  external create_gl_context : t -> (Gl_context.t, GError.t) result
    = "ml_gdk_display_create_gl_context"
  (** Creates a new [GdkGLContext] for the [GdkDisplay].

      The context is disconnected from any particular surface or surface and
      cannot be used to draw to any surface. It can only be used to draw to
      non-surface framebuffers like textures.

      If the creation of the [GdkGLContext] failed, [error] will be set. Before
      using the returned [GdkGLContext], you will need to call
      {{!Ocgdk.Raw.Gl_context.val-make_current}[Gdk.GLContext.make_current]} or
      {{!Ocgdk.Raw.Gl_context.val-realize}[Gdk.GLContext.realize]}. *)

  external close : t -> unit = "ml_gdk_display_close"
  (** Closes the connection to the windowing system for the given display.

      This cleans up associated resources. *)

  external beep : t -> unit = "ml_gdk_display_beep"
  (** Emits a short beep on [display] *)

  (* Properties *)

  val on_closed :
    ?after:bool ->
    t ->
    callback:(is_error:bool -> unit) ->
    Gobject.Signal.handler_id
  (** Emitted when the connection to the windowing system for [display] is
      closed. *)

  val on_opened :
    ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
  (** Emitted when the connection to the windowing system for [display] is
      opened. *)

  val on_seat_added :
    ?after:bool ->
    t ->
    callback:(seat:Seat.t -> unit) ->
    Gobject.Signal.handler_id
  (** Emitted whenever a new seat is made known to the windowing system. *)

  val on_seat_removed :
    ?after:bool ->
    t ->
    callback:(seat:Seat.t -> unit) ->
    Gobject.Signal.handler_id
  (** Emitted whenever a seat is removed by the windowing system. *)

  val on_setting_changed :
    ?after:bool ->
    t ->
    callback:(setting:string -> unit) ->
    Gobject.Signal.handler_id
  (** Emitted whenever a setting changes its value. *)
end

(** Base class for objects implementing different rendering methods.

    [GdkDrawContext] is the base object used by contexts implementing different
    rendering methods, such as {{!Ocgdk.Raw.Cairo_context}[Gdk.CairoContext]} or
    {{!Ocgdk.Raw.Gl_context}[Gdk.GLContext]}. It provides shared functionality
    between those contexts.

    You will always interact with one of those subclasses.

    A [GdkDrawContext] is always associated with a single toplevel surface.

    The class built on this module is in {!Ocgdk.Draw_context}. *)
and Draw_context : sig
  type t = [ `draw_context | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gdk_draw_context_get_type"

  (* Methods *)

  external is_in_frame : t -> bool = "ml_gdk_draw_context_is_in_frame"
  (** Returns [true] if [context] is in the process of drawing to its surface.

      This is the case between calls to
      {{!Ocgdk.Raw.Draw_context.val-begin_frame}[Gdk.DrawContext.begin_frame]}
      and {{!Ocgdk.Raw.Draw_context.val-end_frame}[Gdk.DrawContext.end_frame]}.
      In this situation, drawing commands may be effecting the contents of the
      [context]'s surface. *)

  external get_surface : t -> Surface.t option
    = "ml_gdk_draw_context_get_surface"
  (** Retrieves the surface that [context] is bound to. *)

  external get_frame_region : t -> Occairo_raw.Region.t option
    = "ml_gdk_draw_context_get_frame_region"
  (** Retrieves the region that is currently being repainted.

      After a call to
      {{!Ocgdk.Raw.Draw_context.val-begin_frame}[Gdk.DrawContext.begin_frame]}
      this function will return a union of the region passed to that function
      and the area of the surface that the [context] determined needs to be
      repainted.

      If [context] is not in between calls to
      {{!Ocgdk.Raw.Draw_context.val-begin_frame}[Gdk.DrawContext.begin_frame]}
      and {{!Ocgdk.Raw.Draw_context.val-end_frame}[Gdk.DrawContext.end_frame]},
      [None] will be returned. *)

  external get_display : t -> Display.t option
    = "ml_gdk_draw_context_get_display"
  (** Retrieves the [GdkDisplay] the [context] is created for *)

  external end_frame : t -> unit = "ml_gdk_draw_context_end_frame"
  (** Ends a drawing operation started with gdk_draw_context_begin_frame().

      This makes the drawing available on screen. See
      {{!Ocgdk.Raw.Draw_context.val-begin_frame}[Gdk.DrawContext.begin_frame]}
      for more details about drawing.

      When using a {{!Ocgdk.Raw.Gl_context}[Gdk.GLContext]}, this function may
      call [glFlush()] implicitly before returning; it is not recommended to
      call [glFlush()] explicitly before calling this function. *)

  external begin_frame : t -> Occairo_raw.Region.t -> unit
    = "ml_gdk_draw_context_begin_frame"
  (** Indicates that you are beginning the process of redrawing [region] on the
      [context]'s surface.

      Calling this function begins a drawing operation using [context] on the
      surface that [context] was created from. The actual requirements and
      guarantees for the drawing operation vary for different implementations of
      drawing, so a {{!Ocgdk.Raw.Cairo_context}[Gdk.CairoContext]} and a
      {{!Ocgdk.Raw.Gl_context}[Gdk.GLContext]} need to be treated differently.

      A call to this function is a requirement for drawing and must be followed
      by a call to
      {{!Ocgdk.Raw.Draw_context.val-end_frame}[Gdk.DrawContext.end_frame]},
      which will complete the drawing operation and ensure the contents become
      visible on screen.

      Note that the [region] passed to this function is the minimum region that
      needs to be drawn and depending on implementation, windowing system and
      hardware in use, it might be necessary to draw a larger region. Drawing
      implementation must use
      {{!Ocgdk.Raw.Draw_context.val-get_frame_region}[Gdk.DrawContext.get_frame_region]}
      to query the region that must be drawn.

      When using GTK, the widget system automatically places calls to
      gdk_draw_context_begin_frame() and gdk_draw_context_end_frame() via the
      use of GskRenderers, so application code does not need to call these
      functions explicitly. *)

  (* Properties *)
end

(** Represents windowing system events.

    In GTK applications the events are handled automatically by toplevel widgets
    and passed on to the event controllers of appropriate widgets, so using
    [GdkEvent] and its related API is rarely needed.

    [GdkEvent] structs are immutable.

    The class built on this module is in {!Ocgdk.Event}. *)
and Event : sig
  type t = [ `event ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gdk_event_get_type"

  (* Methods *)

  external unref : t -> unit = "ml_gdk_event_unref"
  (** Decrease the ref count of [event].

      If the last reference is dropped, the structure is freed. *)

  external triggers_context_menu : t -> bool
    = "ml_gdk_event_triggers_context_menu"
  (** Returns whether a [GdkEvent] should trigger a context menu, according to
      platform conventions.

      The right mouse button typically triggers context menus. On macOS,
      Control+left mouse button also triggers.

      This function should always be used instead of simply checking for

      {[
      event->button == GDK_BUTTON_SECONDARY
      ]} *)

  external ref : t -> t = "ml_gdk_event_ref"
  (** Increase the ref count of [event]. *)

  external get_time : t -> UInt32.t = "ml_gdk_event_get_time"
  (** Returns the timestamp of [event].

      Not all events have timestamps. In that case, this function returns
      [GDK_CURRENT_TIME]. *)

  external get_surface : t -> Surface.t option = "ml_gdk_event_get_surface"
  (** Extracts the surface associated with an event. *)

  external get_seat : t -> Seat.t option = "ml_gdk_event_get_seat"
  (** Returns the seat that originated the event. *)

  external get_position : t -> bool * float * float
    = "ml_gdk_event_get_position"
  (** Extract the event surface relative x/y coordinates from an event.

      This position is in surface coordinates. *)

  external get_pointer_emulated : t -> bool
    = "ml_gdk_event_get_pointer_emulated"
  (** Returns whether this event is an 'emulated' pointer event.

      Emulated pointer events typically originate from a touch events. *)

  external get_modifier_state : t -> Ocgdk_enums.modifiertype
    = "ml_gdk_event_get_modifier_state"
  (** Returns the modifier state field of an event. *)

  external get_history : t -> Time_coord.t array option * int
    = "ml_gdk_event_get_history"
  (** Retrieves the history of the device that [event] is for, as a list of time
      and coordinates.

      The history includes positions that are not delivered as separate events
      to the application because they occurred in the same frame as [event].

      Note that only motion and scroll events record history, and motion events
      do it only if one of the mouse buttons is down, or the device has a tool.
  *)

  external get_event_type : t -> Ocgdk_enums.eventtype
    = "ml_gdk_event_get_event_type"
  (** Retrieves the type of the event. *)

  external get_event_sequence : t -> Event_sequence.t
    = "ml_gdk_event_get_event_sequence"
  (** Returns the event sequence to which the event belongs.

      Related touch events are connected in a sequence. Other events typically
      don't have event sequence information. *)

  external get_display : t -> Display.t option = "ml_gdk_event_get_display"
  (** Retrieves the display associated to the [event]. *)

  external get_device_tool : t -> Device_tool.t option
    = "ml_gdk_event_get_device_tool"
  (** Returns a [GdkDeviceTool] representing the tool that caused the event.

      If the was not generated by a device that supports different tools (such
      as a tablet), this function will return [None].

      Note: the [GdkDeviceTool] will be constant during the application
      lifetime, if settings must be stored persistently across runs, see
      {{!Ocgdk.Raw.Device_tool.val-get_serial}[Gdk.DeviceTool.get_serial]}. *)

  external get_device : t -> Device.t option = "ml_gdk_event_get_device"
  (** Returns the device of an event. *)

  external get_axis : t -> Ocgdk_enums.axisuse -> bool * float
    = "ml_gdk_event_get_axis"
  (** Extract the axis value for a particular axis use from an event structure.

      To find out which axes are used, use
      {{!Ocgdk.Raw.Device_tool.val-get_axes}[Gdk.DeviceTool.get_axes]} on the
      device tool returned by
      {{!Ocgdk.Raw.Event.val-get_device_tool}[Gdk.Event.get_device_tool]}. *)

  external get_axes : t -> bool * float array * int = "ml_gdk_event_get_axes"
  (** Extracts all axis values from an event.

      To find out which axes are used, use
      {{!Ocgdk.Raw.Device_tool.val-get_axes}[Gdk.DeviceTool.get_axes]} on the
      device tool returned by
      {{!Ocgdk.Raw.Event.val-get_device_tool}[Gdk.Event.get_device_tool]}. *)

  external _get_distance : t -> t -> bool * float = "ml_gdk_events_get_distance"
  (** Returns the distance between the event locations.

      This assumes that both events have X/Y information. If not, this function
      returns [false]. *)

  external _get_center : t -> t -> bool * float * float
    = "ml_gdk_events_get_center"
  (** Returns the point halfway between the events' positions.

      This assumes that both events have X/Y information. If not, this function
      returns [false]. *)

  external _get_angle : t -> t -> bool * float = "ml_gdk_events_get_angle"
  (** Returns the relative angle from [event1] to [event2].

      The relative angle is the angle between the X axis and the line through
      both events' positions. The rotation direction for positive angles is from
      the positive X axis towards the positive Y axis.

      This assumes that both events have X/Y information. If not, this function
      returns [false]. *)
end

and Gl_context : sig
  type t = [ `gl_context | `draw_context | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gdk_gl_context_get_type"

  (* Methods *)

  external set_use_es : t -> int -> unit = "ml_gdk_gl_context_set_use_es"
  (** Requests that GDK create an OpenGL ES context instead of an OpenGL one.

      Not all platforms support OpenGL ES.

      The [context] must not have been realized.

      By default, GDK will attempt to automatically detect whether the
      underlying GL implementation is OpenGL or OpenGL ES once the [context] is
      realized.

      You should check the return value of
      {{!Ocgdk.Raw.Gl_context.val-get_use_es}[Gdk.GLContext.get_use_es]} after
      calling {{!Ocgdk.Raw.Gl_context.val-realize}[Gdk.GLContext.realize]} to
      decide whether to use the OpenGL or OpenGL ES API, extensions, or shaders.
  *)

  external set_required_version : t -> int -> int -> unit
    = "ml_gdk_gl_context_set_required_version"
  (** Sets the major and minor version of OpenGL to request.

      Setting [major] and [minor] to zero will use the default values.

      Setting [major] and [minor] lower than the minimum versions required by
      GTK will result in the context choosing the minimum version.

      The [context] must not be realized or made current prior to calling this
      function. *)

  external set_forward_compatible : t -> bool -> unit
    = "ml_gdk_gl_context_set_forward_compatible"
  (** Sets whether the [GdkGLContext] should be forward-compatible.

      Forward-compatible contexts must not support OpenGL functionality that has
      been marked as deprecated in the requested version; non-forward compatible
      contexts, on the other hand, must support both deprecated and non
      deprecated functionality.

      The [GdkGLContext] must not be realized or made current prior to calling
      this function. *)

  external set_debug_enabled : t -> bool -> unit
    = "ml_gdk_gl_context_set_debug_enabled"
  (** Sets whether the [GdkGLContext] should perform extra validations and
      runtime checking.

      This is useful during development, but has additional overhead.

      The [GdkGLContext] must not be realized or made current prior to calling
      this function. *)

  external set_allowed_apis : t -> Ocgdk_enums.glapi -> unit
    = "ml_gdk_gl_context_set_allowed_apis"
  (** Sets the allowed APIs. When gdk_gl_context_realize() is called, only the
      allowed APIs will be tried. If you set this to 0, realizing will always
      fail.

      If you set it on a realized context, the property will not have any
      effect. It is only relevant during gdk_gl_context_realize().

      By default, all APIs are allowed. *)

  external realize : t -> (bool, GError.t) result = "ml_gdk_gl_context_realize"
  (** Realizes the given [GdkGLContext].

      It is safe to call this function on a realized [GdkGLContext]. *)

  external make_current : t -> unit = "ml_gdk_gl_context_make_current"
  (** Makes the [context] the current one. *)

  external is_shared : t -> t -> bool = "ml_gdk_gl_context_is_shared"
  (** Checks if the two GL contexts can share resources.

      When they can, the texture IDs from [other] can be used in [self]. This is
      particularly useful when passing [GdkGLTexture] objects between different
      contexts.

      Contexts created for the same display with the same properties will always
      be compatible, even if they are created for different surfaces. For other
      contexts it depends on the GL backend.

      Both contexts must be realized for this check to succeed. If either one is
      not, this function will return [false]. *)

  external is_legacy : t -> bool = "ml_gdk_gl_context_is_legacy"
  (** Whether the [GdkGLContext] is in legacy mode or not.

      The [GdkGLContext] must be realized before calling this function.

      When realizing a GL context, GDK will try to use the OpenGL 3.2 core
      profile; this profile removes all the OpenGL API that was deprecated prior
      to the 3.2 version of the specification. If the realization is successful,
      this function will return [false].

      If the underlying OpenGL implementation does not support core profiles,
      GDK will fall back to a pre-3.2 compatibility profile, and this function
      will return [true].

      You can use the value returned by this function to decide which kind of
      OpenGL API to use, or whether to do extension discovery, or what kind of
      shader programs to load. *)

  external get_version : t -> int * int = "ml_gdk_gl_context_get_version"
  (** Retrieves the OpenGL version of the [context].

      The [context] must be realized prior to calling this function. *)

  external get_use_es : t -> bool = "ml_gdk_gl_context_get_use_es"
  (** Checks whether the [context] is using an OpenGL or OpenGL ES profile. *)

  external get_surface : t -> Surface.t option = "ml_gdk_gl_context_get_surface"
  (** Retrieves the surface used by the [context]. *)

  external get_shared_context : t -> t option
    = "ml_gdk_gl_context_get_shared_context"
  (** Used to retrieves the [GdkGLContext] that this [context] share data with.

      As many contexts can share data now and no single shared context exists
      anymore, this function has been deprecated and now always returns [None].
  *)

  external get_required_version : t -> int option * int option
    = "ml_gdk_gl_context_get_required_version"
  (** Retrieves required OpenGL version set as a requirement for the [context]
      realization. It will not change even if a greater OpenGL version is
      supported and used after the [context] is realized. See
      {{!Ocgdk.Raw.Gl_context.val-get_version}[Gdk.GLContext.get_version]} for
      the real version in use.

      See
      {{!Ocgdk.Raw.Gl_context.val-set_required_version}[Gdk.GLContext.set_required_version]}.
  *)

  external get_forward_compatible : t -> bool
    = "ml_gdk_gl_context_get_forward_compatible"
  (** Retrieves whether the context is forward-compatible.

      See
      {{!Ocgdk.Raw.Gl_context.val-set_forward_compatible}[Gdk.GLContext.set_forward_compatible]}.
  *)

  external get_display : t -> Display.t option = "ml_gdk_gl_context_get_display"
  (** Retrieves the display the [context] is created for *)

  external get_debug_enabled : t -> bool = "ml_gdk_gl_context_get_debug_enabled"
  (** Retrieves whether the context is doing extra validations and runtime
      checking.

      See
      {{!Ocgdk.Raw.Gl_context.val-set_debug_enabled}[Gdk.GLContext.set_debug_enabled]}.
  *)

  external get_api : t -> Ocgdk_enums.glapi = "ml_gdk_gl_context_get_api"
  (** Gets the API currently in use.

      If the renderer has not been realized yet, 0 is returned. *)

  external get_allowed_apis : t -> Ocgdk_enums.glapi
    = "ml_gdk_gl_context_get_allowed_apis"
  (** Gets the allowed APIs set via gdk_gl_context_set_allowed_apis(). *)

  (* Properties *)
end
[@@ocaml.doc
  "Represents a platform-specific OpenGL draw context.\n\n\
   [GdkGLContext]s are created for a surface using\n\
   {{!Ocgdk.Raw.Surface.val-create_gl_context}[Gdk.Surface.create_gl_context]}, \
   and the context will match\n\
   the characteristics of the surface.\n\n\
   A [GdkGLContext] is not tied to any particular normal framebuffer.\n\
   For instance, it cannot draw to the surface back buffer. The GDK\n\
   repaint system is in full control of the painting to that. Instead,\n\
   you can create render buffers or textures and use [cairo_draw_from_gl]\n\
   in the draw function of your widget to draw them. Then GDK will handle\n\
   the integration of your rendering with that of other widgets.\n\n\
   Support for [GdkGLContext] is platform-specific and context creation\n\
   can fail, returning [None] context.\n\n\
   A [GdkGLContext] has to be made \"current\" in order to start using\n\
   it, otherwise any OpenGL call will be ignored.\n\n\
   {b Creating a new OpenGL context}\n\n\
   In order to create a new [GdkGLContext] instance you need a [GdkSurface],\n\
   which you typically get during the realize call of a widget.\n\n\
   A [GdkGLContext] is not realized until either \
   {{!Ocgdk.Raw.Gl_context.val-make_current}[Gdk.GLContext.make_current]}\n\
   or {{!Ocgdk.Raw.Gl_context.val-realize}[Gdk.GLContext.realize]} is called. \
   It is possible to specify\n\
   details of the GL context like the OpenGL version to be used, or whether\n\
   the GL context should have extra state validation enabled after calling\n\
   {{!Ocgdk.Raw.Surface.val-create_gl_context}[Gdk.Surface.create_gl_context]} \
   by calling {{!Ocgdk.Raw.Gl_context.val-realize}[Gdk.GLContext.realize]}.\n\
   If the realization fails you have the option to change the settings of\n\
   the [GdkGLContext] and try again.\n\n\
   {b Using a GdkGLContext}\n\n\
   You will need to make the [GdkGLContext] the current context before issuing\n\
   OpenGL calls; the system sends OpenGL commands to whichever context is \
   current.\n\
   It is possible to have multiple contexts, so you always need to ensure that\n\
   the one which you want to draw with is the current one before issuing \
   commands:\n\n\
   {[\n\
   gdk_gl_context_make_current (context);\n\
   ]}\n\n\
   You can now perform your drawing using OpenGL commands.\n\n\
   You can check which [GdkGLContext] is the current one by using\n\
   [Gdk.GLContext.get_current]; you can also unset any [GdkGLContext]\n\
   that is currently set by calling [Gdk.GLContext.clear_current].\n\n\
   The class built on this module is in {!Ocgdk.Gl_context}."]

(** Represents the individual outputs that are associated with a [GdkDisplay].

    [GdkDisplay] keeps a [GListModel] to enumerate and monitor monitors with
    {{!Ocgdk.Raw.Display.val-get_monitors}[Gdk.Display.get_monitors]}. You can
    use
    {{!Ocgdk.Raw.Display.val-get_monitor_at_surface}[Gdk.Display.get_monitor_at_surface]}
    to find a particular monitor.

    The class built on this module is in {!Ocgdk.Monitor}. *)
and Monitor : sig
  type t = [ `monitor | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gdk_monitor_get_type"

  (* Methods *)

  external is_valid : t -> bool = "ml_gdk_monitor_is_valid"
  (** Returns [true] if the [monitor] object corresponds to a physical monitor.

      The [monitor] becomes invalid when the physical monitor is unplugged or
      removed. *)

  external get_width_mm : t -> int = "ml_gdk_monitor_get_width_mm"
  (** Gets the width in millimeters of the monitor. *)

  external get_subpixel_layout : t -> Ocgdk_enums.subpixellayout
    = "ml_gdk_monitor_get_subpixel_layout"
  (** Gets information about the layout of red, green and blue primaries for
      pixels. *)

  external get_scale_factor : t -> int = "ml_gdk_monitor_get_scale_factor"
  (** Gets the internal scale factor that maps from monitor coordinates to
      device pixels.

      On traditional systems this is 1, but on very high density outputs it can
      be a higher value (often 2).

      This can be used if you want to create pixel based data for a particular
      monitor, but most of the time you’re drawing to a surface where it is
      better to use
      {{!Ocgdk.Raw.Surface.val-get_scale_factor}[Gdk.Surface.get_scale_factor]}
      instead. *)

  external get_scale : t -> float = "ml_gdk_monitor_get_scale"
  (** Gets the internal scale factor that maps from monitor coordinates to
      device pixels.

      This can be used if you want to create pixel based data for a particular
      monitor, but most of the time you’re drawing to a surface where it is
      better to use {{!Ocgdk.Raw.Surface.val-get_scale}[Gdk.Surface.get_scale]}
      instead. *)

  external get_refresh_rate : t -> int = "ml_gdk_monitor_get_refresh_rate"
  (** Gets the refresh rate of the monitor, if available.

      The value is in milli-Hertz, so a refresh rate of 60Hz is returned as
      60000. *)

  external get_model : t -> string option = "ml_gdk_monitor_get_model"
  (** Gets the string identifying the monitor model, if available. *)

  external get_manufacturer : t -> string option
    = "ml_gdk_monitor_get_manufacturer"
  (** Gets the name or PNP ID of the monitor's manufacturer.

      Note that this value might also vary depending on actual display backend.

      The PNP ID registry is located at
      {{:https://uefi.org/pnp_id_list}https://uefi.org/pnp_id_list}. *)

  external get_height_mm : t -> int = "ml_gdk_monitor_get_height_mm"
  (** Gets the height in millimeters of the monitor. *)

  external get_geometry : t -> Rectangle.t = "ml_gdk_monitor_get_geometry"
  (** Retrieves the size and position of the monitor within the display
      coordinate space.

      The returned geometry is in ”application pixels”, not in ”device pixels”
      (see {{!Ocgdk.Raw.Monitor.val-get_scale}[Gdk.Monitor.get_scale]}). *)

  external get_display : t -> Display.t = "ml_gdk_monitor_get_display"
  (** Gets the display that this monitor belongs to. *)

  external get_description : t -> string option
    = "ml_gdk_monitor_get_description"
  (** Gets a string describing the monitor, if available.

      This can be used to identify a monitor in the UI. *)

  external get_connector : t -> string option = "ml_gdk_monitor_get_connector"
  [@@ocaml.doc
    "Gets the name of the monitor's connector, if available.\n\n\
    \  These are strings such as \"eDP-1\", or \"HDMI-2\". They depend\n\
    \  on software and hardware configuration, and should not be\n\
    \  relied on as stable identifiers of a specific monitor."]

  (* Properties *)

  val on_invalidate :
    ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
  (** Emitted when the output represented by [monitor] gets disconnected. *)
end

(** Represents a collection of input devices that belong to a user.

    The class built on this module is in {!Ocgdk.Seat}. *)
and Seat : sig
  type t = [ `seat | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gdk_seat_get_type"

  (* Methods *)

  external get_tools : t -> Device_tool.t list = "ml_gdk_seat_get_tools"
  (** Returns all [GdkDeviceTools] that are known to the application. *)

  external get_pointer : t -> Device.t option = "ml_gdk_seat_get_pointer"
  (** Returns the device that routes pointer events. *)

  external get_keyboard : t -> Device.t option = "ml_gdk_seat_get_keyboard"
  (** Returns the device that routes keyboard events. *)

  external get_display : t -> Display.t = "ml_gdk_seat_get_display"
  (** Returns the [GdkDisplay] this seat belongs to. *)

  external get_devices : t -> Ocgdk_enums.seatcapabilities -> Device.t list
    = "ml_gdk_seat_get_devices"
  (** Returns the devices that match the given capabilities. *)

  external get_capabilities : t -> Ocgdk_enums.seatcapabilities
    = "ml_gdk_seat_get_capabilities"
  (** Returns the capabilities this [GdkSeat] currently has. *)

  (* Properties *)

  val on_device_added :
    ?after:bool ->
    t ->
    callback:(device:Device.t -> unit) ->
    Gobject.Signal.handler_id
  (** Emitted when a new input device is related to this seat. *)

  val on_device_removed :
    ?after:bool ->
    t ->
    callback:(device:Device.t -> unit) ->
    Gobject.Signal.handler_id
  (** Emitted when an input device is removed (e.g. unplugged). *)

  val on_tool_added :
    ?after:bool ->
    t ->
    callback:(tool:Device_tool.t -> unit) ->
    Gobject.Signal.handler_id
  (** Emitted whenever a new tool is made known to the seat.

      The tool may later be assigned to a device (i.e. on proximity with a
      tablet). The device will emit the
      {{!Ocgdk.Raw.Device.val-on_tool_changed}[Gdk.Device::tool-changed]} signal
      accordingly.

      A same tool may be used by several devices. *)

  val on_tool_removed :
    ?after:bool ->
    t ->
    callback:(tool:Device_tool.t -> unit) ->
    Gobject.Signal.handler_id
  (** Emitted whenever a tool is no longer known to this [seat]. *)
end

(** Represents a rectangular region on the screen.

    It’s a low-level object, used to implement high-level objects such as
    GtkWindow.

    The surfaces you see in practice are either
    {{!Ocgdk.Raw.Toplevel}[Gdk.Toplevel]} or {{!Ocgdk.Raw.Popup}[Gdk.Popup]},
    and those interfaces provide much of the required API to interact with these
    surfaces. Other, more specialized surface types exist, but you will rarely
    interact with them directly.

    The class built on this module is in {!Ocgdk.Surface}. *)
and Surface : sig
  type t = [ `surface | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gdk_surface_get_type"

  external new_popup : t -> bool -> t = "ml_gdk_surface_new_popup"
  (** Create a new popup surface.

      The surface will be attached to [parent] and can be positioned relative to
      it using {{!Ocgdk.Raw.Popup.val-present}[Gdk.Popup.present]}. *)

  external new_toplevel : Display.t -> t = "ml_gdk_surface_new_toplevel"
  (** Creates a new toplevel surface. *)

  (* Methods *)

  external translate_coordinates : t -> t -> float -> float -> bool
    = "ml_gdk_surface_translate_coordinates"
  (** Translates coordinates between two surfaces.

      Note that this only works if [to] and [from] are popups or transient-for
      to the same toplevel (directly or indirectly). *)

  external set_opaque_region : t -> Occairo_raw.Region.t option -> unit
    = "ml_gdk_surface_set_opaque_region"
  (** Marks a region of the [GdkSurface] as opaque.

      For optimisation purposes, compositing window managers may like to not
      draw obscured regions of surfaces, or turn off blending during for these
      regions. With RGB windows with no transparency, this is just the shape of
      the window, but with ARGB32 windows, the compositor does not know what
      regions of the window are transparent or not.

      This function only works for toplevel surfaces.

      GTK will update this property automatically if the [surface] background is
      opaque, as we know where the opaque regions are. If your surface
      background is not opaque, please update this property in your
      GtkWidgetClass.css_changed handler. *)

  external set_input_region : t -> Occairo_raw.Region.t option -> unit
    = "ml_gdk_surface_set_input_region"
  (** Apply the region to the surface for the purpose of event handling.

      Mouse events which happen while the pointer position corresponds to an
      unset bit in the mask will be passed on the surface below [surface].

      An input region is typically used with RGBA surfaces. The alpha channel of
      the surface defines which pixels are invisible and allows for nicely
      antialiased borders, and the input region controls where the surface is
      “clickable”.

      Use
      {{!Ocgdk.Raw.Display.val-supports_input_shapes}[Gdk.Display.supports_input_shapes]}
      to find out if a particular backend supports input regions. *)

  external set_device_cursor : t -> Device.t -> Cursor.t -> unit
    = "ml_gdk_surface_set_device_cursor"
  (** Sets a specific [GdkCursor] for a given device when it gets inside
      [surface].

      Passing [None] for the [cursor] argument means that [surface] will use the
      cursor of its parent surface. Most surfaces should use this default.

      Use {{!Ocgdk.Raw.Cursor.val-new_from_name}[Gdk.Cursor.new_from_name]} or
      {{!Ocgdk.Raw.Cursor.val-new_from_texture}[Gdk.Cursor.new_from_texture]} to
      create the cursor. To make the cursor invisible, use [GDK_BLANK_CURSOR].
  *)

  external set_cursor : t -> Cursor.t option -> unit
    = "ml_gdk_surface_set_cursor"
  (** Sets the default mouse pointer for a [GdkSurface].

      Passing [None] for the [cursor] argument means that [surface] will use the
      cursor of its parent surface. Most surfaces should use this default. Note
      that [cursor] must be for the same display as [surface].

      Use {{!Ocgdk.Raw.Cursor.val-new_from_name}[Gdk.Cursor.new_from_name]} or
      {{!Ocgdk.Raw.Cursor.val-new_from_texture}[Gdk.Cursor.new_from_texture]} to
      create the cursor. To make the cursor invisible, use [GDK_BLANK_CURSOR].
  *)

  external request_layout : t -> unit = "ml_gdk_surface_request_layout"
  (** Request a layout phase from the surface's frame clock.

      See
      {{!Ocgdk.Raw.Frame_clock.val-request_phase}[Gdk.FrameClock.request_phase]}.
  *)

  external queue_render : t -> unit = "ml_gdk_surface_queue_render"
  (** Forces a [Gdk.Surface::render] signal emission for [surface] to be
      scheduled.

      This function is useful for implementations that track invalid regions on
      their own. *)

  external is_destroyed : t -> bool = "ml_gdk_surface_is_destroyed"
  (** Check to see if a surface is destroyed. *)

  external hide : t -> unit = "ml_gdk_surface_hide"
  (** Hide the surface.

      For toplevel surfaces, withdraws them, so they will no longer be known to
      the window manager; for all surfaces, unmaps them, so they won’t be
      displayed. Normally done automatically as part of gtk_widget_hide(). *)

  external get_width : t -> int = "ml_gdk_surface_get_width"
  (** Returns the width of the given [surface].

      Surface size is reported in ”application pixels”, not ”device pixels” (see
      {{!Ocgdk.Raw.Surface.val-get_scale_factor}[Gdk.Surface.get_scale_factor]}).
  *)

  external get_scale_factor : t -> int = "ml_gdk_surface_get_scale_factor"
  (** Returns the internal scale factor that maps from surface coordinates to
      the actual device pixels.

      On traditional systems this is 1, but on very high density outputs this
      can be a higher value (often 2). A higher value means that drawing is
      automatically scaled up to a higher resolution, so any code doing drawing
      will automatically look nicer. However, if you are supplying pixel-based
      data the scale value can be used to determine whether to use a pixel
      resource with higher resolution data.

      The scale factor may change during the lifetime of the surface. *)

  external get_scale : t -> float = "ml_gdk_surface_get_scale"
  (** Returns the internal scale that maps from surface coordinates to the
      actual device pixels.

      When the scale is bigger than 1, the windowing system prefers to get
      buffers with a resolution that is bigger than the surface size (e.g. to
      show the surface on a high-resolution display, or in a magnifier).

      Compare with
      {{!Ocgdk.Raw.Surface.val-get_scale_factor}[Gdk.Surface.get_scale_factor]},
      which returns the next larger integer.

      The scale may change during the lifetime of the surface. *)

  external get_mapped : t -> bool = "ml_gdk_surface_get_mapped"
  (** Checks whether the surface has been mapped.

      A surface is mapped with
      {{!Ocgdk.Raw.Toplevel.val-present}[Gdk.Toplevel.present]} or
      {{!Ocgdk.Raw.Popup.val-present}[Gdk.Popup.present]}. *)

  external get_height : t -> int = "ml_gdk_surface_get_height"
  (** Returns the height of the given [surface].

      Surface size is reported in ”application pixels”, not ”device pixels” (see
      {{!Ocgdk.Raw.Surface.val-get_scale_factor}[Gdk.Surface.get_scale_factor]}).
  *)

  external get_frame_clock : t -> Frame_clock.t
    = "ml_gdk_surface_get_frame_clock"
  (** Gets the frame clock for the surface.

      The frame clock for a surface never changes unless the surface is
      reparented to a new toplevel surface. *)

  external get_display : t -> Display.t = "ml_gdk_surface_get_display"
  (** Gets the [GdkDisplay] associated with a [GdkSurface]. *)

  external get_device_position :
    t -> Device.t -> bool * float * float * Ocgdk_enums.modifiertype
    = "ml_gdk_surface_get_device_position"
  (** Obtains the current device position and modifier state.

      The position is given in coordinates relative to the upper left corner of
      [surface]. *)

  external get_device_cursor : t -> Device.t -> Cursor.t option
    = "ml_gdk_surface_get_device_cursor"
  (** Retrieves a [GdkCursor] pointer for the [device] currently set on the
      specified [GdkSurface].

      If the return value is [None] then there is no custom cursor set on the
      specified surface, and it is using the cursor for its parent surface.

      Use {{!Ocgdk.Raw.Surface.val-set_cursor}[Gdk.Surface.set_cursor]} to unset
      the cursor of the surface. *)

  external get_cursor : t -> Cursor.t option = "ml_gdk_surface_get_cursor"
  (** Retrieves a [GdkCursor] pointer for the cursor currently set on the
      [GdkSurface].

      If the return value is [None] then there is no custom cursor set on the
      surface, and it is using the cursor for its parent surface.

      Use {{!Ocgdk.Raw.Surface.val-set_cursor}[Gdk.Surface.set_cursor]} to unset
      the cursor of the surface. *)

  external destroy : t -> unit = "ml_gdk_surface_destroy"
  (** Destroys the window system resources associated with [surface] and
      decrements [surface]'s reference count.

      The window system resources for all children of [surface] are also
      destroyed, but the children’s reference counts are not decremented.

      Note that a surface will not be destroyed automatically when its reference
      count reaches zero. You must call this function yourself before that
      happens. *)

  external create_vulkan_context : t -> (Vulkan_context.t, GError.t) result
    = "ml_gdk_surface_create_vulkan_context"
  (** Sets an error and returns [None]. *)

  external create_similar_surface :
    t -> Occairo_enums.content -> int -> int -> Occairo_raw.Surface.t
    = "ml_gdk_surface_create_similar_surface"
  (** Create a new Cairo surface that is as compatible as possible with the
      given [surface].

      For example the new surface will have the same fallback resolution and
      font options as [surface]. Generally, the new surface will also use the
      same backend as [surface], unless that is not possible for some reason.
      The type of the returned surface may be examined with
      cairo_surface_get_type().

      Initially the surface contents are all 0 (transparent if contents have
      transparency, black otherwise.)

      This function always returns a valid pointer, but it will return a pointer
      to a “nil” surface if [other] is already in an error state or any other
      error occurs. *)

  external create_gl_context : t -> (Gl_context.t, GError.t) result
    = "ml_gdk_surface_create_gl_context"
  (** Creates a new [GdkGLContext] for the [GdkSurface].

      The context is disconnected from any particular surface or surface. If the
      creation of the [GdkGLContext] failed, [error] will be set. Before using
      the returned [GdkGLContext], you will need to call
      {{!Ocgdk.Raw.Gl_context.val-make_current}[Gdk.GLContext.make_current]} or
      {{!Ocgdk.Raw.Gl_context.val-realize}[Gdk.GLContext.realize]}. *)

  external create_cairo_context : t -> Cairo_context.t
    = "ml_gdk_surface_create_cairo_context"
  (** Creates a new [GdkCairoContext] for rendering on [surface]. *)

  external beep : t -> unit = "ml_gdk_surface_beep"
  (** Emits a short beep associated to [surface].

      If the display of [surface] does not support per-surface beeps, emits a
      short beep on the display just as
      {{!Ocgdk.Raw.Display.val-beep}[Gdk.Display.beep]}. *)

  (* Properties *)

  val on_enter_monitor :
    ?after:bool ->
    t ->
    callback:(monitor:Monitor.t -> unit) ->
    Gobject.Signal.handler_id
  (** Emitted when [surface] starts being present on the monitor. *)

  val on_event :
    ?after:bool ->
    t ->
    callback:(event:Event.t -> bool) ->
    Gobject.Signal.handler_id
  (** Emitted when GDK receives an input event for [surface]. *)

  val on_layout :
    ?after:bool ->
    t ->
    callback:(width:int -> height:int -> unit) ->
    Gobject.Signal.handler_id
  (** Emitted when the size of [surface] is changed, or when relayout should be
      performed.

      Surface size is reported in ”application pixels”, not ”device pixels” (see
      gdk_surface_get_scale_factor()). *)

  val on_leave_monitor :
    ?after:bool ->
    t ->
    callback:(monitor:Monitor.t -> unit) ->
    Gobject.Signal.handler_id
  (** Emitted when [surface] stops being present on the monitor. *)
end

(** Represents the platform-specific Vulkan draw context.

    [GdkVulkanContext]s are created for a surface using
    {{!Ocgdk.Raw.Surface.val-create_vulkan_context}[Gdk.Surface.create_vulkan_context]},
    and the context will match the characteristics of the surface.

    Support for [GdkVulkanContext] is platform-specific and context creation can
    fail, returning [None] context.

    The class built on this module is in {!Ocgdk.Vulkan_context}. *)
and Vulkan_context : sig
  type t = [ `vulkan_context | `draw_context | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gdk_vulkan_context_get_type"

  (* Methods *)

  val on_images_updated :
    ?after:bool -> t -> callback:(unit -> unit) -> Gobject.Signal.handler_id
  (** Emitted when the images managed by this context have changed.

      Usually this means that the swapchain had to be recreated, for example in
      response to a change of the surface size. *)
end
