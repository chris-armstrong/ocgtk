class list_base : List_base.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method orientation : Gtk_enums.orientation
    method set_orientation : Gtk_enums.orientation -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_list_base : List_base.t
  end

