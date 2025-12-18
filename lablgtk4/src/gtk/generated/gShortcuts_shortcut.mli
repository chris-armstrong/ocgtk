class shortcuts_shortcut : Shortcuts_shortcut.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_shortcuts_shortcut : Shortcuts_shortcut.t
  end

