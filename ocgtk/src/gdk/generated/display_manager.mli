(* GENERATED CODE - DO NOT EDIT *)
(* DisplayManager: DisplayManager *)

type t = [ `display_manager | `object_ ] Gobject.obj

(* Methods *)

external set_default_display :
  t ->
  App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
  .Display
  .t ->
  unit = "ml_gdk_display_manager_set_default_display"
(** Sets @display as the default display. *)

external open_display :
  t ->
  string option ->
  App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
  .Display
  .t
  option = "ml_gdk_display_manager_open_display"
(** Opens a display. *)

external list_displays :
  t ->
  App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
  .Display
  .t
  list = "ml_gdk_display_manager_list_displays"
(** List all currently open displays. *)

external get_default_display :
  t ->
  App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
  .Display
  .t
  option = "ml_gdk_display_manager_get_default_display"
(** Gets the default `GdkDisplay`. *)

(* Properties *)
