class type shortcuts_window_t = object
  inherit GApplication_and__window_and__window_group.window_t
  method on_close : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method on_search : callback:(unit -> unit) -> Gobject.Signal.handler_id
  method add_section : GShortcuts_section.shortcuts_section_t -> unit
  method section_name : string
  method set_section_name : string -> unit
  method view_name : string
  method set_view_name : string -> unit
  method as_shortcuts_window : Shortcuts_window.t
end

class shortcuts_window : Shortcuts_window.t -> shortcuts_window_t
