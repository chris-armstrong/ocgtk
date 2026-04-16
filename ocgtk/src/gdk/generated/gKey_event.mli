class type key_event_t = object
  inherit
    GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .event_t

  method get_consumed_modifiers : unit -> Gdk_enums.modifiertype
  method get_keycode : unit -> int
  method get_keyval : unit -> int
  method get_layout : unit -> int
  method get_level : unit -> int
  method is_modifier : unit -> bool
  method matches : int -> Gdk_enums.modifiertype -> Gdk_enums.keymatch
  method as_key_event : Key_event.t
end

class key_event : Key_event.t -> key_event_t
