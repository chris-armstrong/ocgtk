(** The classes of {!Ocgdk.App_launch_context}, {!Ocgdk.Cairo_context},
    {!Ocgdk.Clipboard}, {!Ocgdk.Device}, {!Ocgdk.Display},
    {!Ocgdk.Draw_context}, {!Ocgdk.Event}, {!Ocgdk.Gl_context},
    {!Ocgdk.Monitor}, {!Ocgdk.Seat}, {!Ocgdk.Surface}, {!Ocgdk.Vulkan_context},
    defined together because they refer to each other. Each has a module of its
    own that re-exports it; use that module rather than this one. *)

class type app_launch_context_t = object
  inherit Ocgio.App_launch_context.app_launch_context_t

  (** {2:methods Methods} *)

  method set_desktop : int -> unit
  (** Sets the workspace on which applications will be launched.

      This only works when running under a window manager that supports multiple
      workspaces, as described in the Extended Window Manager Hints.
      Specifically this sets the [_NET_WM_DESKTOP] property described in that
      spec.

      This only works when using the X11 backend.

      When the workspace is not specified or [desktop] is set to -1, it is up to
      the window manager to pick one, typically it will be the current
      workspace. *)

  method set_icon : Ocgio.Icon.icon_t option -> unit
  (** Sets the icon for applications that are launched with this context.

      Window Managers can use this information when displaying startup
      notification.

      See also [Gdk.AppLaunchContext.set_icon_name]. *)

  method set_icon_name : string option -> unit
  (** Sets the icon for applications that are launched with this context.

      The [icon_name] will be interpreted in the same way as the Icon field in
      desktop files. See also [Gdk.AppLaunchContext.set_icon].

      If both [icon] and [icon_name] are set, the [icon_name] takes priority. If
      neither [icon] or [icon_name] is set, the icon is taken from either the
      file that is passed to launched application or from the [GAppInfo] for the
      launched application itself. *)

  method set_timestamp : UInt32.t -> unit
  (** Sets the timestamp of [context].

      The timestamp should ideally be taken from the event that triggered the
      launch.

      Window managers can use this information to avoid moving the focus to the
      newly launched application when the user is busy typing in another window.
      This is also known as 'focus stealing prevention'. *)

  (** {2:properties Properties} *)

  method display : display_t
  (** The display that the [GdkAppLaunchContext] is on. *)
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [AppLaunchContext].}\n\n\
     Inherits from: \
     {{!Ocgio.App_launch_context.class-type-app_launch_context_t}Ocgio.App_launch_context}\n\n\
     Handles launching an application in a graphical context.\n\n\
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
     ]}"]

(** {b The methods, signals and properties of a [CairoContext].}

    Inherits from:
    {{!Ocgdk.Draw_context.class-type-draw_context_t}Ocgdk.Draw_context}

    Represents the platform-specific draw context.

    [GdkCairoContext]s are created for a surface using
    [Gdk.Surface.create_cairo_context], and the context can then be used to draw
    on that surface. *)
and cairo_context_t = object
  (** {2:methods Methods} *)

  method cairo_create : unit -> Occairo.Context.context_t option
  (** Retrieves a Cairo context to be used to draw on the [GdkSurface] of
      [context].

      A call to [Gdk.DrawContext.begin_frame] with this [context] must have been
      done or this function will return [None].

      The returned context is guaranteed to be valid until
      [Gdk.DrawContext.end_frame] is called. *)

  (** {2:conversions Conversions} *)

  method as_cairo_context : Raw.Cairo_context.t
end

(** {b The methods, signals and properties of a [Clipboard].}

    Represents data shared between applications or inside an application.

    To get a [GdkClipboard] object, use [Gdk.Display.get_clipboard] or
    [Gdk.Display.get_primary_clipboard]. You can find out about the data that is
    currently available in a clipboard using [Gdk.Clipboard.get_formats].

    To make text or image data available in a clipboard, use
    [Gdk.Clipboard.set_text] or [Gdk.Clipboard.set_texture]. For other data, you
    can use [Gdk.Clipboard.set_content], which takes a [Gdk.ContentProvider]
    object.

    To read textual or image data from a clipboard, use
    [Gdk.Clipboard.read_text_async] or [Gdk.Clipboard.read_texture_async]. For
    other data, use [Gdk.Clipboard.read_async], which provides a [GInputStream]
    object. *)
and clipboard_t = object
  (** {2:signals Signals} *)

  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the clipboard changes ownership. *)

  (** {2:methods Methods} *)

  method get_content : unit -> Content_provider.content_provider_t option
  (** Returns the [GdkContentProvider] currently set on [clipboard].

      If the [clipboard] is empty or its contents are not owned by the current
      process, [None] will be returned. *)

  method get_display : unit -> display_t
  (** Gets the [GdkDisplay] that the clipboard was created for. *)

  method get_formats : unit -> Raw.Content_formats.t
  (** Gets the formats that the clipboard can provide its current contents in.
  *)

  method is_local : unit -> bool
  (** Returns if the clipboard is local.

      A clipboard is considered local if it was last claimed by the running
      application.

      Note that [Gdk.Clipboard.get_content] may return [None] even on a local
      clipboard. In this case the clipboard is empty. *)

  method read_text_finish :
    Ocgio.Async_result.async_result_t -> (string option, GError.t) result
  (** Finishes an asynchronous clipboard read.

      See [Gdk.Clipboard.read_text_async]. *)

  method read_texture_finish :
    Ocgio.Async_result.async_result_t ->
    (Texture.texture_t option, GError.t) result
  (** Finishes an asynchronous clipboard read.

      See [Gdk.Clipboard.read_texture_async]. *)

  method read_value_finish :
    Ocgio.Async_result.async_result_t -> (Gobject.Value.t, GError.t) result
  (** Finishes an asynchronous clipboard read.

      See [Gdk.Clipboard.read_value_async]. *)

  method set_content : Content_provider.content_provider_t option -> bool
  (** Sets a new content provider on [clipboard].

      The clipboard will claim the [GdkDisplay]'s resources and advertise these
      new contents to other applications.

      In the rare case of a failure, this function will return [false]. The
      clipboard will then continue reporting its old contents and ignore
      [provider].

      If the contents are read by either an external application or the
      [clipboard]'s read functions, [clipboard] will select the best format to
      transfer the contents and then request that format from [provider]. *)

  method set_value : Gobject.Value.t -> unit
  (** Sets the [clipboard] to contain the given [value]. *)

  method store_finish :
    Ocgio.Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes an asynchronous clipboard store.

      See [Gdk.Clipboard.store_async]. *)

  (** {2:conversions Conversions} *)

  method as_clipboard : Raw.Clipboard.t
end

(** {b The methods, signals and properties of a [Device].}

    Represents an input device, such as a keyboard, mouse or touchpad.

    See the [Gdk.Seat] documentation for more information about the various
    kinds of devices, and their relationships. *)
and device_t = object
  (** {2:signals Signals} *)

  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted either when the number of either axes or keys changes.

      On X11 this will normally happen when the physical device routing events
      through the logical device changes (for example, user switches from the
      USB mouse to a tablet); in that case the logical device will change to
      reflect the axes and keys on the new physical device. *)

  method on_tool_changed :
    ?after:bool ->
    callback:(tool:Device_tool.device_tool_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted on pen/eraser devices whenever tools enter or leave proximity. *)

  (** {2:methods Methods} *)

  method get_active_layout_index : unit -> int
  (** Retrieves the index of the active layout of the keyboard.

      If there is no valid active layout for the [GdkDevice], this function will
      return -1;

      This is only relevant for keyboard devices. *)

  method get_caps_lock_state : unit -> bool
  (** Retrieves whether the Caps Lock modifier of the keyboard is locked.

      This is only relevant for keyboard devices. *)

  method get_device_tool : unit -> Device_tool.device_tool_t option
  (** Retrieves the current tool for [device]. *)

  method get_direction : unit -> Ocpango.Enums.direction
  (** Returns the direction of effective layout of the keyboard.

      This is only relevant for keyboard devices.

      The direction of a layout is the direction of the majority of its symbols.
      See [Pango.unichar_direction]. *)

  method get_display : unit -> display_t
  (** Returns the [GdkDisplay] to which [device] pertains. *)

  method get_has_cursor : unit -> bool
  (** Determines whether the pointer follows device motion.

      This is not meaningful for keyboard devices, which don't have a pointer.
  *)

  method get_layout_names : unit -> string array option
  (** Retrieves the names of the layouts of the keyboard.

      This is only relevant for keyboard devices. *)

  method get_modifier_state : unit -> Enums.modifiertype
  (** Retrieves the current modifier state of the keyboard.

      This is only relevant for keyboard devices. *)

  method get_name : unit -> string
  (** The name of the device, suitable for showing in a user interface. *)

  method get_num_lock_state : unit -> bool
  (** Retrieves whether the Num Lock modifier of the keyboard is locked.

      This is only relevant for keyboard devices. *)

  method get_num_touches : unit -> int
  (** Retrieves the number of touch points associated to [device]. *)

  method get_product_id : unit -> string option
  (** Returns the product ID of this device.

      This ID is retrieved from the device, and does not change. See
      [Gdk.Device.get_vendor_id] for more information. *)

  method get_scroll_lock_state : unit -> bool
  (** Retrieves whether the Scroll Lock modifier of the keyboard is locked.

      This is only relevant for keyboard devices. *)

  method get_seat : unit -> seat_t
  (** Returns the [GdkSeat] the device belongs to. *)

  method get_source : unit -> Enums.inputsource
  (** Determines the type of the device. *)

  method get_timestamp : unit -> UInt32.t
  (** Returns the timestamp of the last activity for this device.

      In practice, this means the timestamp of the last event that was received
      from the OS for this device. (GTK may occasionally produce events for a
      device that are not received from the OS, and will not update the
      timestamp). *)

  method get_vendor_id : unit -> string option
  [@@ocaml.doc
    "Returns the vendor ID of this device.\n\n\
     This ID is retrieved from the device, and does not change.\n\n\
     This function, together with [Gdk.Device.get_product_id],\n\
     can be used to eg. compose [GSettings] paths to store settings\n\
     for this device.\n\n\
     {[\n\
    \ static GSettings *\n\
    \ get_device_settings (GdkDevice *device)\n\
    \ {\n\
    \   const char *vendor, *product;\n\
    \   GSettings *settings;\n\
    \   GdkDevice *device;\n\
    \   char *path;\n\n\
    \   vendor = gdk_device_get_vendor_id (device);\n\
    \   product = gdk_device_get_product_id (device);\n\n\
    \   path = g_strdup_printf (\"/org/example/app/devices/%s:%s/\", vendor, \
     product);\n\
    \   settings = g_settings_new_with_path (DEVICE_SCHEMA, path);\n\
    \   g_free (path);\n\n\
    \   return settings;\n\
    \ }\n\
     ]}"]

  method has_bidi_layouts : unit -> bool
  (** Determines if layouts for both right-to-left and left-to-right languages
      are in use on the keyboard.

      This is only relevant for keyboard devices. *)

  (** {2:properties Properties} *)

  method n_axes : int
  (** Number of axes in the device. *)

  (** {2:conversions Conversions} *)

  method as_device : Raw.Device.t
end

(** {b The methods, signals and properties of a [Display].}

    A representation of a workstation.

    Their purpose are two-fold:

    - To manage and provide information about input devices (pointers,
      keyboards, etc)
    - To manage and provide information about output devices (monitors,
      projectors, etc)

    Most of the input device handling has been factored out into separate
    [Gdk.Seat] objects. Every display has a one or more seats, which can be
    accessed with [Gdk.Display.get_default_seat] and [Gdk.Display.list_seats].

    Output devices are represented by [Gdk.Monitor] objects, which can be
    accessed with [Gdk.Display.get_monitor_at_surface] and similar APIs. *)
and display_t = object
  (** {2:signals Signals} *)

  method on_closed :
    ?after:bool ->
    callback:(is_error:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the connection to the windowing system for [display] is
      closed. *)

  method on_opened :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the connection to the windowing system for [display] is
      opened. *)

  method on_seat_added :
    ?after:bool ->
    callback:(seat:seat_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever a new seat is made known to the windowing system. *)

  method on_seat_removed :
    ?after:bool ->
    callback:(seat:seat_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever a seat is removed by the windowing system. *)

  method on_setting_changed :
    ?after:bool ->
    callback:(setting:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever a setting changes its value. *)

  (** {2:methods Methods} *)

  method beep : unit -> unit
  (** Emits a short beep on [display] *)

  method close : unit -> unit
  (** Closes the connection to the windowing system for the given display.

      This cleans up associated resources. *)

  method create_gl_context : unit -> (gl_context_t, GError.t) result
  (** Creates a new [GdkGLContext] for the [GdkDisplay].

      The context is disconnected from any particular surface or surface and
      cannot be used to draw to any surface. It can only be used to draw to
      non-surface framebuffers like textures.

      If the creation of the [GdkGLContext] failed, [error] will be set. Before
      using the returned [GdkGLContext], you will need to call
      [Gdk.GLContext.make_current] or [Gdk.GLContext.realize]. *)

  method device_is_grabbed : device_t -> bool
  (** Returns [true] if there is an ongoing grab on [device] for [display]. *)

  method flush : unit -> unit
  (** Flushes any requests queued for the windowing system.

      This happens automatically when the main loop blocks waiting for new
      events, but if your application is drawing without returning control to
      the main loop, you may need to call this function explicitly. A common
      case where this function needs to be called is when an application is
      executing drawing commands from a thread other than the thread where the
      main loop is running.

      This is most useful for X11. On windowing systems where requests are
      handled synchronously, this function will do nothing. *)

  method get_app_launch_context : unit -> app_launch_context_t
  (** Returns a [GdkAppLaunchContext] suitable for launching applications on the
      given display. *)

  method get_clipboard : unit -> clipboard_t
  (** Gets the clipboard used for copy/paste operations. *)

  method get_default_seat : unit -> seat_t option
  (** Returns the default [GdkSeat] for this display.

      Note that a display may not have a seat. In this case, this function will
      return [None]. *)

  method get_dmabuf_formats : unit -> Raw.Dmabuf_formats.t
  (** Returns the dma-buf formats that are supported on this display.

      GTK may use OpenGL or Vulkan to support some formats. Calling this
      function will then initialize them if they aren't yet.

      The formats returned by this function can be used for negotiating buffer
      formats with producers such as v4l, pipewire or GStreamer.

      To learn more about dma-bufs, see [Gdk.DmabufTextureBuilder].

      This function is threadsafe. It can be called from any thread. *)

  method get_monitor_at_surface : surface_t -> monitor_t option
  (** Gets the monitor in which the largest area of [surface] resides. *)

  method get_monitors : unit -> Ocgio.List_model.list_model_t
  (** Gets the list of monitors associated with this display.

      Subsequent calls to this function will always return the same list for the
      same display.

      You can listen to the GListModel::items-changed signal on this list to
      monitor changes to the monitor of this display. *)

  method get_name : unit -> string
  (** Gets the name of the display. *)

  method get_primary_clipboard : unit -> clipboard_t
  (** Gets the clipboard used for the primary selection.

      On backends where the primary clipboard is not supported natively, GDK
      emulates this clipboard locally. *)

  method get_setting : string -> Gobject.Value.t -> bool
  (** Retrieves a desktop-wide setting such as double-click time for the
      [display]. *)

  method get_startup_notification_id : unit -> string option
  (** Gets the startup notification ID for a Wayland display, or [None] if no ID
      has been defined. *)

  method is_closed : unit -> bool
  (** Finds out if the display has been closed. *)

  method is_composited : unit -> bool
  (** Returns whether surfaces can reasonably be expected to have their alpha
      channel drawn correctly on the screen.

      Check [Gdk.Display.is_rgba] for whether the display supports an alpha
      channel.

      On X11 this function returns whether a compositing manager is compositing
      on [display].

      On modern displays, this value is always [true]. *)

  method is_rgba : unit -> bool
  (** Returns whether surfaces on this [display] are created with an alpha
      channel.

      Even if a [true] is returned, it is possible that the surface’s alpha
      channel won’t be honored when displaying the surface on the screen: in
      particular, for X an appropriate windowing manager and compositing manager
      must be running to provide appropriate display. Use
      [Gdk.Display.is_composited] to check if that is the case.

      On modern displays, this value is always [true]. *)

  method list_seats : unit -> seat_t list
  (** Returns the list of seats known to [display]. *)

  method notify_startup_complete : string -> unit
  (** Indicates to the GUI environment that the application has finished
      loading, using a given identifier.

      GTK will call this function automatically for GtkWindow with custom
      startup-notification identifier unless
      gtk_window_set_auto_startup_notification() is called to disable that
      feature. *)

  method prepare_gl : unit -> (bool, GError.t) result
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

  method put_event : event_t -> unit
  (** Adds the given event to the event queue for [display]. *)

  method supports_input_shapes : unit -> bool
  (** Returns [true] if the display supports input shapes.

      This means that [Gdk.Surface.set_input_region] can be used to modify the
      input shape of surfaces on [display].

      On modern displays, this value is always [true]. *)

  method supports_shadow_width : unit -> bool
  (** Returns whether it's possible for a surface to draw outside of the window
      area.

      If [true] is returned the application decides if it wants to draw shadows.
      If [false] is returned, the compositor decides if it wants to draw
      shadows. *)

  method sync : unit -> unit
  (** Flushes any requests queued for the windowing system and waits until all
      requests have been handled.

      This is often used for making sure that the display is synchronized with
      the current state of the program. Calling [Gdk.Display.sync] before
      [GdkX11.Display.error_trap_pop] makes sure that any errors generated from
      earlier requests are handled before the error trap is removed.

      This is most useful for X11. On windowing systems where requests are
      handled synchronously, this function will do nothing. *)

  (** {2:conversions Conversions} *)

  method as_display : Raw.Display.t
end

(** {b The methods, signals and properties of a [DrawContext].}

    Base class for objects implementing different rendering methods.

    [GdkDrawContext] is the base object used by contexts implementing different
    rendering methods, such as [Gdk.CairoContext] or [Gdk.GLContext]. It
    provides shared functionality between those contexts.

    You will always interact with one of those subclasses.

    A [GdkDrawContext] is always associated with a single toplevel surface. *)
and draw_context_t = object
  (** {2:methods Methods} *)

  method begin_frame : Occairo.Region.region_t -> unit
  (** Indicates that you are beginning the process of redrawing [region] on the
      [context]'s surface.

      Calling this function begins a drawing operation using [context] on the
      surface that [context] was created from. The actual requirements and
      guarantees for the drawing operation vary for different implementations of
      drawing, so a [Gdk.CairoContext] and a [Gdk.GLContext] need to be treated
      differently.

      A call to this function is a requirement for drawing and must be followed
      by a call to [Gdk.DrawContext.end_frame], which will complete the drawing
      operation and ensure the contents become visible on screen.

      Note that the [region] passed to this function is the minimum region that
      needs to be drawn and depending on implementation, windowing system and
      hardware in use, it might be necessary to draw a larger region. Drawing
      implementation must use [Gdk.DrawContext.get_frame_region] to query the
      region that must be drawn.

      When using GTK, the widget system automatically places calls to
      gdk_draw_context_begin_frame() and gdk_draw_context_end_frame() via the
      use of GskRenderers, so application code does not need to call these
      functions explicitly. *)

  method end_frame : unit -> unit
  (** Ends a drawing operation started with gdk_draw_context_begin_frame().

      This makes the drawing available on screen. See
      [Gdk.DrawContext.begin_frame] for more details about drawing.

      When using a [Gdk.GLContext], this function may call [glFlush()]
      implicitly before returning; it is not recommended to call [glFlush()]
      explicitly before calling this function. *)

  method get_display : unit -> display_t option
  (** Retrieves the [GdkDisplay] the [context] is created for *)

  method get_frame_region : unit -> Occairo.Region.region_t option
  (** Retrieves the region that is currently being repainted.

      After a call to [Gdk.DrawContext.begin_frame] this function will return a
      union of the region passed to that function and the area of the surface
      that the [context] determined needs to be repainted.

      If [context] is not in between calls to [Gdk.DrawContext.begin_frame] and
      [Gdk.DrawContext.end_frame], [None] will be returned. *)

  method get_surface : unit -> surface_t option
  (** Retrieves the surface that [context] is bound to. *)

  method is_in_frame : unit -> bool
  (** Returns [true] if [context] is in the process of drawing to its surface.

      This is the case between calls to [Gdk.DrawContext.begin_frame] and
      [Gdk.DrawContext.end_frame]. In this situation, drawing commands may be
      effecting the contents of the [context]'s surface. *)

  (** {2:conversions Conversions} *)

  method as_draw_context : Raw.Draw_context.t
end

(** {b The methods, signals and properties of a [Event].}

    Represents windowing system events.

    In GTK applications the events are handled automatically by toplevel widgets
    and passed on to the event controllers of appropriate widgets, so using
    [GdkEvent] and its related API is rarely needed.

    [GdkEvent] structs are immutable. *)
and event_t = object
  (** {2:methods Methods} *)

  method get_device : unit -> device_t option
  (** Returns the device of an event. *)

  method get_device_tool : unit -> Device_tool.device_tool_t option
  (** Returns a [GdkDeviceTool] representing the tool that caused the event.

      If the was not generated by a device that supports different tools (such
      as a tablet), this function will return [None].

      Note: the [GdkDeviceTool] will be constant during the application
      lifetime, if settings must be stored persistently across runs, see
      [Gdk.DeviceTool.get_serial]. *)

  method get_display : unit -> display_t option
  (** Retrieves the display associated to the [event]. *)

  method get_event_sequence : unit -> Raw.Event_sequence.t
  (** Returns the event sequence to which the event belongs.

      Related touch events are connected in a sequence. Other events typically
      don't have event sequence information. *)

  method get_event_type : unit -> Enums.eventtype
  (** Retrieves the type of the event. *)

  method get_modifier_state : unit -> Enums.modifiertype
  (** Returns the modifier state field of an event. *)

  method get_pointer_emulated : unit -> bool
  (** Returns whether this event is an 'emulated' pointer event.

      Emulated pointer events typically originate from a touch events. *)

  method get_seat : unit -> seat_t option
  (** Returns the seat that originated the event. *)

  method get_surface : unit -> surface_t option
  (** Extracts the surface associated with an event. *)

  method get_time : unit -> UInt32.t
  (** Returns the timestamp of [event].

      Not all events have timestamps. In that case, this function returns
      [GDK_CURRENT_TIME]. *)

  method ref : unit -> event_t
  (** Increase the ref count of [event]. *)

  method triggers_context_menu : unit -> bool
  (** Returns whether a [GdkEvent] should trigger a context menu, according to
      platform conventions.

      The right mouse button typically triggers context menus. On macOS,
      Control+left mouse button also triggers.

      This function should always be used instead of simply checking for

      {[
      event->button == GDK_BUTTON_SECONDARY
      ]} *)

  method unref : unit -> unit
  (** Decrease the ref count of [event].

      If the last reference is dropped, the structure is freed. *)

  (** {2:conversions Conversions} *)

  method as_event : Raw.Event.t
end

and gl_context_t = object
  (** {2:methods Methods} *)

  method get_allowed_apis : unit -> Enums.glapi
  (** Gets the allowed APIs set via gdk_gl_context_set_allowed_apis(). *)

  method get_api : unit -> Enums.glapi
  (** Gets the API currently in use.

      If the renderer has not been realized yet, 0 is returned. *)

  method get_debug_enabled : unit -> bool
  (** Retrieves whether the context is doing extra validations and runtime
      checking.

      See [Gdk.GLContext.set_debug_enabled]. *)

  method get_forward_compatible : unit -> bool
  (** Retrieves whether the context is forward-compatible.

      See [Gdk.GLContext.set_forward_compatible]. *)

  method get_shared_context : unit -> gl_context_t option
  (** Used to retrieves the [GdkGLContext] that this [context] share data with.

      As many contexts can share data now and no single shared context exists
      anymore, this function has been deprecated and now always returns [None].
  *)

  method get_use_es : unit -> bool
  (** Checks whether the [context] is using an OpenGL or OpenGL ES profile. *)

  method is_legacy : unit -> bool
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

  method is_shared : gl_context_t -> bool
  (** Checks if the two GL contexts can share resources.

      When they can, the texture IDs from [other] can be used in [self]. This is
      particularly useful when passing [GdkGLTexture] objects between different
      contexts.

      Contexts created for the same display with the same properties will always
      be compatible, even if they are created for different surfaces. For other
      contexts it depends on the GL backend.

      Both contexts must be realized for this check to succeed. If either one is
      not, this function will return [false]. *)

  method make_current : unit -> unit
  (** Makes the [context] the current one. *)

  method realize : unit -> (bool, GError.t) result
  (** Realizes the given [GdkGLContext].

      It is safe to call this function on a realized [GdkGLContext]. *)

  method set_allowed_apis : Enums.glapi -> unit
  (** Sets the allowed APIs. When gdk_gl_context_realize() is called, only the
      allowed APIs will be tried. If you set this to 0, realizing will always
      fail.

      If you set it on a realized context, the property will not have any
      effect. It is only relevant during gdk_gl_context_realize().

      By default, all APIs are allowed. *)

  method set_debug_enabled : bool -> unit
  (** Sets whether the [GdkGLContext] should perform extra validations and
      runtime checking.

      This is useful during development, but has additional overhead.

      The [GdkGLContext] must not be realized or made current prior to calling
      this function. *)

  method set_forward_compatible : bool -> unit
  (** Sets whether the [GdkGLContext] should be forward-compatible.

      Forward-compatible contexts must not support OpenGL functionality that has
      been marked as deprecated in the requested version; non-forward compatible
      contexts, on the other hand, must support both deprecated and non
      deprecated functionality.

      The [GdkGLContext] must not be realized or made current prior to calling
      this function. *)

  method set_required_version : int -> int -> unit
  (** Sets the major and minor version of OpenGL to request.

      Setting [major] and [minor] to zero will use the default values.

      Setting [major] and [minor] lower than the minimum versions required by
      GTK will result in the context choosing the minimum version.

      The [context] must not be realized or made current prior to calling this
      function. *)

  method set_use_es : int -> unit
  (** Requests that GDK create an OpenGL ES context instead of an OpenGL one.

      Not all platforms support OpenGL ES.

      The [context] must not have been realized.

      By default, GDK will attempt to automatically detect whether the
      underlying GL implementation is OpenGL or OpenGL ES once the [context] is
      realized.

      You should check the return value of [Gdk.GLContext.get_use_es] after
      calling [Gdk.GLContext.realize] to decide whether to use the OpenGL or
      OpenGL ES API, extensions, or shaders. *)

  (** {2:conversions Conversions} *)

  method as_gl_context : Raw.Gl_context.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [GLContext].}\n\n\
     Inherits from: \
     {{!Ocgdk.Draw_context.class-type-draw_context_t}Ocgdk.Draw_context}\n\n\
     Represents a platform-specific OpenGL draw context.\n\n\
     [GdkGLContext]s are created for a surface using\n\
     [Gdk.Surface.create_gl_context], and the context will match\n\
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
     A [GdkGLContext] is not realized until either [Gdk.GLContext.make_current]\n\
     or [Gdk.GLContext.realize] is called. It is possible to specify\n\
     details of the GL context like the OpenGL version to be used, or whether\n\
     the GL context should have extra state validation enabled after calling\n\
     [Gdk.Surface.create_gl_context] by calling [Gdk.GLContext.realize].\n\
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
     that is currently set by calling [Gdk.GLContext.clear_current]."]

(** {b The methods, signals and properties of a [Monitor].}

    Represents the individual outputs that are associated with a [GdkDisplay].

    [GdkDisplay] keeps a [GListModel] to enumerate and monitor monitors with
    [Gdk.Display.get_monitors]. You can use [Gdk.Display.get_monitor_at_surface]
    to find a particular monitor. *)
and monitor_t = object
  (** {2:signals Signals} *)

  method on_invalidate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the output represented by [monitor] gets disconnected. *)

  (** {2:methods Methods} *)

  method get_connector : unit -> string option
  [@@ocaml.doc
    "Gets the name of the monitor's connector, if available.\n\n\
     These are strings such as \"eDP-1\", or \"HDMI-2\". They depend\n\
     on software and hardware configuration, and should not be\n\
     relied on as stable identifiers of a specific monitor."]

  method get_description : unit -> string option
  (** Gets a string describing the monitor, if available.

      This can be used to identify a monitor in the UI. *)

  method get_display : unit -> display_t
  (** Gets the display that this monitor belongs to. *)

  method get_height_mm : unit -> int
  (** Gets the height in millimeters of the monitor. *)

  method get_manufacturer : unit -> string option
  (** Gets the name or PNP ID of the monitor's manufacturer.

      Note that this value might also vary depending on actual display backend.

      The PNP ID registry is located at
      {{:https://uefi.org/pnp_id_list}https://uefi.org/pnp_id_list}. *)

  method get_model : unit -> string option
  (** Gets the string identifying the monitor model, if available. *)

  method get_refresh_rate : unit -> int
  (** Gets the refresh rate of the monitor, if available.

      The value is in milli-Hertz, so a refresh rate of 60Hz is returned as
      60000. *)

  method get_scale : unit -> float
  (** Gets the internal scale factor that maps from monitor coordinates to
      device pixels.

      This can be used if you want to create pixel based data for a particular
      monitor, but most of the time you’re drawing to a surface where it is
      better to use [Gdk.Surface.get_scale] instead. *)

  method get_scale_factor : unit -> int
  (** Gets the internal scale factor that maps from monitor coordinates to
      device pixels.

      On traditional systems this is 1, but on very high density outputs it can
      be a higher value (often 2).

      This can be used if you want to create pixel based data for a particular
      monitor, but most of the time you’re drawing to a surface where it is
      better to use [Gdk.Surface.get_scale_factor] instead. *)

  method get_subpixel_layout : unit -> Enums.subpixellayout
  (** Gets information about the layout of red, green and blue primaries for
      pixels. *)

  method get_width_mm : unit -> int
  (** Gets the width in millimeters of the monitor. *)

  method is_valid : unit -> bool
  (** Returns [true] if the [monitor] object corresponds to a physical monitor.

      The [monitor] becomes invalid when the physical monitor is unplugged or
      removed. *)

  (** {2:conversions Conversions} *)

  method as_monitor : Raw.Monitor.t
end

(** {b The methods, signals and properties of a [Seat].}

    Represents a collection of input devices that belong to a user. *)
and seat_t = object
  (** {2:signals Signals} *)

  method on_device_added :
    ?after:bool ->
    callback:(device:device_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a new input device is related to this seat. *)

  method on_device_removed :
    ?after:bool ->
    callback:(device:device_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when an input device is removed (e.g. unplugged). *)

  method on_tool_added :
    ?after:bool ->
    callback:(tool:Device_tool.device_tool_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever a new tool is made known to the seat.

      The tool may later be assigned to a device (i.e. on proximity with a
      tablet). The device will emit the [Gdk.Device::tool-changed] signal
      accordingly.

      A same tool may be used by several devices. *)

  method on_tool_removed :
    ?after:bool ->
    callback:(tool:Device_tool.device_tool_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted whenever a tool is no longer known to this [seat]. *)

  (** {2:methods Methods} *)

  method get_capabilities : unit -> Enums.seatcapabilities
  (** Returns the capabilities this [GdkSeat] currently has. *)

  method get_devices : Enums.seatcapabilities -> device_t list
  (** Returns the devices that match the given capabilities. *)

  method get_display : unit -> display_t
  (** Returns the [GdkDisplay] this seat belongs to. *)

  method get_keyboard : unit -> device_t option
  (** Returns the device that routes keyboard events. *)

  method get_pointer : unit -> device_t option
  (** Returns the device that routes pointer events. *)

  method get_tools : unit -> Device_tool.device_tool_t list
  (** Returns all [GdkDeviceTools] that are known to the application. *)

  (** {2:conversions Conversions} *)

  method as_seat : Raw.Seat.t
end

(** {b The methods, signals and properties of a [Surface].}

    Represents a rectangular region on the screen.

    It’s a low-level object, used to implement high-level objects such as
    GtkWindow.

    The surfaces you see in practice are either [Gdk.Toplevel] or [Gdk.Popup],
    and those interfaces provide much of the required API to interact with these
    surfaces. Other, more specialized surface types exist, but you will rarely
    interact with them directly. *)
and surface_t = object
  (** {2:signals Signals} *)

  method on_enter_monitor :
    ?after:bool ->
    callback:(monitor:monitor_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when [surface] starts being present on the monitor. *)

  method on_event :
    ?after:bool ->
    callback:(event:event_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when GDK receives an input event for [surface]. *)

  method on_layout :
    ?after:bool ->
    callback:(width:int -> height:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the size of [surface] is changed, or when relayout should be
      performed.

      Surface size is reported in ”application pixels”, not ”device pixels” (see
      gdk_surface_get_scale_factor()). *)

  method on_leave_monitor :
    ?after:bool ->
    callback:(monitor:monitor_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when [surface] stops being present on the monitor. *)

  (** {2:methods Methods} *)

  method beep : unit -> unit
  (** Emits a short beep associated to [surface].

      If the display of [surface] does not support per-surface beeps, emits a
      short beep on the display just as [Gdk.Display.beep]. *)

  method create_cairo_context : unit -> cairo_context_t
  (** Creates a new [GdkCairoContext] for rendering on [surface]. *)

  method create_gl_context : unit -> (gl_context_t, GError.t) result
  (** Creates a new [GdkGLContext] for the [GdkSurface].

      The context is disconnected from any particular surface or surface. If the
      creation of the [GdkGLContext] failed, [error] will be set. Before using
      the returned [GdkGLContext], you will need to call
      [Gdk.GLContext.make_current] or [Gdk.GLContext.realize]. *)

  method create_similar_surface :
    Occairo.Enums.content -> int -> int -> Occairo.Surface.surface_t
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

  method create_vulkan_context : unit -> (vulkan_context_t, GError.t) result
  (** Sets an error and returns [None]. *)

  method destroy : unit -> unit
  (** Destroys the window system resources associated with [surface] and
      decrements [surface]'s reference count.

      The window system resources for all children of [surface] are also
      destroyed, but the children’s reference counts are not decremented.

      Note that a surface will not be destroyed automatically when its reference
      count reaches zero. You must call this function yourself before that
      happens. *)

  method get_cursor : unit -> Cursor.cursor_t option
  (** Retrieves a [GdkCursor] pointer for the cursor currently set on the
      [GdkSurface].

      If the return value is [None] then there is no custom cursor set on the
      surface, and it is using the cursor for its parent surface.

      Use [Gdk.Surface.set_cursor] to unset the cursor of the surface. *)

  method get_device_cursor : device_t -> Cursor.cursor_t option
  (** Retrieves a [GdkCursor] pointer for the [device] currently set on the
      specified [GdkSurface].

      If the return value is [None] then there is no custom cursor set on the
      specified surface, and it is using the cursor for its parent surface.

      Use [Gdk.Surface.set_cursor] to unset the cursor of the surface. *)

  method get_display : unit -> display_t
  (** Gets the [GdkDisplay] associated with a [GdkSurface]. *)

  method get_frame_clock : unit -> Frame_clock.frame_clock_t
  (** Gets the frame clock for the surface.

      The frame clock for a surface never changes unless the surface is
      reparented to a new toplevel surface. *)

  method get_height : unit -> int
  (** Returns the height of the given [surface].

      Surface size is reported in ”application pixels”, not ”device pixels” (see
      [Gdk.Surface.get_scale_factor]). *)

  method get_mapped : unit -> bool
  (** Checks whether the surface has been mapped.

      A surface is mapped with [Gdk.Toplevel.present] or [Gdk.Popup.present]. *)

  method get_scale : unit -> float
  (** Returns the internal scale that maps from surface coordinates to the
      actual device pixels.

      When the scale is bigger than 1, the windowing system prefers to get
      buffers with a resolution that is bigger than the surface size (e.g. to
      show the surface on a high-resolution display, or in a magnifier).

      Compare with [Gdk.Surface.get_scale_factor], which returns the next larger
      integer.

      The scale may change during the lifetime of the surface. *)

  method get_scale_factor : unit -> int
  (** Returns the internal scale factor that maps from surface coordinates to
      the actual device pixels.

      On traditional systems this is 1, but on very high density outputs this
      can be a higher value (often 2). A higher value means that drawing is
      automatically scaled up to a higher resolution, so any code doing drawing
      will automatically look nicer. However, if you are supplying pixel-based
      data the scale value can be used to determine whether to use a pixel
      resource with higher resolution data.

      The scale factor may change during the lifetime of the surface. *)

  method get_width : unit -> int
  (** Returns the width of the given [surface].

      Surface size is reported in ”application pixels”, not ”device pixels” (see
      [Gdk.Surface.get_scale_factor]). *)

  method hide : unit -> unit
  (** Hide the surface.

      For toplevel surfaces, withdraws them, so they will no longer be known to
      the window manager; for all surfaces, unmaps them, so they won’t be
      displayed. Normally done automatically as part of gtk_widget_hide(). *)

  method is_destroyed : unit -> bool
  (** Check to see if a surface is destroyed. *)

  method queue_render : unit -> unit
  (** Forces a [Gdk.Surface::render] signal emission for [surface] to be
      scheduled.

      This function is useful for implementations that track invalid regions on
      their own. *)

  method request_layout : unit -> unit
  (** Request a layout phase from the surface's frame clock.

      See [Gdk.FrameClock.request_phase]. *)

  method set_cursor : Cursor.cursor_t option -> unit
  (** Sets the default mouse pointer for a [GdkSurface].

      Passing [None] for the [cursor] argument means that [surface] will use the
      cursor of its parent surface. Most surfaces should use this default. Note
      that [cursor] must be for the same display as [surface].

      Use [Gdk.Cursor.new_from_name] or [Gdk.Cursor.new_from_texture] to create
      the cursor. To make the cursor invisible, use [GDK_BLANK_CURSOR]. *)

  method set_device_cursor : device_t -> Cursor.cursor_t -> unit
  (** Sets a specific [GdkCursor] for a given device when it gets inside
      [surface].

      Passing [None] for the [cursor] argument means that [surface] will use the
      cursor of its parent surface. Most surfaces should use this default.

      Use [Gdk.Cursor.new_from_name] or [Gdk.Cursor.new_from_texture] to create
      the cursor. To make the cursor invisible, use [GDK_BLANK_CURSOR]. *)

  method set_input_region : Occairo.Region.region_t option -> unit
  (** Apply the region to the surface for the purpose of event handling.

      Mouse events which happen while the pointer position corresponds to an
      unset bit in the mask will be passed on the surface below [surface].

      An input region is typically used with RGBA surfaces. The alpha channel of
      the surface defines which pixels are invisible and allows for nicely
      antialiased borders, and the input region controls where the surface is
      “clickable”.

      Use [Gdk.Display.supports_input_shapes] to find out if a particular
      backend supports input regions. *)

  method set_opaque_region : Occairo.Region.region_t option -> unit
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

  (** {2:conversions Conversions} *)

  method as_surface : Raw.Surface.t
end

(** {b The methods, signals and properties of a [VulkanContext].}

    Inherits from:
    {{!Ocgdk.Draw_context.class-type-draw_context_t}Ocgdk.Draw_context}

    Represents the platform-specific Vulkan draw context.

    [GdkVulkanContext]s are created for a surface using
    [Gdk.Surface.create_vulkan_context], and the context will match the
    characteristics of the surface.

    Support for [GdkVulkanContext] is platform-specific and context creation can
    fail, returning [None] context. *)
and vulkan_context_t = object
  (** {2:signals Signals} *)

  method on_images_updated :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the images managed by this context have changed.

      Usually this means that the swapchain had to be recreated, for example in
      response to a change of the surface size. *)

  (** {2:conversions Conversions} *)

  method as_vulkan_context : Raw.Vulkan_context.t
end

(** Wraps a raw handle of {!Ocgdk.Raw.App_launch_context.t}. *)
class app_launch_context : Raw.App_launch_context.t -> app_launch_context_t
(** Wraps a raw handle of {!Ocgdk.Raw.Cairo_context.t}. *)

and cairo_context : Raw.Cairo_context.t -> cairo_context_t
(** Wraps a raw handle of {!Ocgdk.Raw.Clipboard.t}. *)

and clipboard : Raw.Clipboard.t -> clipboard_t
(** Wraps a raw handle of {!Ocgdk.Raw.Device.t}. *)

and device : Raw.Device.t -> device_t
(** Wraps a raw handle of {!Ocgdk.Raw.Display.t}. *)

and display : Raw.Display.t -> display_t
(** Wraps a raw handle of {!Ocgdk.Raw.Draw_context.t}. *)

and draw_context : Raw.Draw_context.t -> draw_context_t
(** Wraps a raw handle of {!Ocgdk.Raw.Event.t}. *)

and event : Raw.Event.t -> event_t
(** Wraps a raw handle of {!Ocgdk.Raw.Gl_context.t}. *)

and gl_context : Raw.Gl_context.t -> gl_context_t
(** Wraps a raw handle of {!Ocgdk.Raw.Monitor.t}. *)

and monitor : Raw.Monitor.t -> monitor_t
(** Wraps a raw handle of {!Ocgdk.Raw.Seat.t}. *)

and seat : Raw.Seat.t -> seat_t
(** Wraps a raw handle of {!Ocgdk.Raw.Surface.t}. *)

and surface : Raw.Surface.t -> surface_t
(** Wraps a raw handle of {!Ocgdk.Raw.Vulkan_context.t}. *)

and vulkan_context : Raw.Vulkan_context.t -> vulkan_context_t

val new_popup : surface_t -> bool -> surface_t
(** Create a new popup surface.

    The surface will be attached to [parent] and can be positioned relative to
    it using [Gdk.Popup.present]. *)

val new_toplevel : display_t -> surface_t
(** Creates a new toplevel surface. *)
