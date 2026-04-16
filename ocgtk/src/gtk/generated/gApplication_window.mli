class type application_window_t = object
  inherit GApplication_and__window_and__window_group.window_t
  inherit Ocgtk_gio.Gio.Action_group.action_group_t
  inherit Ocgtk_gio.Gio.Action_map.action_map_t
  method get_help_overlay : unit -> GShortcuts_window.shortcuts_window_t option
  method get_id : unit -> int
  method get_show_menubar : unit -> bool
  method set_help_overlay : GShortcuts_window.shortcuts_window_t option -> unit
  method set_show_menubar : bool -> unit
  method as_application_window : Application_window.t
end

class application_window : Application_window.t -> application_window_t

val new_ :
  GApplication_and__window_and__window_group.application_t ->
  application_window_t
