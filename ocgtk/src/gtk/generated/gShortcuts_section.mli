class shortcuts_section : Shortcuts_section.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gshortcuts_section_signals.shortcuts_section_signals
    method add_group : #GShortcuts_group.shortcuts_group -> unit
    method max_height : int
    method set_max_height : int -> unit
    method section_name : string
    method set_section_name : string -> unit
    method title : string
    method set_title : string -> unit
    method view_name : string
    method set_view_name : string -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_shortcuts_section : Shortcuts_section.t
  end

