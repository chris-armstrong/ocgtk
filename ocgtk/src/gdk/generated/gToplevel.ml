(* Signal class defined in gtoplevel_signals.ml *)

(* High-level class for Toplevel *)
class toplevel (obj : Toplevel.t) = object (self)
  inherit Gtoplevel_signals.toplevel_signals obj

  method get_state : unit -> Gdk_enums.toplevelstate =
    fun () ->
      (Toplevel.get_state obj)

  method inhibit_system_shortcuts : 'p1. (#GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.event as 'p1) option -> unit =
    fun event ->
      let event = Option.map (fun (c) -> c#as_event) event in
      (Toplevel.inhibit_system_shortcuts obj event)

  method lower : unit -> bool =
    fun () ->
      (Toplevel.lower obj)

  method minimize : unit -> bool =
    fun () ->
      (Toplevel.minimize obj)

  method present : Toplevel_layout.t -> unit =
    fun layout ->
      (Toplevel.present obj layout)

  method restore_system_shortcuts : unit -> unit =
    fun () ->
      (Toplevel.restore_system_shortcuts obj)

  method set_decorated : bool -> unit =
    fun decorated ->
      (Toplevel.set_decorated obj decorated)

  method set_deletable : bool -> unit =
    fun deletable ->
      (Toplevel.set_deletable obj deletable)

  method set_modal : bool -> unit =
    fun modal ->
      (Toplevel.set_modal obj modal)

  method set_startup_id : string -> unit =
    fun startup_id ->
      (Toplevel.set_startup_id obj startup_id)

  method set_title : string -> unit =
    fun title ->
      (Toplevel.set_title obj title)

  method set_transient_for : 'p1. (#GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.surface as 'p1) -> unit =
    fun parent ->
      let parent = parent#as_surface in
      (Toplevel.set_transient_for obj parent)

  method show_window_menu : 'p1. (#GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.event as 'p1) -> bool =
    fun event ->
      let event = event#as_event in
      (Toplevel.show_window_menu obj event)

  method supports_edge_constraints : unit -> bool =
    fun () ->
      (Toplevel.supports_edge_constraints obj)

  method titlebar_gesture : Gdk_enums.titlebargesture -> bool =
    fun gesture ->
      (Toplevel.titlebar_gesture obj gesture)

  method fullscreen_mode = Toplevel.get_fullscreen_mode obj
  method set_fullscreen_mode v =  Toplevel.set_fullscreen_mode obj v

  method shortcuts_inhibited = Toplevel.get_shortcuts_inhibited obj

    method as_toplevel = obj
end

