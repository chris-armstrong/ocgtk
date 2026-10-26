class type application_window_t = object
  inherit Application_and__window_and__window_group.window_t
  inherit Ocgio.Action_group.action_group_t
  inherit Ocgio.Action_map.action_map_t
  method get_help_overlay : unit -> Shortcuts_window.shortcuts_window_t option
  method get_id : unit -> int
  method get_show_menubar : unit -> bool
  method set_help_overlay : Shortcuts_window.shortcuts_window_t option -> unit
  method set_show_menubar : bool -> unit
  method as_application_window : Raw.Application_window.t
end

class application_window : Raw.Application_window.t -> application_window_t

val new_ :
  Application_and__window_and__window_group.application_t ->
  application_window_t
