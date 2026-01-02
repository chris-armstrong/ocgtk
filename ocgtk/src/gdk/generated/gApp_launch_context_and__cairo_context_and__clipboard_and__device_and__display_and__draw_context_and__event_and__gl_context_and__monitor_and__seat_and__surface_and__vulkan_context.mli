class app_launch_context : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.App_launch_context.t ->
  object
    method get_display : unit -> display
    method set_desktop : int -> unit
    method set_icon_name : string option -> unit
    method as_app_launch_context : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.App_launch_context.t
  end

and cairo_context : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Cairo_context.t ->
  object
    method as_cairo_context : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Cairo_context.t
  end

and clipboard : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Clipboard.t ->
  object
    inherit Gclipboard_signals.clipboard_signals
    method get_content : unit -> GContent_provider.content_provider option
    method get_display : unit -> display
    method get_formats : unit -> Content_formats.t
    method is_local : unit -> bool
    method set_content : #GContent_provider.content_provider option -> bool
    method set_text : string -> unit
    method set_texture : #GTexture.texture -> unit
    method local : bool
    method as_clipboard : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Clipboard.t
  end

and device : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Device.t ->
  object
    inherit Gdevice_signals.device_signals
    method get_caps_lock_state : unit -> bool
    method get_device_tool : unit -> GDevice_tool.device_tool option
    method get_display : unit -> display
    method get_has_cursor : unit -> bool
    method get_modifier_state : unit -> Gdk_enums.modifiertype
    method get_name : unit -> string
    method get_num_lock_state : unit -> bool
    method get_num_touches : unit -> int
    method get_product_id : unit -> string option
    method get_scroll_lock_state : unit -> bool
    method get_seat : unit -> seat
    method get_source : unit -> Gdk_enums.inputsource
    method get_vendor_id : unit -> string option
    method has_bidi_layouts : unit -> bool
    method n_axes : int
    method tool : GDevice_tool.device_tool
    method as_device : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Device.t
  end

and display : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Display.t ->
  object
    inherit Gdisplay_signals.display_signals
    method beep : unit -> unit
    method close : unit -> unit
    method create_gl_context : unit -> (gl_context, GError.t) result
    method device_is_grabbed : <as_device: App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Device.t; ..> -> bool
    method flush : unit -> unit
    method get_app_launch_context : unit -> app_launch_context
    method get_clipboard : unit -> clipboard
    method get_default_seat : unit -> seat option
    method get_dmabuf_formats : unit -> Dmabuf_formats.t
    method get_monitor_at_surface : <as_surface: App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Surface.t; ..> -> monitor option
    method get_name : unit -> string
    method get_primary_clipboard : unit -> clipboard
    method get_startup_notification_id : unit -> string option
    method is_closed : unit -> bool
    method is_composited : unit -> bool
    method is_rgba : unit -> bool
    method notify_startup_complete : string -> unit
    method prepare_gl : unit -> (bool, GError.t) result
    method put_event : <as_event: App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Event.t; ..> -> unit
    method supports_input_shapes : unit -> bool
    method supports_shadow_width : unit -> bool
    method sync : unit -> unit
    method composited : bool
    method input_shapes : bool
    method rgba : bool
    method shadow_width : bool
    method as_display : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Display.t
  end

and draw_context : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Draw_context.t ->
  object
    method end_frame : unit -> unit
    method get_display : unit -> display option
    method get_surface : unit -> surface option
    method is_in_frame : unit -> bool
    method as_draw_context : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Draw_context.t
  end

and event : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Event.t ->
  object
    method get_device : unit -> device option
    method get_device_tool : unit -> GDevice_tool.device_tool option
    method get_display : unit -> display option
    method get_event_sequence : unit -> Event_sequence.t
    method get_event_type : unit -> Gdk_enums.eventtype
    method get_modifier_state : unit -> Gdk_enums.modifiertype
    method get_pointer_emulated : unit -> bool
    method get_seat : unit -> seat option
    method get_surface : unit -> surface option
    method ref : unit -> event
    method triggers_context_menu : unit -> bool
    method unref : unit -> unit
    method as_event : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Event.t
  end

and gl_context : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Gl_context.t ->
  object
    method get_allowed_apis : unit -> Gdk_enums.glapi
    method get_api : unit -> Gdk_enums.glapi
    method get_debug_enabled : unit -> bool
    method get_display : unit -> display option
    method get_forward_compatible : unit -> bool
    method get_shared_context : unit -> gl_context option
    method get_surface : unit -> surface option
    method get_use_es : unit -> bool
    method is_legacy : unit -> bool
    method is_shared : <as_gl_context: App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Gl_context.t; ..> -> bool
    method make_current : unit -> unit
    method realize : unit -> (bool, GError.t) result
    method set_allowed_apis : Gdk_enums.glapi -> unit
    method set_debug_enabled : bool -> unit
    method set_forward_compatible : bool -> unit
    method set_required_version : int -> int -> unit
    method set_use_es : int -> unit
    method as_gl_context : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Gl_context.t
  end

and monitor : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Monitor.t ->
  object
    inherit Gmonitor_signals.monitor_signals
    method get_connector : unit -> string option
    method get_description : unit -> string option
    method get_display : unit -> display
    method get_height_mm : unit -> int
    method get_manufacturer : unit -> string option
    method get_model : unit -> string option
    method get_refresh_rate : unit -> int
    method get_scale : unit -> float
    method get_scale_factor : unit -> int
    method get_subpixel_layout : unit -> Gdk_enums.subpixellayout
    method get_width_mm : unit -> int
    method is_valid : unit -> bool
    method valid : bool
    method as_monitor : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Monitor.t
  end

and seat : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Seat.t ->
  object
    inherit Gseat_signals.seat_signals
    method get_capabilities : unit -> Gdk_enums.seatcapabilities
    method get_display : unit -> display
    method get_keyboard : unit -> device option
    method get_pointer : unit -> device option
    method as_seat : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Seat.t
  end

and surface : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Surface.t ->
  object
    inherit Gsurface_signals.surface_signals
    method beep : unit -> unit
    method create_cairo_context : unit -> cairo_context
    method create_gl_context : unit -> (gl_context, GError.t) result
    method create_vulkan_context : unit -> (vulkan_context, GError.t) result
    method destroy : unit -> unit
    method get_cursor : unit -> GCursor.cursor option
    method get_device_cursor : <as_device: App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Device.t; ..> -> GCursor.cursor option
    method get_display : unit -> display
    method get_frame_clock : unit -> GFrame_clock.frame_clock
    method get_height : unit -> int
    method get_mapped : unit -> bool
    method get_scale : unit -> float
    method get_scale_factor : unit -> int
    method get_width : unit -> int
    method hide : unit -> unit
    method is_destroyed : unit -> bool
    method queue_render : unit -> unit
    method request_layout : unit -> unit
    method set_cursor : #GCursor.cursor option -> unit
    method set_device_cursor : <as_device: App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Device.t; ..> -> #GCursor.cursor -> unit
    method as_surface : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Surface.t
  end

and vulkan_context : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Vulkan_context.t ->
  object
    inherit Gvulkan_context_signals.vulkan_context_signals
    method as_vulkan_context : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Vulkan_context.t
  end
