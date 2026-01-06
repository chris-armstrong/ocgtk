(* GENERATED CODE - DO NOT EDIT *)
(* ToplevelLayout: ToplevelLayout *)

(** The `GdkToplevelLayout` struct contains information that
is necessary to present a sovereign window on screen.

The `GdkToplevelLayout` struct is necessary for using
[method@Gdk.Toplevel.present].

Toplevel surfaces are sovereign windows that can be presented
to the user in various states (maximized, on all workspaces,
etc). *)
type t = [`toplevel_layout] Gobject.obj

(** Create a new ToplevelLayout *)
external new_ : unit -> t = "ml_gdk_toplevel_layout_new"

(* Methods *)
(** Decreases the reference count of @layout. *)
external unref : t -> unit = "ml_gdk_toplevel_layout_unref"

(** Sets whether the layout should allow the user
to resize the surface after it has been presented. *)
external set_resizable : t -> bool -> unit = "ml_gdk_toplevel_layout_set_resizable"

(** Sets whether the layout should cause the surface
to be maximized when presented. *)
external set_maximized : t -> bool -> unit = "ml_gdk_toplevel_layout_set_maximized"

(** Sets whether the layout should cause the surface
to be fullscreen when presented. *)
external set_fullscreen : t -> bool -> App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Monitor.t option -> unit = "ml_gdk_toplevel_layout_set_fullscreen"

(** Increases the reference count of @layout. *)
external ref : t -> t = "ml_gdk_toplevel_layout_ref"

(** Returns whether the layout should allow the user
to resize the surface. *)
external get_resizable : t -> bool = "ml_gdk_toplevel_layout_get_resizable"

(** If the layout specifies whether to the toplevel should go maximized,
the value pointed to by @maximized is set to %TRUE if it should go
fullscreen, or %FALSE, if it should go unmaximized. *)
external get_maximized : t -> bool * bool = "ml_gdk_toplevel_layout_get_maximized"

(** Returns the monitor that the layout is fullscreening
the surface on. *)
external get_fullscreen_monitor : t -> App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Monitor.t option = "ml_gdk_toplevel_layout_get_fullscreen_monitor"

(** If the layout specifies whether to the toplevel should go fullscreen,
the value pointed to by @fullscreen is set to %TRUE if it should go
fullscreen, or %FALSE, if it should go unfullscreen. *)
external get_fullscreen : t -> bool * bool = "ml_gdk_toplevel_layout_get_fullscreen"

(** Check whether @layout and @other has identical layout properties. *)
external equal : t -> t -> bool = "ml_gdk_toplevel_layout_equal"

(** Create a new `GdkToplevelLayout` and copy the contents of @layout into it. *)
external copy : t -> t = "ml_gdk_toplevel_layout_copy"

