(* High-level class for ShortcutsGroup *)
class shortcuts_group (obj : Shortcuts_group.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Shortcuts_group.as_widget obj)

  method add_shortcut : 'p1. (#GShortcuts_shortcut.shortcuts_shortcut as 'p1) -> unit =
    fun shortcut ->
      let shortcut = shortcut#as_shortcuts_shortcut in
      (Shortcuts_group.add_shortcut obj shortcut)

  method accel_size_group = new GSize_group.size_group (Shortcuts_group.get_accel_size_group obj)
  method set_accel_size_group : 'a . (#GSize_group.size_group as 'a) -> unit  = fun v ->  Shortcuts_group.set_accel_size_group obj v#as_size_group

  method height = Shortcuts_group.get_height obj

  method title = Shortcuts_group.get_title obj
  method set_title v =  Shortcuts_group.set_title obj v

  method title_size_group = new GSize_group.size_group (Shortcuts_group.get_title_size_group obj)
  method set_title_size_group : 'a . (#GSize_group.size_group as 'a) -> unit  = fun v ->  Shortcuts_group.set_title_size_group obj v#as_size_group

  method view = Shortcuts_group.get_view obj
  method set_view v =  Shortcuts_group.set_view obj v

  method as_widget = (Shortcuts_group.as_widget obj)
    method as_shortcuts_group = obj
end

