(* GENERATED CODE - DO NOT EDIT *)
(* GrabBrokenEvent: GrabBrokenEvent *)

type t = [`grab_broken_event | `event] Gobject.obj

(* Methods *)
(** Checks whether the grab broken event is for an implicit grab. *)
external get_implicit : t -> bool = "ml_gdk_grab_broken_event_get_implicit"

(** Extracts the grab surface from a grab broken event. *)
external get_grab_surface : t -> App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Surface.t = "ml_gdk_grab_broken_event_get_grab_surface"

