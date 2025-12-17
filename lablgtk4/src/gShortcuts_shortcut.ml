(* High-level class for ShortcutsShortcut *)
class shortcuts_shortcut (obj : Shortcuts_shortcut.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Shortcuts_shortcut.as_widget obj)

  method as_widget = (Shortcuts_shortcut.as_widget obj)
    method as_shortcuts_shortcut = obj
end

