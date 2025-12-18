class color_dialog_button : Color_dialog_button.t ->
  object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.widget
    inherit Gcolor_dialog_button_signals.color_dialog_button_signals
    method get_dialog : unit -> GColor_dialog.color_dialog option
    method set_dialog : #GColor_dialog.color_dialog -> unit
  method as_widget : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t
    method as_color_dialog_button : Color_dialog_button.t
  end

