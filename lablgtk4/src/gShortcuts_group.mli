class shortcuts_group : Shortcuts_group.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method add_shortcut : #GShortcuts_shortcut.shortcuts_shortcut -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_shortcuts_group : Shortcuts_group.t
  end

