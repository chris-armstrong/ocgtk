class shortcuts_section : Shortcuts_section.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gshortcuts_section_signals.shortcuts_section_signals
    method add_group : #GShortcuts_group.shortcuts_group -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_shortcuts_section : Shortcuts_section.t
  end

