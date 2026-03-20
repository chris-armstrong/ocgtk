class type application_window_t = object
    method get_help_overlay : unit -> GShortcuts_window.shortcuts_window_t option
    method get_id : unit -> int
    method get_show_menubar : unit -> bool
    method set_help_overlay : GShortcuts_window.shortcuts_window_t option -> unit
    method set_show_menubar : bool -> unit
    method as_application_window : Application_window.t
end

class application_window : Application_window.t -> application_window_t

