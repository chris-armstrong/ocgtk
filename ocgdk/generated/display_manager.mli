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
 ]}\n\n\
 Its methods, signals and properties are on {!class-type-display_manager_t}. \
 The functions it is built on are in {!Ocgdk.Raw.Display_manager}."]

class type display_manager_t = object
  method on_display_opened :
    ?after:bool ->
    callback:(display:App_launch_context_cycle_de440b34.display_t -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when a display is opened. *)

  method get_default_display :
    unit -> App_launch_context_cycle_de440b34.display_t option
  (** Gets the default [GdkDisplay]. *)

  method list_displays :
    unit -> App_launch_context_cycle_de440b34.display_t list
  (** List all currently open displays. *)

  method open_display :
    string option -> App_launch_context_cycle_de440b34.display_t option
  (** Opens a display. *)

  method set_default_display :
    App_launch_context_cycle_de440b34.display_t -> unit
  (** Sets [display] as the default display. *)

  method as_display_manager : Raw.Display_manager.t
end
  [@@ocaml.doc
    "{b The methods, signals and properties of a [DisplayManager].}\n\n\
     Offers notification when displays appear or disappear.\n\n\
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
     runtime. At compile time, use the [GDK_WINDOWING_X11], \
     [GDK_WINDOWING_WIN32]\n\
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

class display_manager : Raw.Display_manager.t -> display_manager_t
(** Wraps a raw handle of {!Ocgdk.Raw.Display_manager.t}. *)
