class font_chooser_widget : Font_chooser_widget.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_font_chooser_widget : Font_chooser_widget.t
  end

