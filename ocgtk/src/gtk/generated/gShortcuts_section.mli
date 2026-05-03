class type shortcuts_section_t = object
  inherit GBox.box_t

  method on_change_current_page :
    callback:(object_:int -> bool) -> Gobject.Signal.handler_id

  method add_group : GShortcuts_group.shortcuts_group_t -> unit
  method max_height : int
  method set_max_height : int -> unit
  method section_name : string
  method set_section_name : string -> unit
  method title : string
  method set_title : string -> unit
  method view_name : string
  method set_view_name : string -> unit
  method as_shortcuts_section : Shortcuts_section.t
end

class shortcuts_section : Shortcuts_section.t -> shortcuts_section_t
