class type key_event_t = object
    inherit GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.event_t
    method get_consumed_modifiers : unit -> Gdk_enums.modifiertype
    method get_keycode : unit -> int
    method get_keyval : unit -> int
    method get_layout : unit -> int
    method get_level : unit -> int
    method is_modifier : unit -> bool
    method matches : int -> Gdk_enums.modifiertype -> Gdk_enums.keymatch
    method as_key_event : Key_event.t
end

(* High-level class for KeyEvent *)
class key_event (obj : Key_event.t) : key_event_t = object (self)
  inherit GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.event (obj :> App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Event.t)

  method get_consumed_modifiers : unit -> Gdk_enums.modifiertype =
    fun () ->
      (Key_event.get_consumed_modifiers obj)

  method get_keycode : unit -> int =
    fun () ->
      (Key_event.get_keycode obj)

  method get_keyval : unit -> int =
    fun () ->
      (Key_event.get_keyval obj)

  method get_layout : unit -> int =
    fun () ->
      (Key_event.get_layout obj)

  method get_level : unit -> int =
    fun () ->
      (Key_event.get_level obj)

  method is_modifier : unit -> bool =
    fun () ->
      (Key_event.is_modifier obj)

  method matches : int -> Gdk_enums.modifiertype -> Gdk_enums.keymatch =
    fun keyval modifiers ->
      (Key_event.matches obj keyval modifiers)

    method as_key_event = obj
end

