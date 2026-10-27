(** The classes of {!Ocgdk.App_launch_context}, {!Ocgdk.Cairo_context},
    {!Ocgdk.Clipboard}, {!Ocgdk.Device}, {!Ocgdk.Display},
    {!Ocgdk.Draw_context}, {!Ocgdk.Event}, {!Ocgdk.Gl_context},
    {!Ocgdk.Monitor}, {!Ocgdk.Seat}, {!Ocgdk.Surface}, {!Ocgdk.Vulkan_context},
    defined together because they refer to each other. Each has a module of its
    own that re-exports it; use that module rather than this one. *)

(** The methods, signals and properties of a [GdkAppLaunchContext]. *)
class type app_launch_context_t = object
  inherit Ocgio.App_launch_context.app_launch_context_t
  method set_desktop : int -> unit
  method set_icon : Ocgio.Icon.icon_t option -> unit
  method set_icon_name : string option -> unit
  method set_timestamp : UInt32.t -> unit
  method display : display_t
end

(** The methods, signals and properties of a [GdkCairoContext]. *)
and cairo_context_t = object
  method cairo_create : unit -> Occairo.Context.context_t option
  method as_cairo_context : Raw.Cairo_context.t
end

(** The methods, signals and properties of a [GdkClipboard]. *)
and clipboard_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_content : unit -> Content_provider.content_provider_t option
  method get_display : unit -> display_t
  method get_formats : unit -> Raw.Content_formats.t
  method is_local : unit -> bool

  method read_text_finish :
    Ocgio.Async_result.async_result_t -> (string option, GError.t) result

  method read_texture_finish :
    Ocgio.Async_result.async_result_t ->
    (Texture.texture_t option, GError.t) result

  method read_value_finish :
    Ocgio.Async_result.async_result_t -> (Gobject.Value.t, GError.t) result

  method set_content : Content_provider.content_provider_t option -> bool
  method set_value : Gobject.Value.t -> unit

  method store_finish :
    Ocgio.Async_result.async_result_t -> (bool, GError.t) result

  method as_clipboard : Raw.Clipboard.t
end

(** The methods, signals and properties of a [GdkDevice]. *)
and device_t = object
  method on_changed :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_tool_changed :
    ?after:bool ->
    callback:(tool:Device_tool.device_tool_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_active_layout_index : unit -> int
  method get_caps_lock_state : unit -> bool
  method get_device_tool : unit -> Device_tool.device_tool_t option
  method get_direction : unit -> Ocpango.Enums.direction
  method get_display : unit -> display_t
  method get_has_cursor : unit -> bool
  method get_layout_names : unit -> string array option
  method get_modifier_state : unit -> Enums.modifiertype
  method get_name : unit -> string
  method get_num_lock_state : unit -> bool
  method get_num_touches : unit -> int
  method get_product_id : unit -> string option
  method get_scroll_lock_state : unit -> bool
  method get_seat : unit -> seat_t
  method get_source : unit -> Enums.inputsource
  method get_timestamp : unit -> UInt32.t
  method get_vendor_id : unit -> string option
  method has_bidi_layouts : unit -> bool
  method n_axes : int
  method as_device : Raw.Device.t
end

(** The methods, signals and properties of a [GdkDisplay]. *)
and display_t = object
  method on_closed :
    ?after:bool ->
    callback:(is_error:bool -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_opened :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_seat_added :
    ?after:bool ->
    callback:(seat:seat_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_seat_removed :
    ?after:bool ->
    callback:(seat:seat_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_setting_changed :
    ?after:bool ->
    callback:(setting:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method beep : unit -> unit
  method close : unit -> unit
  method create_gl_context : unit -> (gl_context_t, GError.t) result
  method device_is_grabbed : device_t -> bool
  method flush : unit -> unit
  method get_app_launch_context : unit -> app_launch_context_t
  method get_clipboard : unit -> clipboard_t
  method get_default_seat : unit -> seat_t option
  method get_dmabuf_formats : unit -> Raw.Dmabuf_formats.t
  method get_monitor_at_surface : surface_t -> monitor_t option
  method get_monitors : unit -> Ocgio.List_model.list_model_t
  method get_name : unit -> string
  method get_primary_clipboard : unit -> clipboard_t
  method get_setting : string -> Gobject.Value.t -> bool
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
  method as_display : Raw.Display.t
end

(** The methods, signals and properties of a [GdkDrawContext]. *)
and draw_context_t = object
  method begin_frame : Occairo.Region.region_t -> unit
  method end_frame : unit -> unit
  method get_display : unit -> display_t option
  method get_frame_region : unit -> Occairo.Region.region_t option
  method get_surface : unit -> surface_t option
  method is_in_frame : unit -> bool
  method as_draw_context : Raw.Draw_context.t
end

(** The methods, signals and properties of a [GdkEvent]. *)
and event_t = object
  method get_device : unit -> device_t option
  method get_device_tool : unit -> Device_tool.device_tool_t option
  method get_display : unit -> display_t option
  method get_event_sequence : unit -> Raw.Event_sequence.t
  method get_event_type : unit -> Enums.eventtype
  method get_modifier_state : unit -> Enums.modifiertype
  method get_pointer_emulated : unit -> bool
  method get_seat : unit -> seat_t option
  method get_surface : unit -> surface_t option
  method get_time : unit -> UInt32.t
  method ref : unit -> event_t
  method triggers_context_menu : unit -> bool
  method unref : unit -> unit
  method as_event : Raw.Event.t
end

(** The methods, signals and properties of a [GdkGLContext]. *)
and gl_context_t = object
  method get_allowed_apis : unit -> Enums.glapi
  method get_api : unit -> Enums.glapi
  method get_debug_enabled : unit -> bool
  method get_forward_compatible : unit -> bool
  method get_shared_context : unit -> gl_context_t option
  method get_use_es : unit -> bool
  method is_legacy : unit -> bool
  method is_shared : gl_context_t -> bool
  method make_current : unit -> unit
  method realize : unit -> (bool, GError.t) result
  method set_allowed_apis : Enums.glapi -> unit
  method set_debug_enabled : bool -> unit
  method set_forward_compatible : bool -> unit
  method set_required_version : int -> int -> unit
  method set_use_es : int -> unit
  method as_gl_context : Raw.Gl_context.t
end

(** The methods, signals and properties of a [GdkMonitor]. *)
and monitor_t = object
  method on_invalidate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_connector : unit -> string option
  method get_description : unit -> string option
  method get_display : unit -> display_t
  method get_height_mm : unit -> int
  method get_manufacturer : unit -> string option
  method get_model : unit -> string option
  method get_refresh_rate : unit -> int
  method get_scale : unit -> float
  method get_scale_factor : unit -> int
  method get_subpixel_layout : unit -> Enums.subpixellayout
  method get_width_mm : unit -> int
  method is_valid : unit -> bool
  method as_monitor : Raw.Monitor.t
end

(** The methods, signals and properties of a [GdkSeat]. *)
and seat_t = object
  method on_device_added :
    ?after:bool ->
    callback:(device:device_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_device_removed :
    ?after:bool ->
    callback:(device:device_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_tool_added :
    ?after:bool ->
    callback:(tool:Device_tool.device_tool_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_tool_removed :
    ?after:bool ->
    callback:(tool:Device_tool.device_tool_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method get_capabilities : unit -> Enums.seatcapabilities
  method get_devices : Enums.seatcapabilities -> device_t list
  method get_display : unit -> display_t
  method get_keyboard : unit -> device_t option
  method get_pointer : unit -> device_t option
  method get_tools : unit -> Device_tool.device_tool_t list
  method as_seat : Raw.Seat.t
end

(** The methods, signals and properties of a [GdkSurface]. *)
and surface_t = object
  method on_enter_monitor :
    ?after:bool ->
    callback:(monitor:monitor_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_event :
    ?after:bool ->
    callback:(event:event_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method on_layout :
    ?after:bool ->
    callback:(width:int -> height:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method on_leave_monitor :
    ?after:bool ->
    callback:(monitor:monitor_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method beep : unit -> unit
  method create_cairo_context : unit -> cairo_context_t
  method create_gl_context : unit -> (gl_context_t, GError.t) result

  method create_similar_surface :
    Occairo.Enums.content -> int -> int -> Occairo.Surface.surface_t

  method create_vulkan_context : unit -> (vulkan_context_t, GError.t) result
  method destroy : unit -> unit
  method get_cursor : unit -> Cursor.cursor_t option
  method get_device_cursor : device_t -> Cursor.cursor_t option
  method get_display : unit -> display_t
  method get_frame_clock : unit -> Frame_clock.frame_clock_t
  method get_height : unit -> int
  method get_mapped : unit -> bool
  method get_scale : unit -> float
  method get_scale_factor : unit -> int
  method get_width : unit -> int
  method hide : unit -> unit
  method is_destroyed : unit -> bool
  method queue_render : unit -> unit
  method request_layout : unit -> unit
  method set_cursor : Cursor.cursor_t option -> unit
  method set_device_cursor : device_t -> Cursor.cursor_t -> unit
  method set_input_region : Occairo.Region.region_t option -> unit
  method set_opaque_region : Occairo.Region.region_t option -> unit
  method as_surface : Raw.Surface.t
end

(** The methods, signals and properties of a [GdkVulkanContext]. *)
and vulkan_context_t = object
  method on_images_updated :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method as_vulkan_context : Raw.Vulkan_context.t
end

(** Wraps a layer 1 handle, {!Ocgdk.Raw.App_launch_context.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GdkAppLaunchContext], give one already wrapped. *)
class app_launch_context : Raw.App_launch_context.t -> app_launch_context_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Cairo_context.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkCairoContext], give one already wrapped. *)

and cairo_context : Raw.Cairo_context.t -> cairo_context_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Clipboard.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkClipboard], give one already wrapped. *)

and clipboard : Raw.Clipboard.t -> clipboard_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Device.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkDevice], give one already wrapped. *)

and device : Raw.Device.t -> device_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Display.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkDisplay], give one already wrapped. *)

and display : Raw.Display.t -> display_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Draw_context.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkDrawContext], give one already wrapped. *)

and draw_context : Raw.Draw_context.t -> draw_context_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Event.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkEvent], give one already wrapped. *)

and event : Raw.Event.t -> event_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Gl_context.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkGLContext], give one already wrapped. *)

and gl_context : Raw.Gl_context.t -> gl_context_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Monitor.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkMonitor], give one already wrapped. *)

and monitor : Raw.Monitor.t -> monitor_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Seat.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkSeat], give one already wrapped. *)

and seat : Raw.Seat.t -> seat_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Surface.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkSurface], give one already wrapped. *)

and surface : Raw.Surface.t -> surface_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Vulkan_context.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GdkVulkanContext], give one already wrapped. *)

and vulkan_context : Raw.Vulkan_context.t -> vulkan_context_t

val new_popup : surface_t -> bool -> surface_t
val new_toplevel : display_t -> surface_t
