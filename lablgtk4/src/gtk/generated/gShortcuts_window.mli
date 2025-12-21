class shortcuts_window : Shortcuts_window.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gshortcuts_window_signals.shortcuts_window_signals
    method add_section : #GShortcuts_section.shortcuts_section -> unit
    method section_name : string
    method set_section_name : string -> unit
    method view_name : string
    method set_view_name : string -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_shortcuts_window : Shortcuts_window.t
  end

