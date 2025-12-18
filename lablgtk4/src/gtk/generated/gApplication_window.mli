class application_window : Application_window.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method show_menubar : bool
    method set_show_menubar : bool -> unit
    method get_help_overlay : unit -> GShortcuts_window.shortcuts_window option
    method get_id : unit -> int
    method set_help_overlay : #GShortcuts_window.shortcuts_window option -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_application_window : Application_window.t
  end

