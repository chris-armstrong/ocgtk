class type toplevel_t = object
    inherit Gtoplevel_signals.toplevel_signals
    method begin_move : GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.device_t -> int -> float -> float -> UInt32.t -> unit
    method begin_resize : Gdk_enums.surfaceedge -> GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.device_t option -> int -> float -> float -> UInt32.t -> unit
    method focus : UInt32.t -> unit
    method get_state : unit -> Gdk_enums.toplevelstate
    method inhibit_system_shortcuts : GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.event_t option -> unit
    method lower : unit -> bool
    method minimize : unit -> bool
    method present : Toplevel_layout.t -> unit
    method restore_system_shortcuts : unit -> unit
    method set_decorated : bool -> unit
    method set_deletable : bool -> unit
    method set_icon_list : Texture.t list -> unit
    method set_modal : bool -> unit
    method set_startup_id : string -> unit
    method set_title : string -> unit
    method set_transient_for : GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.surface_t -> unit
    method show_window_menu : GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.event_t -> bool
    method supports_edge_constraints : unit -> bool
    method titlebar_gesture : Gdk_enums.titlebargesture -> bool
    method fullscreen_mode : Gdk_enums.fullscreenmode
    method set_fullscreen_mode : Gdk_enums.fullscreenmode -> unit
    method shortcuts_inhibited : bool
    method as_toplevel : Toplevel.t
end

class toplevel : Toplevel.t -> toplevel_t

