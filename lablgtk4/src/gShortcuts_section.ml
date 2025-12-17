(* Signal class defined in gshortcuts_section_signals.ml *)

(* High-level class for ShortcutsSection *)
class shortcuts_section (obj : Shortcuts_section.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Shortcuts_section.as_widget obj)
  inherit Gshortcuts_section_signals.shortcuts_section_signals obj

  method add_group : 'p1. (#GShortcuts_group.shortcuts_group as 'p1) -> unit =
    fun group ->
      let group = group#as_shortcuts_group in
      (Shortcuts_section.add_group obj group)

  method as_widget = (Shortcuts_section.as_widget obj)
    method as_shortcuts_section = obj
end

