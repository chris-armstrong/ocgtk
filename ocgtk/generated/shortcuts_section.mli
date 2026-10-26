class type shortcuts_section_t = object
  inherit Box.box_t

  method on_change_current_page :
    ?after:bool ->
    callback:(offset:int -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method add_group : Shortcuts_group.shortcuts_group_t -> unit
  method max_height : int
  method set_max_height : int -> unit
  method section_name : string
  method set_section_name : string -> unit
  method title : string
  method set_title : string -> unit
  method view_name : string
  method set_view_name : string -> unit
  method as_shortcuts_section : Raw.Shortcuts_section.t
end

class shortcuts_section : Raw.Shortcuts_section.t -> shortcuts_section_t
