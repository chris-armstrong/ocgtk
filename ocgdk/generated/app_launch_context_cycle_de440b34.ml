(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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

and cairo_context_t = object
  (** {2:methods Methods} *)

  method cairo_create : unit -> Occairo.Context.context_t option
  (** Retrieves a Cairo context to be used to draw on the [GdkSurface] of
      [context].

      A call to [Gdk.DrawContext.begin_frame] with this [context] must have been
      done or this function will return [NULL].

      The returned context is guaranteed to be valid until
      [Gdk.DrawContext.end_frame] is called. *)

  (** {2:conversions Conversions} *)

  method as_cairo_context : Raw.Cairo_context.t
end

and clipboard_t = object
  (** {2:signals Signals} *)

  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted when the clipboard changes ownership. *)

  (** {2:methods Methods} *)

  method get_content : unit -> Content_provider.content_provider_t option
  (** Returns the [GdkContentProvider] currently set on [clipboard].

      If the [clipboard] is empty or its contents are not owned by the current
      process, [NULL] will be returned. *)

  method get_display : unit -> display_t
  (** Gets the [GdkDisplay] that the clipboard was created for. *)

  method get_formats : unit -> Raw.Content_formats.t
  (** Gets the formats that the clipboard can provide its current contents in.
  *)

  method is_local : unit -> bool
  (** Returns if the clipboard is local.

      A clipboard is considered local if it was last claimed by the running
      application.

      Note that [Gdk.Clipboard.get_content] may return [NULL] even on a local
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

      In the rare case of a failure, this function will return [FALSE]. The
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
  (** Returns [TRUE] if there is an ongoing grab on [device] for [display]. *)

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
      return [NULL]. *)

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
  (** Gets the startup notification ID for a Wayland display, or [NULL] if no ID
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

      On modern displays, this value is always [TRUE]. *)

  method is_rgba : unit -> bool
  (** Returns whether surfaces on this [display] are created with an alpha
      channel.

      Even if a [TRUE] is returned, it is possible that the surface’s alpha
      channel won’t be honored when displaying the surface on the screen: in
      particular, for X an appropriate windowing manager and compositing manager
      must be running to provide appropriate display. Use
      [Gdk.Display.is_composited] to check if that is the case.

      On modern displays, this value is always [TRUE]. *)

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
      and this function returns [FALSE].

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
  (** Returns [TRUE] if the display supports input shapes.

      This means that [Gdk.Surface.set_input_region] can be used to modify the
      input shape of surfaces on [display].

      On modern displays, this value is always [TRUE]. *)

  method supports_shadow_width : unit -> bool
  (** Returns whether it's possible for a surface to draw outside of the window
      area.

      If [TRUE] is returned the application decides if it wants to draw shadows.
      If [FALSE] is returned, the compositor decides if it wants to draw
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
      [Gdk.DrawContext.end_frame], [NULL] will be returned. *)

  method get_surface : unit -> surface_t option
  (** Retrieves the surface that [context] is bound to. *)

  method is_in_frame : unit -> bool
  (** Returns [TRUE] if [context] is in the process of drawing to its surface.

      This is the case between calls to [Gdk.DrawContext.begin_frame] and
      [Gdk.DrawContext.end_frame]. In this situation, drawing commands may be
      effecting the contents of the [context]'s surface. *)

  (** {2:conversions Conversions} *)

  method as_draw_context : Raw.Draw_context.t
end

and event_t = object
  (** {2:methods Methods} *)

  method get_device : unit -> device_t option
  (** Returns the device of an event. *)

  method get_device_tool : unit -> Device_tool.device_tool_t option
  (** Returns a [GdkDeviceTool] representing the tool that caused the event.

      If the was not generated by a device that supports different tools (such
      as a tablet), this function will return [NULL].

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
      anymore, this function has been deprecated and now always returns [NULL].
  *)

  method get_use_es : unit -> bool
  (** Checks whether the [context] is using an OpenGL or OpenGL ES profile. *)

  method is_legacy : unit -> bool
  (** Whether the [GdkGLContext] is in legacy mode or not.

      The [GdkGLContext] must be realized before calling this function.

      When realizing a GL context, GDK will try to use the OpenGL 3.2 core
      profile; this profile removes all the OpenGL API that was deprecated prior
      to the 3.2 version of the specification. If the realization is successful,
      this function will return [FALSE].

      If the underlying OpenGL implementation does not support core profiles,
      GDK will fall back to a pre-3.2 compatibility profile, and this function
      will return [TRUE].

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
      not, this function will return [FALSE]. *)

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
  (** Returns [TRUE] if the [monitor] object corresponds to a physical monitor.

      The [monitor] becomes invalid when the physical monitor is unplugged or
      removed. *)

  (** {2:conversions Conversions} *)

  method as_monitor : Raw.Monitor.t
end

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
  (** Sets an error and returns [NULL]. *)

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

      If the return value is [NULL] then there is no custom cursor set on the
      surface, and it is using the cursor for its parent surface.

      Use [Gdk.Surface.set_cursor] to unset the cursor of the surface. *)

  method get_device_cursor : device_t -> Cursor.cursor_t option
  (** Retrieves a [GdkCursor] pointer for the [device] currently set on the
      specified [GdkSurface].

      If the return value is [NULL] then there is no custom cursor set on the
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

      Passing [NULL] for the [cursor] argument means that [surface] will use the
      cursor of its parent surface. Most surfaces should use this default. Note
      that [cursor] must be for the same display as [surface].

      Use [Gdk.Cursor.new_from_name] or [Gdk.Cursor.new_from_texture] to create
      the cursor. To make the cursor invisible, use [GDK_BLANK_CURSOR]. *)

  method set_device_cursor : device_t -> Cursor.cursor_t -> unit
  (** Sets a specific [GdkCursor] for a given device when it gets inside
      [surface].

      Passing [NULL] for the [cursor] argument means that [surface] will use the
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

class app_launch_context (obj : Raw.App_launch_context.t) : app_launch_context_t
  =
  object (self)
    inherit
      Ocgio.App_launch_context.app_launch_context
        (obj :> Ocgio.Raw.App_launch_context.t)

    method set_desktop : int -> unit =
      fun desktop -> Raw.App_launch_context.set_desktop obj desktop

    method set_icon : Ocgio.Icon.icon_t option -> unit =
      fun icon ->
        let icon = Option.map (fun c -> c#as_icon) icon in
        Raw.App_launch_context.set_icon obj icon

    method set_icon_name : string option -> unit =
      fun icon_name -> Raw.App_launch_context.set_icon_name obj icon_name

    method set_timestamp : UInt32.t -> unit =
      fun timestamp -> Raw.App_launch_context.set_timestamp obj timestamp

    method display = new display (Raw.App_launch_context.get_display obj)
  end

and cairo_context (obj : Raw.Cairo_context.t) : cairo_context_t =
  object (self)
    method cairo_create : unit -> Occairo.Context.context_t option =
      fun () ->
        Option.map
          (fun ret -> new Occairo.Context.context ret)
          (Raw.Cairo_context.cairo_create obj)

    method as_cairo_context = obj
  end

and clipboard (obj : Raw.Clipboard.t) : clipboard_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.Clipboard.on_changed ~after self#as_clipboard ~callback

    method get_content : unit -> Content_provider.content_provider_t option =
      fun () ->
        Option.map
          (fun ret -> new Content_provider.content_provider ret)
          (Raw.Clipboard.get_content obj)

    method get_display : unit -> display_t =
      fun () -> new display (Raw.Clipboard.get_display obj)

    method get_formats : unit -> Raw.Content_formats.t =
      fun () -> Raw.Clipboard.get_formats obj

    method is_local : unit -> bool = fun () -> Raw.Clipboard.is_local obj

    method read_text_finish :
        Ocgio.Async_result.async_result_t -> (string option, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Clipboard.read_text_finish obj result

    method read_texture_finish :
        Ocgio.Async_result.async_result_t ->
        (Texture.texture_t option, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> Option.map (fun ret -> new Texture.texture ret) ret)
          (Raw.Clipboard.read_texture_finish obj result)

    method read_value_finish :
        Ocgio.Async_result.async_result_t -> (Gobject.Value.t, GError.t) result
        =
      fun result ->
        let result = result#as_async_result in
        Raw.Clipboard.read_value_finish obj result

    method set_content : Content_provider.content_provider_t option -> bool =
      fun provider ->
        let provider = Option.map (fun c -> c#as_content_provider) provider in
        Raw.Clipboard.set_content obj provider

    method set_value : Gobject.Value.t -> unit =
      fun value -> Raw.Clipboard.set_value obj value

    method store_finish :
        Ocgio.Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Clipboard.store_finish obj result

    method as_clipboard = obj
  end

and device (obj : Raw.Device.t) : device_t =
  object (self)
    method on_changed ?(after = false) ~callback () =
      Raw.Device.on_changed ~after self#as_device ~callback

    method on_tool_changed ?(after = false) ~callback () =
      Raw.Device.on_tool_changed ~after self#as_device ~callback:(fun ~tool ->
          callback ~tool:(new Device_tool.device_tool tool))

    method get_active_layout_index : unit -> int =
      fun () -> Raw.Device.get_active_layout_index obj

    method get_caps_lock_state : unit -> bool =
      fun () -> Raw.Device.get_caps_lock_state obj

    method get_device_tool : unit -> Device_tool.device_tool_t option =
      fun () ->
        Option.map
          (fun ret -> new Device_tool.device_tool ret)
          (Raw.Device.get_device_tool obj)

    method get_direction : unit -> Ocpango.Enums.direction =
      fun () -> Raw.Device.get_direction obj

    method get_display : unit -> display_t =
      fun () -> new display (Raw.Device.get_display obj)

    method get_has_cursor : unit -> bool =
      fun () -> Raw.Device.get_has_cursor obj

    method get_layout_names : unit -> string array option =
      fun () -> Raw.Device.get_layout_names obj

    method get_modifier_state : unit -> Enums.modifiertype =
      fun () -> Raw.Device.get_modifier_state obj

    method get_name : unit -> string = fun () -> Raw.Device.get_name obj

    method get_num_lock_state : unit -> bool =
      fun () -> Raw.Device.get_num_lock_state obj

    method get_num_touches : unit -> int =
      fun () -> Raw.Device.get_num_touches obj

    method get_product_id : unit -> string option =
      fun () -> Raw.Device.get_product_id obj

    method get_scroll_lock_state : unit -> bool =
      fun () -> Raw.Device.get_scroll_lock_state obj

    method get_seat : unit -> seat_t =
      fun () -> new seat (Raw.Device.get_seat obj)

    method get_source : unit -> Enums.inputsource =
      fun () -> Raw.Device.get_source obj

    method get_timestamp : unit -> UInt32.t =
      fun () -> Raw.Device.get_timestamp obj

    method get_vendor_id : unit -> string option =
      fun () -> Raw.Device.get_vendor_id obj

    method has_bidi_layouts : unit -> bool =
      fun () -> Raw.Device.has_bidi_layouts obj

    method n_axes = Raw.Device.get_n_axes obj
    method as_device = obj
  end

and display (obj : Raw.Display.t) : display_t =
  object (self)
    method on_closed ?(after = false) ~callback () =
      Raw.Display.on_closed ~after self#as_display ~callback

    method on_opened ?(after = false) ~callback () =
      Raw.Display.on_opened ~after self#as_display ~callback

    method on_seat_added ?(after = false) ~callback () =
      Raw.Display.on_seat_added ~after self#as_display ~callback:(fun ~seat ->
          callback ~seat:(new seat seat))

    method on_seat_removed ?(after = false) ~callback () =
      Raw.Display.on_seat_removed ~after self#as_display ~callback:(fun ~seat ->
          callback ~seat:(new seat seat))

    method on_setting_changed ?(after = false) ~callback () =
      Raw.Display.on_setting_changed ~after self#as_display ~callback

    method beep : unit -> unit = fun () -> Raw.Display.beep obj
    method close : unit -> unit = fun () -> Raw.Display.close obj

    method create_gl_context : unit -> (gl_context_t, GError.t) result =
      fun () ->
        Result.map
          (fun ret -> new gl_context ret)
          (Raw.Display.create_gl_context obj)

    method device_is_grabbed : device_t -> bool =
      fun device ->
        let device = device#as_device in
        Raw.Display.device_is_grabbed obj device

    method flush : unit -> unit = fun () -> Raw.Display.flush obj

    method get_app_launch_context : unit -> app_launch_context_t =
      fun () -> new app_launch_context (Raw.Display.get_app_launch_context obj)

    method get_clipboard : unit -> clipboard_t =
      fun () -> new clipboard (Raw.Display.get_clipboard obj)

    method get_default_seat : unit -> seat_t option =
      fun () ->
        Option.map (fun ret -> new seat ret) (Raw.Display.get_default_seat obj)

    method get_dmabuf_formats : unit -> Raw.Dmabuf_formats.t =
      fun () -> Raw.Display.get_dmabuf_formats obj

    method get_monitor_at_surface : surface_t -> monitor_t option =
      fun surface ->
        let surface = surface#as_surface in
        Option.map
          (fun ret -> new monitor ret)
          (Raw.Display.get_monitor_at_surface obj surface)

    method get_monitors : unit -> Ocgio.List_model.list_model_t =
      fun () -> new Ocgio.List_model.list_model (Raw.Display.get_monitors obj)

    method get_name : unit -> string = fun () -> Raw.Display.get_name obj

    method get_primary_clipboard : unit -> clipboard_t =
      fun () -> new clipboard (Raw.Display.get_primary_clipboard obj)

    method get_setting : string -> Gobject.Value.t -> bool =
      fun name value -> Raw.Display.get_setting obj name value

    method get_startup_notification_id : unit -> string option =
      fun () -> Raw.Display.get_startup_notification_id obj

    method is_closed : unit -> bool = fun () -> Raw.Display.is_closed obj

    method is_composited : unit -> bool =
      fun () -> Raw.Display.is_composited obj

    method is_rgba : unit -> bool = fun () -> Raw.Display.is_rgba obj

    method list_seats : unit -> seat_t list =
      fun () ->
        (List.map (fun ret -> new seat ret)) (Raw.Display.list_seats obj)

    method notify_startup_complete : string -> unit =
      fun startup_id -> Raw.Display.notify_startup_complete obj startup_id

    method prepare_gl : unit -> (bool, GError.t) result =
      fun () -> Raw.Display.prepare_gl obj

    method put_event : event_t -> unit =
      fun event ->
        let event = event#as_event in
        Raw.Display.put_event obj event

    method supports_input_shapes : unit -> bool =
      fun () -> Raw.Display.supports_input_shapes obj

    method supports_shadow_width : unit -> bool =
      fun () -> Raw.Display.supports_shadow_width obj

    method sync : unit -> unit = fun () -> Raw.Display.sync obj
    method as_display = obj
  end

and draw_context (obj : Raw.Draw_context.t) : draw_context_t =
  object (self)
    method begin_frame : Occairo.Region.region_t -> unit =
      fun region ->
        let region = region#as_region in
        Raw.Draw_context.begin_frame obj region

    method end_frame : unit -> unit = fun () -> Raw.Draw_context.end_frame obj

    method get_display : unit -> display_t option =
      fun () ->
        Option.map
          (fun ret -> new display ret)
          (Raw.Draw_context.get_display obj)

    method get_frame_region : unit -> Occairo.Region.region_t option =
      fun () ->
        Option.map
          (fun ret -> new Occairo.Region.region ret)
          (Raw.Draw_context.get_frame_region obj)

    method get_surface : unit -> surface_t option =
      fun () ->
        Option.map
          (fun ret -> new surface ret)
          (Raw.Draw_context.get_surface obj)

    method is_in_frame : unit -> bool =
      fun () -> Raw.Draw_context.is_in_frame obj

    method as_draw_context = obj
  end

and event (obj : Raw.Event.t) : event_t =
  object (self)
    method get_device : unit -> device_t option =
      fun () ->
        Option.map (fun ret -> new device ret) (Raw.Event.get_device obj)

    method get_device_tool : unit -> Device_tool.device_tool_t option =
      fun () ->
        Option.map
          (fun ret -> new Device_tool.device_tool ret)
          (Raw.Event.get_device_tool obj)

    method get_display : unit -> display_t option =
      fun () ->
        Option.map (fun ret -> new display ret) (Raw.Event.get_display obj)

    method get_event_sequence : unit -> Raw.Event_sequence.t =
      fun () -> Raw.Event.get_event_sequence obj

    method get_event_type : unit -> Enums.eventtype =
      fun () -> Raw.Event.get_event_type obj

    method get_modifier_state : unit -> Enums.modifiertype =
      fun () -> Raw.Event.get_modifier_state obj

    method get_pointer_emulated : unit -> bool =
      fun () -> Raw.Event.get_pointer_emulated obj

    method get_seat : unit -> seat_t option =
      fun () -> Option.map (fun ret -> new seat ret) (Raw.Event.get_seat obj)

    method get_surface : unit -> surface_t option =
      fun () ->
        Option.map (fun ret -> new surface ret) (Raw.Event.get_surface obj)

    method get_time : unit -> UInt32.t = fun () -> Raw.Event.get_time obj
    method ref : unit -> event_t = fun () -> new event (Raw.Event.ref obj)

    method triggers_context_menu : unit -> bool =
      fun () -> Raw.Event.triggers_context_menu obj

    method unref : unit -> unit = fun () -> Raw.Event.unref obj
    method as_event = obj
  end

and gl_context (obj : Raw.Gl_context.t) : gl_context_t =
  object (self)
    method get_allowed_apis : unit -> Enums.glapi =
      fun () -> Raw.Gl_context.get_allowed_apis obj

    method get_api : unit -> Enums.glapi = fun () -> Raw.Gl_context.get_api obj

    method get_debug_enabled : unit -> bool =
      fun () -> Raw.Gl_context.get_debug_enabled obj

    method get_forward_compatible : unit -> bool =
      fun () -> Raw.Gl_context.get_forward_compatible obj

    method get_shared_context : unit -> gl_context_t option =
      fun () ->
        Option.map
          (fun ret -> new gl_context ret)
          (Raw.Gl_context.get_shared_context obj)

    method get_use_es : unit -> bool = fun () -> Raw.Gl_context.get_use_es obj
    method is_legacy : unit -> bool = fun () -> Raw.Gl_context.is_legacy obj

    method is_shared : gl_context_t -> bool =
      fun other ->
        let other = other#as_gl_context in
        Raw.Gl_context.is_shared obj other

    method make_current : unit -> unit =
      fun () -> Raw.Gl_context.make_current obj

    method realize : unit -> (bool, GError.t) result =
      fun () -> Raw.Gl_context.realize obj

    method set_allowed_apis : Enums.glapi -> unit =
      fun apis -> Raw.Gl_context.set_allowed_apis obj apis

    method set_debug_enabled : bool -> unit =
      fun enabled -> Raw.Gl_context.set_debug_enabled obj enabled

    method set_forward_compatible : bool -> unit =
      fun compatible -> Raw.Gl_context.set_forward_compatible obj compatible

    method set_required_version : int -> int -> unit =
      fun major minor -> Raw.Gl_context.set_required_version obj major minor

    method set_use_es : int -> unit =
      fun use_es -> Raw.Gl_context.set_use_es obj use_es

    method as_gl_context = obj
  end

and monitor (obj : Raw.Monitor.t) : monitor_t =
  object (self)
    method on_invalidate ?(after = false) ~callback () =
      Raw.Monitor.on_invalidate ~after self#as_monitor ~callback

    method get_connector : unit -> string option =
      fun () -> Raw.Monitor.get_connector obj

    method get_description : unit -> string option =
      fun () -> Raw.Monitor.get_description obj

    method get_display : unit -> display_t =
      fun () -> new display (Raw.Monitor.get_display obj)

    method get_height_mm : unit -> int = fun () -> Raw.Monitor.get_height_mm obj

    method get_manufacturer : unit -> string option =
      fun () -> Raw.Monitor.get_manufacturer obj

    method get_model : unit -> string option =
      fun () -> Raw.Monitor.get_model obj

    method get_refresh_rate : unit -> int =
      fun () -> Raw.Monitor.get_refresh_rate obj

    method get_scale : unit -> float = fun () -> Raw.Monitor.get_scale obj

    method get_scale_factor : unit -> int =
      fun () -> Raw.Monitor.get_scale_factor obj

    method get_subpixel_layout : unit -> Enums.subpixellayout =
      fun () -> Raw.Monitor.get_subpixel_layout obj

    method get_width_mm : unit -> int = fun () -> Raw.Monitor.get_width_mm obj
    method is_valid : unit -> bool = fun () -> Raw.Monitor.is_valid obj
    method as_monitor = obj
  end

and seat (obj : Raw.Seat.t) : seat_t =
  object (self)
    method on_device_added ?(after = false) ~callback () =
      Raw.Seat.on_device_added ~after self#as_seat ~callback:(fun ~device ->
          callback ~device:(new device device))

    method on_device_removed ?(after = false) ~callback () =
      Raw.Seat.on_device_removed ~after self#as_seat ~callback:(fun ~device ->
          callback ~device:(new device device))

    method on_tool_added ?(after = false) ~callback () =
      Raw.Seat.on_tool_added ~after self#as_seat ~callback:(fun ~tool ->
          callback ~tool:(new Device_tool.device_tool tool))

    method on_tool_removed ?(after = false) ~callback () =
      Raw.Seat.on_tool_removed ~after self#as_seat ~callback:(fun ~tool ->
          callback ~tool:(new Device_tool.device_tool tool))

    method get_capabilities : unit -> Enums.seatcapabilities =
      fun () -> Raw.Seat.get_capabilities obj

    method get_devices : Enums.seatcapabilities -> device_t list =
      fun capabilities ->
        (List.map (fun ret -> new device ret))
          (Raw.Seat.get_devices obj capabilities)

    method get_display : unit -> display_t =
      fun () -> new display (Raw.Seat.get_display obj)

    method get_keyboard : unit -> device_t option =
      fun () ->
        Option.map (fun ret -> new device ret) (Raw.Seat.get_keyboard obj)

    method get_pointer : unit -> device_t option =
      fun () ->
        Option.map (fun ret -> new device ret) (Raw.Seat.get_pointer obj)

    method get_tools : unit -> Device_tool.device_tool_t list =
      fun () ->
        (List.map (fun ret -> new Device_tool.device_tool ret))
          (Raw.Seat.get_tools obj)

    method as_seat = obj
  end

and surface (obj : Raw.Surface.t) : surface_t =
  object (self)
    method on_enter_monitor ?(after = false) ~callback () =
      Raw.Surface.on_enter_monitor ~after self#as_surface
        ~callback:(fun ~monitor -> callback ~monitor:(new monitor monitor))

    method on_event ?(after = false) ~callback () =
      Raw.Surface.on_event ~after self#as_surface ~callback:(fun ~event ->
          callback ~event:(new event event))

    method on_layout ?(after = false) ~callback () =
      Raw.Surface.on_layout ~after self#as_surface ~callback

    method on_leave_monitor ?(after = false) ~callback () =
      Raw.Surface.on_leave_monitor ~after self#as_surface
        ~callback:(fun ~monitor -> callback ~monitor:(new monitor monitor))

    method beep : unit -> unit = fun () -> Raw.Surface.beep obj

    method create_cairo_context : unit -> cairo_context_t =
      fun () -> new cairo_context (Raw.Surface.create_cairo_context obj)

    method create_gl_context : unit -> (gl_context_t, GError.t) result =
      fun () ->
        Result.map
          (fun ret -> new gl_context ret)
          (Raw.Surface.create_gl_context obj)

    method create_similar_surface :
        Occairo.Enums.content -> int -> int -> Occairo.Surface.surface_t =
      fun content width height ->
        new Occairo.Surface.surface
          (Raw.Surface.create_similar_surface obj content width height)

    method create_vulkan_context : unit -> (vulkan_context_t, GError.t) result =
      fun () ->
        Result.map
          (fun ret -> new vulkan_context ret)
          (Raw.Surface.create_vulkan_context obj)

    method destroy : unit -> unit = fun () -> Raw.Surface.destroy obj

    method get_cursor : unit -> Cursor.cursor_t option =
      fun () ->
        Option.map
          (fun ret -> new Cursor.cursor ret)
          (Raw.Surface.get_cursor obj)

    method get_device_cursor : device_t -> Cursor.cursor_t option =
      fun device ->
        let device = device#as_device in
        Option.map
          (fun ret -> new Cursor.cursor ret)
          (Raw.Surface.get_device_cursor obj device)

    method get_display : unit -> display_t =
      fun () -> new display (Raw.Surface.get_display obj)

    method get_frame_clock : unit -> Frame_clock.frame_clock_t =
      fun () -> new Frame_clock.frame_clock (Raw.Surface.get_frame_clock obj)

    method get_height : unit -> int = fun () -> Raw.Surface.get_height obj
    method get_mapped : unit -> bool = fun () -> Raw.Surface.get_mapped obj
    method get_scale : unit -> float = fun () -> Raw.Surface.get_scale obj

    method get_scale_factor : unit -> int =
      fun () -> Raw.Surface.get_scale_factor obj

    method get_width : unit -> int = fun () -> Raw.Surface.get_width obj
    method hide : unit -> unit = fun () -> Raw.Surface.hide obj
    method is_destroyed : unit -> bool = fun () -> Raw.Surface.is_destroyed obj
    method queue_render : unit -> unit = fun () -> Raw.Surface.queue_render obj

    method request_layout : unit -> unit =
      fun () -> Raw.Surface.request_layout obj

    method set_cursor : Cursor.cursor_t option -> unit =
      fun cursor ->
        let cursor = Option.map (fun c -> c#as_cursor) cursor in
        Raw.Surface.set_cursor obj cursor

    method set_device_cursor : device_t -> Cursor.cursor_t -> unit =
      fun device cursor ->
        let device = device#as_device in
        let cursor = cursor#as_cursor in
        Raw.Surface.set_device_cursor obj device cursor

    method set_input_region : Occairo.Region.region_t option -> unit =
      fun region ->
        let region = Option.map (fun c -> c#as_region) region in
        Raw.Surface.set_input_region obj region

    method set_opaque_region : Occairo.Region.region_t option -> unit =
      fun region ->
        let region = Option.map (fun c -> c#as_region) region in
        Raw.Surface.set_opaque_region obj region

    method as_surface = obj
  end

and vulkan_context (obj : Raw.Vulkan_context.t) : vulkan_context_t =
  object (self)
    method on_images_updated ?(after = false) ~callback () =
      Raw.Vulkan_context.on_images_updated ~after self#as_vulkan_context
        ~callback

    method as_vulkan_context = obj
  end

let new_popup (parent : surface_t) (autohide : bool) : surface_t =
  let parent = parent#as_surface in
  let obj_ = Raw.Surface.new_popup parent autohide in
  new surface obj_

let new_toplevel (display : display_t) : surface_t =
  let display = display#as_display in
  let obj_ = Raw.Surface.new_toplevel display in
  new surface obj_
