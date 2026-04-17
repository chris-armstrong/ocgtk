class type pad_event_t = object
  inherit
    GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .event_t

  method get_button : unit -> int
  method as_pad_event : Pad_event.t
end

(* High-level class for PadEvent *)
class pad_event (obj : Pad_event.t) : pad_event_t =
  object (self)
    inherit
      GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
      .event
        (obj
          :> App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
             .Event
             .t)

    method get_button : unit -> int = fun () -> Pad_event.get_button obj
    method as_pad_event = obj
  end
