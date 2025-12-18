(* Signal class defined in gshortcuts_window_signals.ml *)

(* High-level class for ShortcutsWindow *)
class shortcuts_window (obj : Shortcuts_window.t) = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget (Shortcuts_window.as_widget obj)
  inherit Gshortcuts_window_signals.shortcuts_window_signals obj

  method section_name = Shortcuts_window.get_section_name obj
  method set_section_name v = Shortcuts_window.set_section_name obj v

  method view_name = Shortcuts_window.get_view_name obj
  method set_view_name v = Shortcuts_window.set_view_name obj v

  method add_section : 'p1. (#GShortcuts_section.shortcuts_section as 'p1) -> unit =
    fun section ->
      let section = section#as_shortcuts_section in
      (Shortcuts_window.add_section obj section)

  method as_widget = (Shortcuts_window.as_widget obj)
    method as_shortcuts_window = obj
end

