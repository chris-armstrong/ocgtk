class popover_menu_bar : Popover_menu_bar.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method add_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> string -> bool
    method remove_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> bool
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_popover_menu_bar : Popover_menu_bar.t
  end

