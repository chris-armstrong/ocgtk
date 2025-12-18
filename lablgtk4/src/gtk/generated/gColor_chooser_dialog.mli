class color_chooser_dialog : Color_chooser_dialog.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    method show_editor : bool
    method set_show_editor : bool -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_color_chooser_dialog : Color_chooser_dialog.t
  end

