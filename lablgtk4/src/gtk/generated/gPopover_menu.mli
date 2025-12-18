class popover_menu : Popover_menu.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method visible_submenu : string
    method set_visible_submenu : string -> unit
    method add_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> string -> bool
    method get_flags : unit -> Gtk_enums.popovermenuflags
    method remove_child : #GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget -> bool
    method set_flags : Gtk_enums.popovermenuflags -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_popover_menu : Popover_menu.t
  end

