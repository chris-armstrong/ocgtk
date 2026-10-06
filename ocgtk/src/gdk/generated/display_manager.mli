(* GENERATED CODE - DO NOT EDIT *)
(* DisplayManager: DisplayManager *)

[@@@ocaml.text
"Offers notification when displays appear or disappear.\n\n\
 [GdkDisplayManager] is a singleton object.\n\n\
 You can use [Gdk.DisplayManager.get] to obtain the [GdkDisplayManager]\n\
 singleton, but that should be rarely necessary. Typically, initializing\n\
 GTK opens a display that you can work with without ever accessing the\n\
 [GdkDisplayManager].\n\n\
 The GDK library can be built with support for multiple backends.\n\
 The [GdkDisplayManager] object determines which backend is used\n\
 at runtime.\n\n\
 In the rare case that you need to influence which of the backends\n\
 is being used, you can use [Gdk.set_allowed_backends]. Note\n\
 that you need to call this function before initializing GTK.\n\n\
 {b Backend-specific code}\n\n\
 When writing backend-specific code that is supposed to work with\n\
 multiple GDK backends, you have to consider both compile time and\n\
 runtime. At compile time, use the [GDK_WINDOWING_X11], [GDK_WINDOWING_WIN32]\n\
 macros, etc. to find out which backends are present in the GDK library\n\
 you are building your application against. At runtime, use type-check\n\
 macros like GDK_IS_X11_DISPLAY() to find out which backend is in use:\n\n\
 {[\n\
 #ifdef GDK_WINDOWING_X11\n\
\  if (GDK_IS_X11_DISPLAY (display))\n\
\    {\n\
\      // make X11-specific calls here\n\
\    }\n\
\  else\n\
 #endif\n\
 #ifdef GDK_WINDOWING_MACOS\n\
\  if (GDK_IS_MACOS_DISPLAY (display))\n\
\    {\n\
\      // make Quartz-specific calls here\n\
\    }\n\
\  else\n\
 #endif\n\
\  g_error (\"Unsupported GDK backend\");\n\
 ]}"]

type t = [ `display_manager | `object_ ] Gobject.obj

(* Methods *)

external set_default_display :
  t -> App_launch_context_cycle_de440b34.Display.t -> unit
  = "ml_gdk_display_manager_set_default_display"
(** Sets [display] as the default display. *)

external open_display :
  t -> string option -> App_launch_context_cycle_de440b34.Display.t option
  = "ml_gdk_display_manager_open_display"
(** Opens a display. *)

external list_displays : t -> App_launch_context_cycle_de440b34.Display.t list
  = "ml_gdk_display_manager_list_displays"
(** List all currently open displays. *)

external get_default_display :
  t -> App_launch_context_cycle_de440b34.Display.t option
  = "ml_gdk_display_manager_get_default_display"
(** Gets the default [GdkDisplay]. *)

(* Properties *)

val on_display_opened :
  ?after:bool ->
  t ->
  callback:(display:App_launch_context_cycle_de440b34.Display.t -> unit) ->
  Gobject.Signal.handler_id
