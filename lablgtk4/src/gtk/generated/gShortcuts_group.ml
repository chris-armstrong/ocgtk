(* High-level class for ShortcutsGroup *)
class shortcuts_group (obj : Shortcuts_group.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Shortcuts_group.as_widget obj)

  method add_shortcut : 'p1. (#GShortcuts_shortcut.shortcuts_shortcut as 'p1) -> unit =
    fun shortcut ->
      let shortcut = shortcut#as_shortcuts_shortcut in
      (Shortcuts_group.add_shortcut obj shortcut)

  method as_widget = (Shortcuts_group.as_widget obj)
    method as_shortcuts_group = obj
end

