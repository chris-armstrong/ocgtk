(* High-level class for ShortcutsShortcut *)
class shortcuts_shortcut (obj : Shortcuts_shortcut.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Shortcuts_shortcut.as_widget obj)

  method accelerator = Shortcuts_shortcut.get_accelerator obj
  method set_accelerator v = Shortcuts_shortcut.set_accelerator obj v

  method action_name = Shortcuts_shortcut.get_action_name obj
  method set_action_name v = Shortcuts_shortcut.set_action_name obj v

  method icon_set = Shortcuts_shortcut.get_icon_set obj
  method set_icon_set v = Shortcuts_shortcut.set_icon_set obj v

  method subtitle = Shortcuts_shortcut.get_subtitle obj
  method set_subtitle v = Shortcuts_shortcut.set_subtitle obj v

  method subtitle_set = Shortcuts_shortcut.get_subtitle_set obj
  method set_subtitle_set v = Shortcuts_shortcut.set_subtitle_set obj v

  method title = Shortcuts_shortcut.get_title obj
  method set_title v = Shortcuts_shortcut.set_title obj v

  method as_widget = (Shortcuts_shortcut.as_widget obj)
    method as_shortcuts_shortcut = obj
end

