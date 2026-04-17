(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type app_launch_context_t = object
  inherit Ocgtk_gio.Gio.App_launch_context.app_launch_context_t
  method set_desktop : int -> unit
  method set_icon : Ocgtk_gio.Gio.Icon.icon_t option -> unit
  method set_icon_name : string option -> unit
  method set_timestamp : UInt32.t -> unit
  method display : display_t
end

and cairo_context_t = object
  method cairo_create : unit -> Ocgtk_cairo.Cairo.Context.context_t option

  method as_cairo_context :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Cairo_context
    .t
end

and clipboard_t = object
  inherit Gclipboard_signals.clipboard_signals
  method get_content : unit -> GContent_provider.content_provider_t option
  method get_display : unit -> display_t
  method get_formats : unit -> Content_formats.t
  method is_local : unit -> bool

  method read_text_finish :
    Ocgtk_gio.Gio.Async_result.async_result_t ->
    (string option, GError.t) result

  method read_texture_finish :
    Ocgtk_gio.Gio.Async_result.async_result_t ->
    (GTexture.texture_t option, GError.t) result

  method set_content : GContent_provider.content_provider_t option -> bool

  method store_finish :
    Ocgtk_gio.Gio.Async_result.async_result_t -> (bool, GError.t) result

  method local : bool

  method as_clipboard :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Clipboard
    .t
end

and device_t = object
  inherit Gdevice_signals.device_signals
  method get_caps_lock_state : unit -> bool
  method get_device_tool : unit -> GDevice_tool.device_tool_t option
  method get_direction : unit -> Ocgtk_pango.Pango.direction
  method get_display : unit -> display_t
  method get_has_cursor : unit -> bool
  method get_modifier_state : unit -> Gdk_enums.modifiertype
  method get_name : unit -> string
  method get_num_lock_state : unit -> bool
  method get_num_touches : unit -> int
  method get_product_id : unit -> string option
  method get_scroll_lock_state : unit -> bool
  method get_seat : unit -> seat_t
  method get_source : unit -> Gdk_enums.inputsource
  method get_timestamp : unit -> UInt32.t
  method get_vendor_id : unit -> string option
  method has_bidi_layouts : unit -> bool
  method n_axes : int
  method tool : GDevice_tool.device_tool_t

  method as_device :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Device
    .t
end

and display_t = object
  inherit Gdisplay_signals.display_signals
  method beep : unit -> unit
  method close : unit -> unit
  method create_gl_context : unit -> (gl_context_t, GError.t) result
  method device_is_grabbed : device_t -> bool
  method flush : unit -> unit
  method get_app_launch_context : unit -> app_launch_context_t
  method get_clipboard : unit -> clipboard_t
  method get_default_seat : unit -> seat_t option
  method get_dmabuf_formats : unit -> Dmabuf_formats.t
  method get_monitor_at_surface : surface_t -> monitor_t option
  method get_monitors : unit -> Ocgtk_gio.Gio.List_model.list_model_t
  method get_name : unit -> string
  method get_primary_clipboard : unit -> clipboard_t
  method get_startup_notification_id : unit -> string option
  method is_closed : unit -> bool
  method is_composited : unit -> bool
  method is_rgba : unit -> bool
  method list_seats : unit -> seat_t list
  method notify_startup_complete : string -> unit
  method prepare_gl : unit -> (bool, GError.t) result
  method put_event : event_t -> unit
  method supports_input_shapes : unit -> bool
  method supports_shadow_width : unit -> bool
  method sync : unit -> unit
  method composited : bool
  method input_shapes : bool
  method rgba : bool
  method shadow_width : bool

  method as_display :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Display
    .t
end

and draw_context_t = object
  method begin_frame : Ocgtk_cairo.Cairo.Region.region_t -> unit
  method end_frame : unit -> unit
  method get_display : unit -> display_t option
  method get_frame_region : unit -> Ocgtk_cairo.Cairo.Region.region_t option
  method get_surface : unit -> surface_t option
  method is_in_frame : unit -> bool

  method as_draw_context :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Draw_context
    .t
end

and event_t = object
  method get_device : unit -> device_t option
  method get_device_tool : unit -> GDevice_tool.device_tool_t option
  method get_display : unit -> display_t option
  method get_event_sequence : unit -> Event_sequence.t
  method get_event_type : unit -> Gdk_enums.eventtype
  method get_modifier_state : unit -> Gdk_enums.modifiertype
  method get_pointer_emulated : unit -> bool
  method get_seat : unit -> seat_t option
  method get_surface : unit -> surface_t option
  method get_time : unit -> UInt32.t
  method ref : unit -> event_t
  method triggers_context_menu : unit -> bool
  method unref : unit -> unit

  method as_event :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Event
    .t
end

and gl_context_t = object
  method get_allowed_apis : unit -> Gdk_enums.glapi
  method get_api : unit -> Gdk_enums.glapi
  method get_debug_enabled : unit -> bool
  method get_forward_compatible : unit -> bool
  method get_shared_context : unit -> gl_context_t option
  method get_use_es : unit -> bool
  method is_legacy : unit -> bool
  method is_shared : gl_context_t -> bool
  method make_current : unit -> unit
  method realize : unit -> (bool, GError.t) result
  method set_allowed_apis : Gdk_enums.glapi -> unit
  method set_debug_enabled : bool -> unit
  method set_forward_compatible : bool -> unit
  method set_required_version : int -> int -> unit
  method set_use_es : int -> unit

  method as_gl_context :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Gl_context
    .t
end

and monitor_t = object
  inherit Gmonitor_signals.monitor_signals
  method get_connector : unit -> string option
  method get_description : unit -> string option
  method get_display : unit -> display_t
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

  method as_monitor :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Monitor
    .t
end

and seat_t = object
  inherit Gseat_signals.seat_signals
  method get_capabilities : unit -> Gdk_enums.seatcapabilities
  method get_devices : Gdk_enums.seatcapabilities -> device_t list
  method get_display : unit -> display_t
  method get_keyboard : unit -> device_t option
  method get_pointer : unit -> device_t option
  method get_tools : unit -> GDevice_tool.device_tool_t list

  method as_seat :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Seat
    .t
end

and surface_t = object
  inherit Gsurface_signals.surface_signals
  method beep : unit -> unit
  method create_cairo_context : unit -> cairo_context_t
  method create_gl_context : unit -> (gl_context_t, GError.t) result

  method create_similar_surface :
    Ocgtk_cairo.Cairo.content ->
    int ->
    int ->
    Ocgtk_cairo.Cairo.Surface.surface_t

  method create_vulkan_context : unit -> (vulkan_context_t, GError.t) result
  method destroy : unit -> unit
  method get_cursor : unit -> GCursor.cursor_t option
  method get_device_cursor : device_t -> GCursor.cursor_t option
  method get_display : unit -> display_t
  method get_frame_clock : unit -> GFrame_clock.frame_clock_t
  method get_height : unit -> int
  method get_mapped : unit -> bool
  method get_scale : unit -> float
  method get_scale_factor : unit -> int
  method get_width : unit -> int
  method hide : unit -> unit
  method is_destroyed : unit -> bool
  method queue_render : unit -> unit
  method request_layout : unit -> unit
  method set_cursor : GCursor.cursor_t option -> unit
  method set_device_cursor : device_t -> GCursor.cursor_t -> unit
  method set_input_region : Ocgtk_cairo.Cairo.Region.region_t -> unit
  method set_opaque_region : Ocgtk_cairo.Cairo.Region.region_t option -> unit

  method as_surface :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Surface
    .t
end

and vulkan_context_t = object
  inherit Ocgtk_gio.Gio.Initable.initable_t
  inherit Gvulkan_context_signals.vulkan_context_signals

  method as_vulkan_context :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Vulkan_context
    .t
end

class app_launch_context
  (obj :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .App_launch_context
    .t) :
  app_launch_context_t =
  object (self)
    inherit
      Ocgtk_gio.Gio.App_launch_context.app_launch_context
        (obj :> Ocgtk_gio.Gio.Wrappers.App_launch_context.t)

    method set_desktop : int -> unit =
      fun desktop ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .App_launch_context
        .set_desktop obj desktop

    method set_icon : Ocgtk_gio.Gio.Icon.icon_t option -> unit =
      fun icon ->
        let icon = Option.map (fun c -> c#as_icon) icon in
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .App_launch_context
        .set_icon obj icon

    method set_icon_name : string option -> unit =
      fun icon_name ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .App_launch_context
        .set_icon_name obj icon_name

    method set_timestamp : UInt32.t -> unit =
      fun timestamp ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .App_launch_context
        .set_timestamp obj timestamp

    method display =
      new display
        (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
         .App_launch_context
         .get_display obj)
  end

and cairo_context
  (obj :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Cairo_context
    .t) :
  cairo_context_t =
  object (self)
    method cairo_create : unit -> Ocgtk_cairo.Cairo.Context.context_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgtk_cairo.Cairo.Context.context ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Cairo_context
           .cairo_create obj)

    method as_cairo_context = obj
  end (* Signal class defined in gclipboard_signals.ml *)

and clipboard
  (obj :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Clipboard
    .t) :
  clipboard_t =
  object (self)
    inherit Gclipboard_signals.clipboard_signals obj

    method get_content : unit -> GContent_provider.content_provider_t option =
      fun () ->
        Option.map
          (fun ret -> new GContent_provider.content_provider ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Clipboard
           .get_content obj)

    method get_display : unit -> display_t =
      fun () ->
        new display
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Clipboard
           .get_display obj)

    method get_formats : unit -> Content_formats.t =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Clipboard
        .get_formats obj

    method is_local : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Clipboard
        .is_local obj

    method read_text_finish :
        Ocgtk_gio.Gio.Async_result.async_result_t ->
        (string option, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Clipboard
        .read_text_finish obj result

    method read_texture_finish :
        Ocgtk_gio.Gio.Async_result.async_result_t ->
        (GTexture.texture_t option, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> Option.map (fun ret -> new GTexture.texture ret) ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Clipboard
           .read_texture_finish obj result)

    method set_content : GContent_provider.content_provider_t option -> bool =
      fun provider ->
        let provider = Option.map (fun c -> c#as_content_provider) provider in
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Clipboard
        .set_content obj provider

    method store_finish :
        Ocgtk_gio.Gio.Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Clipboard
        .store_finish obj result

    method local =
      App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
      .Clipboard
      .get_local obj

    method as_clipboard = obj
  end (* Signal class defined in gdevice_signals.ml *)

and device
  (obj :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Device
    .t) :
  device_t =
  object (self)
    inherit Gdevice_signals.device_signals obj

    method get_caps_lock_state : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Device
        .get_caps_lock_state obj

    method get_device_tool : unit -> GDevice_tool.device_tool_t option =
      fun () ->
        Option.map
          (fun ret -> new GDevice_tool.device_tool ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Device
           .get_device_tool obj)

    method get_direction : unit -> Ocgtk_pango.Pango.direction =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Device
        .get_direction obj

    method get_display : unit -> display_t =
      fun () ->
        new display
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Device
           .get_display obj)

    method get_has_cursor : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Device
        .get_has_cursor obj

    method get_modifier_state : unit -> Gdk_enums.modifiertype =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Device
        .get_modifier_state obj

    method get_name : unit -> string =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Device
        .get_name obj

    method get_num_lock_state : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Device
        .get_num_lock_state obj

    method get_num_touches : unit -> int =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Device
        .get_num_touches obj

    method get_product_id : unit -> string option =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Device
        .get_product_id obj

    method get_scroll_lock_state : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Device
        .get_scroll_lock_state obj

    method get_seat : unit -> seat_t =
      fun () ->
        new seat
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Device
           .get_seat obj)

    method get_source : unit -> Gdk_enums.inputsource =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Device
        .get_source obj

    method get_timestamp : unit -> UInt32.t =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Device
        .get_timestamp obj

    method get_vendor_id : unit -> string option =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Device
        .get_vendor_id obj

    method has_bidi_layouts : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Device
        .has_bidi_layouts obj

    method n_axes =
      App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
      .Device
      .get_n_axes obj

    method tool =
      new GDevice_tool.device_tool
        (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
         .Device
         .get_tool obj)

    method as_device = obj
  end (* Signal class defined in gdisplay_signals.ml *)

and display
  (obj :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Display
    .t) :
  display_t =
  object (self)
    inherit Gdisplay_signals.display_signals obj

    method beep : unit -> unit =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Display
        .beep obj

    method close : unit -> unit =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Display
        .close obj

    method create_gl_context : unit -> (gl_context_t, GError.t) result =
      fun () ->
        Result.map
          (fun ret -> new gl_context ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Display
           .create_gl_context obj)

    method device_is_grabbed : device_t -> bool =
      fun device ->
        let device = device#as_device in
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Display
        .device_is_grabbed obj device

    method flush : unit -> unit =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Display
        .flush obj

    method get_app_launch_context : unit -> app_launch_context_t =
      fun () ->
        new app_launch_context
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Display
           .get_app_launch_context obj)

    method get_clipboard : unit -> clipboard_t =
      fun () ->
        new clipboard
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Display
           .get_clipboard obj)

    method get_default_seat : unit -> seat_t option =
      fun () ->
        Option.map
          (fun ret -> new seat ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Display
           .get_default_seat obj)

    method get_dmabuf_formats : unit -> Dmabuf_formats.t =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Display
        .get_dmabuf_formats obj

    method get_monitor_at_surface : surface_t -> monitor_t option =
      fun surface ->
        let surface = surface#as_surface in
        Option.map
          (fun ret -> new monitor ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Display
           .get_monitor_at_surface obj surface)

    method get_monitors : unit -> Ocgtk_gio.Gio.List_model.list_model_t =
      fun () ->
        new Ocgtk_gio.Gio.List_model.list_model
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Display
           .get_monitors obj)

    method get_name : unit -> string =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Display
        .get_name obj

    method get_primary_clipboard : unit -> clipboard_t =
      fun () ->
        new clipboard
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Display
           .get_primary_clipboard obj)

    method get_startup_notification_id : unit -> string option =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Display
        .get_startup_notification_id obj

    method is_closed : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Display
        .is_closed obj

    method is_composited : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Display
        .is_composited obj

    method is_rgba : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Display
        .is_rgba obj

    method list_seats : unit -> seat_t list =
      fun () ->
        (List.map (fun ret -> new seat ret))
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Display
           .list_seats obj)

    method notify_startup_complete : string -> unit =
      fun startup_id ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Display
        .notify_startup_complete obj startup_id

    method prepare_gl : unit -> (bool, GError.t) result =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Display
        .prepare_gl obj

    method put_event : event_t -> unit =
      fun event ->
        let event = event#as_event in
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Display
        .put_event obj event

    method supports_input_shapes : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Display
        .supports_input_shapes obj

    method supports_shadow_width : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Display
        .supports_shadow_width obj

    method sync : unit -> unit =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Display
        .sync obj

    method composited =
      App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
      .Display
      .get_composited obj

    method input_shapes =
      App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
      .Display
      .get_input_shapes obj

    method rgba =
      App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
      .Display
      .get_rgba obj

    method shadow_width =
      App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
      .Display
      .get_shadow_width obj

    method as_display = obj
  end

and draw_context
  (obj :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Draw_context
    .t) :
  draw_context_t =
  object (self)
    method begin_frame : Ocgtk_cairo.Cairo.Region.region_t -> unit =
      fun region ->
        let region = region#as_region in
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Draw_context
        .begin_frame obj region

    method end_frame : unit -> unit =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Draw_context
        .end_frame obj

    method get_display : unit -> display_t option =
      fun () ->
        Option.map
          (fun ret -> new display ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Draw_context
           .get_display obj)

    method get_frame_region : unit -> Ocgtk_cairo.Cairo.Region.region_t option =
      fun () ->
        Option.map
          (fun ret -> new Ocgtk_cairo.Cairo.Region.region ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Draw_context
           .get_frame_region obj)

    method get_surface : unit -> surface_t option =
      fun () ->
        Option.map
          (fun ret -> new surface ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Draw_context
           .get_surface obj)

    method is_in_frame : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Draw_context
        .is_in_frame obj

    method as_draw_context = obj
  end

and event
  (obj :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Event
    .t) :
  event_t =
  object (self)
    method get_device : unit -> device_t option =
      fun () ->
        Option.map
          (fun ret -> new device ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Event
           .get_device obj)

    method get_device_tool : unit -> GDevice_tool.device_tool_t option =
      fun () ->
        Option.map
          (fun ret -> new GDevice_tool.device_tool ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Event
           .get_device_tool obj)

    method get_display : unit -> display_t option =
      fun () ->
        Option.map
          (fun ret -> new display ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Event
           .get_display obj)

    method get_event_sequence : unit -> Event_sequence.t =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Event
        .get_event_sequence obj

    method get_event_type : unit -> Gdk_enums.eventtype =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Event
        .get_event_type obj

    method get_modifier_state : unit -> Gdk_enums.modifiertype =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Event
        .get_modifier_state obj

    method get_pointer_emulated : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Event
        .get_pointer_emulated obj

    method get_seat : unit -> seat_t option =
      fun () ->
        Option.map
          (fun ret -> new seat ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Event
           .get_seat obj)

    method get_surface : unit -> surface_t option =
      fun () ->
        Option.map
          (fun ret -> new surface ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Event
           .get_surface obj)

    method get_time : unit -> UInt32.t =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Event
        .get_time obj

    method ref : unit -> event_t =
      fun () ->
        new event
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Event
           .ref obj)

    method triggers_context_menu : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Event
        .triggers_context_menu obj

    method unref : unit -> unit =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Event
        .unref obj

    method as_event = obj
  end

and gl_context
  (obj :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Gl_context
    .t) :
  gl_context_t =
  object (self)
    method get_allowed_apis : unit -> Gdk_enums.glapi =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Gl_context
        .get_allowed_apis obj

    method get_api : unit -> Gdk_enums.glapi =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Gl_context
        .get_api obj

    method get_debug_enabled : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Gl_context
        .get_debug_enabled obj

    method get_forward_compatible : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Gl_context
        .get_forward_compatible obj

    method get_shared_context : unit -> gl_context_t option =
      fun () ->
        Option.map
          (fun ret -> new gl_context ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Gl_context
           .get_shared_context obj)

    method get_use_es : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Gl_context
        .get_use_es obj

    method is_legacy : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Gl_context
        .is_legacy obj

    method is_shared : gl_context_t -> bool =
      fun other ->
        let other = other#as_gl_context in
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Gl_context
        .is_shared obj other

    method make_current : unit -> unit =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Gl_context
        .make_current obj

    method realize : unit -> (bool, GError.t) result =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Gl_context
        .realize obj

    method set_allowed_apis : Gdk_enums.glapi -> unit =
      fun apis ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Gl_context
        .set_allowed_apis obj apis

    method set_debug_enabled : bool -> unit =
      fun enabled ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Gl_context
        .set_debug_enabled obj enabled

    method set_forward_compatible : bool -> unit =
      fun compatible ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Gl_context
        .set_forward_compatible obj compatible

    method set_required_version : int -> int -> unit =
      fun major minor ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Gl_context
        .set_required_version obj major minor

    method set_use_es : int -> unit =
      fun use_es ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Gl_context
        .set_use_es obj use_es

    method as_gl_context = obj
  end (* Signal class defined in gmonitor_signals.ml *)

and monitor
  (obj :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Monitor
    .t) :
  monitor_t =
  object (self)
    inherit Gmonitor_signals.monitor_signals obj

    method get_connector : unit -> string option =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Monitor
        .get_connector obj

    method get_description : unit -> string option =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Monitor
        .get_description obj

    method get_display : unit -> display_t =
      fun () ->
        new display
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Monitor
           .get_display obj)

    method get_height_mm : unit -> int =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Monitor
        .get_height_mm obj

    method get_manufacturer : unit -> string option =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Monitor
        .get_manufacturer obj

    method get_model : unit -> string option =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Monitor
        .get_model obj

    method get_refresh_rate : unit -> int =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Monitor
        .get_refresh_rate obj

    method get_scale : unit -> float =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Monitor
        .get_scale obj

    method get_scale_factor : unit -> int =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Monitor
        .get_scale_factor obj

    method get_subpixel_layout : unit -> Gdk_enums.subpixellayout =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Monitor
        .get_subpixel_layout obj

    method get_width_mm : unit -> int =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Monitor
        .get_width_mm obj

    method is_valid : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Monitor
        .is_valid obj

    method valid =
      App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
      .Monitor
      .get_valid obj

    method as_monitor = obj
  end (* Signal class defined in gseat_signals.ml *)

and seat
  (obj :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Seat
    .t) :
  seat_t =
  object (self)
    inherit Gseat_signals.seat_signals obj

    method get_capabilities : unit -> Gdk_enums.seatcapabilities =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Seat
        .get_capabilities obj

    method get_devices : Gdk_enums.seatcapabilities -> device_t list =
      fun capabilities ->
        (List.map (fun ret -> new device ret))
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Seat
           .get_devices obj capabilities)

    method get_display : unit -> display_t =
      fun () ->
        new display
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Seat
           .get_display obj)

    method get_keyboard : unit -> device_t option =
      fun () ->
        Option.map
          (fun ret -> new device ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Seat
           .get_keyboard obj)

    method get_pointer : unit -> device_t option =
      fun () ->
        Option.map
          (fun ret -> new device ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Seat
           .get_pointer obj)

    method get_tools : unit -> GDevice_tool.device_tool_t list =
      fun () ->
        (List.map (fun ret -> new GDevice_tool.device_tool ret))
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Seat
           .get_tools obj)

    method as_seat = obj
  end (* Signal class defined in gsurface_signals.ml *)

and surface
  (obj :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Surface
    .t) :
  surface_t =
  object (self)
    inherit Gsurface_signals.surface_signals obj

    method beep : unit -> unit =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Surface
        .beep obj

    method create_cairo_context : unit -> cairo_context_t =
      fun () ->
        new cairo_context
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Surface
           .create_cairo_context obj)

    method create_gl_context : unit -> (gl_context_t, GError.t) result =
      fun () ->
        Result.map
          (fun ret -> new gl_context ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Surface
           .create_gl_context obj)

    method create_similar_surface :
        Ocgtk_cairo.Cairo.content ->
        int ->
        int ->
        Ocgtk_cairo.Cairo.Surface.surface_t =
      fun content width height ->
        new Ocgtk_cairo.Cairo.Surface.surface
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Surface
           .create_similar_surface obj content width height)

    method create_vulkan_context : unit -> (vulkan_context_t, GError.t) result =
      fun () ->
        Result.map
          (fun ret -> new vulkan_context ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Surface
           .create_vulkan_context obj)

    method destroy : unit -> unit =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Surface
        .destroy obj

    method get_cursor : unit -> GCursor.cursor_t option =
      fun () ->
        Option.map
          (fun ret -> new GCursor.cursor ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Surface
           .get_cursor obj)

    method get_device_cursor : device_t -> GCursor.cursor_t option =
      fun device ->
        let device = device#as_device in
        Option.map
          (fun ret -> new GCursor.cursor ret)
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Surface
           .get_device_cursor obj device)

    method get_display : unit -> display_t =
      fun () ->
        new display
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Surface
           .get_display obj)

    method get_frame_clock : unit -> GFrame_clock.frame_clock_t =
      fun () ->
        new GFrame_clock.frame_clock
          (App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
           .Surface
           .get_frame_clock obj)

    method get_height : unit -> int =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Surface
        .get_height obj

    method get_mapped : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Surface
        .get_mapped obj

    method get_scale : unit -> float =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Surface
        .get_scale obj

    method get_scale_factor : unit -> int =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Surface
        .get_scale_factor obj

    method get_width : unit -> int =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Surface
        .get_width obj

    method hide : unit -> unit =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Surface
        .hide obj

    method is_destroyed : unit -> bool =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Surface
        .is_destroyed obj

    method queue_render : unit -> unit =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Surface
        .queue_render obj

    method request_layout : unit -> unit =
      fun () ->
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Surface
        .request_layout obj

    method set_cursor : GCursor.cursor_t option -> unit =
      fun cursor ->
        let cursor = Option.map (fun c -> c#as_cursor) cursor in
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Surface
        .set_cursor obj cursor

    method set_device_cursor : device_t -> GCursor.cursor_t -> unit =
      fun device cursor ->
        let device = device#as_device in
        let cursor = cursor#as_cursor in
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Surface
        .set_device_cursor obj device cursor

    method set_input_region : Ocgtk_cairo.Cairo.Region.region_t -> unit =
      fun region ->
        let region = region#as_region in
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Surface
        .set_input_region obj region

    method set_opaque_region : Ocgtk_cairo.Cairo.Region.region_t option -> unit
        =
      fun region ->
        let region = Option.map (fun c -> c#as_region) region in
        App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
        .Surface
        .set_opaque_region obj region

    method as_surface = obj
  end (* Signal class defined in gvulkan_context_signals.ml *)

and vulkan_context
  (obj :
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Vulkan_context
    .t) :
  vulkan_context_t =
  object (self)
    inherit
      Ocgtk_gio.Gio.Initable.initable
        (Ocgtk_gio.Gio.Wrappers.Initable.from_gobject obj)

    inherit Gvulkan_context_signals.vulkan_context_signals obj
    method as_vulkan_context = obj
  end

let new_popup (parent : surface_t) (autohide : bool) : surface_t =
  let parent = parent#as_surface in
  let obj_ =
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Surface
    .new_popup parent autohide
  in
  new surface obj_

let new_toplevel (display : display_t) : surface_t =
  let display = display#as_display in
  let obj_ =
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Surface
    .new_toplevel display
  in
  new surface obj_
