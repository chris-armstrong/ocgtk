(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Surface from cyclic group App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context *)

class type surface_t =
  GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
  .surface_t

class surface =
  GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
  .surface

let new_popup
    (parent :
      GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
      .surface_t) (autohide : bool) : surface_t =
  let parent = parent#as_surface in
  let obj_ =
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Surface
    .new_popup parent autohide
  in
  new surface obj_

let new_toplevel
    (display :
      GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
      .display_t) : surface_t =
  let display = display#as_display in
  let obj_ =
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Surface
    .new_toplevel display
  in
  new surface obj_
